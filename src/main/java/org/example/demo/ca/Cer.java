package org.example.demo.ca;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.StampingProperties;
import com.itextpdf.signatures.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.x509.X509V3CertificateGenerator;
import org.example.demo.dao.SignDao;
import org.example.demo.model.Account;

import javax.security.auth.x500.X500Principal;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

public class Cer {
    static {
        if (Security.getProvider("BC") == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static boolean checkDigitalSignPDF(InputStream inputStream, String nameSign) throws IOException, GeneralSecurityException {
        PdfDocument pdfDoc = new PdfDocument(new PdfReader(inputStream));
        SignatureUtil signUtil = new SignatureUtil(pdfDoc);
        List<String> names = signUtil.getSignatureNames();
        for (String name : names) {
            if (name.equals(nameSign)) {
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
                boolean signatureIntegrityAndAuthenticity = pkcs7.verifySignatureIntegrityAndAuthenticity();
                System.out.println(signatureIntegrityAndAuthenticity);
                pdfDoc.close();
                inputStream.close();
                return signatureIntegrityAndAuthenticity;
            }
        }
        pdfDoc.close();
        inputStream.close();
        return false;
    }
    public static InputStream signBill(InputStream billInputStream, InputStream keyStoreInputStream, String keyStorePassword) {
        try {
            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);

            KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
            char[] keystorePassArr = keyStorePassword.toCharArray();
            ks.load(keyStoreInputStream, keystorePassArr);


            Enumeration<String> aliases = ks.aliases();

            String alias = aliases.nextElement();
            char[] privateKeyPassArr = keyStorePassword.toCharArray();
            PrivateKey pk = (PrivateKey) ks.getKey(alias, privateKeyPassArr);
            Certificate[] chain = ks.getCertificateChain(alias);

            if (chain == null || chain.length == 0) {
                throw new IllegalArgumentException("Certificate chain is empty or null.");
            }

            IExternalDigest digest = new BouncyCastleDigest();
            if (billInputStream.markSupported()) {
                billInputStream.reset();
            } else {
                byte[] billBytes = billInputStream.readAllBytes();
                billInputStream = new ByteArrayInputStream(billBytes);
            }
            PdfReader reader = new PdfReader(billInputStream);
            ByteArrayOutputStream signedPdfStream = new ByteArrayOutputStream();
            PdfSigner signer = new PdfSigner(reader, signedPdfStream, new StampingProperties());

            // appearance
            createSignApperience(signer);

            IExternalSignature signature = new PrivateKeySignature(pk, DigestAlgorithms.SHA256, provider.getName());
            signer.signDetached(digest, signature, chain, null, null, null, 0, PdfSigner.CryptoStandard.CMS);

            reader.close();

            return new ByteArrayInputStream(signedPdfStream.toByteArray());
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean verifyKeyStorePassword(InputStream keystoreInputStream, String password) {
        try {
            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(keystoreInputStream, password.toCharArray());
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void generateAndLoadKeyStore2(Account acc, String password, String urFullname, String orgName, String orgUnit, String city, String state, String countryCode) {
        try {
            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);
            // Generate Key Pair
            KeyPair keyPair = generateKeyPair();
            // Create self-signed X.509 certificate
            X509Certificate[] cert = generateCertificate(keyPair, urFullname, orgUnit, orgName, city, state, countryCode);

            // Load keystore
            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(null, password.toCharArray());

            // Set key entry in the keystore
            ks.setKeyEntry("shop", keyPair.getPrivate(), password.toCharArray(), cert);

            // Save keystore to ByteArrayOutputStream
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ks.store(baos, password.toCharArray());
            InputStream andLoadKeyStore = new ByteArrayInputStream(baos.toByteArray());

            saveCertificateToDatabase((int) acc.getId(), andLoadKeyStore);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private static X509Certificate[] generateCertificate(KeyPair keyPair, String urFullname, String orgUnit, String orgName, String city, String state, String countryCode) throws GeneralSecurityException, IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        X509V3CertificateGenerator certGen = new X509V3CertificateGenerator();
        X500Principal dnName = new X500Principal("CN=" + urFullname + ", OU=" + orgUnit + ", O=" + orgName + ", L=" + city + ", ST=" + state + ", C=" + countryCode);
        certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
        certGen.setSubjectDN(dnName);
        certGen.setIssuerDN(dnName);
        certGen.setNotBefore(new Date(System.currentTimeMillis()));
        certGen.setNotAfter(new Date(System.currentTimeMillis() + 365 * 24 * 60 * 60 * 1000L));
        certGen.setPublicKey(keyPair.getPublic());
        certGen.setSignatureAlgorithm("SHA256withRSA");

        X509Certificate cert = certGen.generate(keyPair.getPrivate(), "BC");
        return new X509Certificate[]{cert};
    }

    private static KeyPair generateKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048);
        return keyPairGenerator.generateKeyPair();
    }


    private static void createSignApperience(PdfSigner signer) {
        Rectangle rect = new Rectangle(36, 250, 200, 100);
        PdfSignatureAppearance appearance = signer.getSignatureAppearance();
        appearance.setReason("Bill").setLocation("HCM")
                // Specify if the appearance before field is signed will be used
                // as a background for the signed field. The "false" value is the default value.
                .setReuseAppearance(false).setPageRect(rect).setPageNumber(1);
        signer.setFieldName("sig");
    }



    public static void saveCertificateToDatabase(int id, InputStream byteArr) {
        SignDao.updateCer(id);
        org.example.demo.ca.cer.Certificate myCertificate = new org.example.demo.ca.cer.Certificate();
        myCertificate.setUserId(id);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        myCertificate.setStartDate(timestamp);
        myCertificate.setData(byteArr);
        myCertificate.setCreated_at(timestamp);
        myCertificate.setUpdate_at(timestamp);
        myCertificate.setEndDate(new Timestamp(System.currentTimeMillis() + 365 * 24 * 60 * 60 * 1000L));
        myCertificate.setStatus("SELECTED");
        SignDao.add(myCertificate);
    }







}

