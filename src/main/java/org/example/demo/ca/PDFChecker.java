package org.example.demo.ca;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.signatures.CertificateInfo;
import com.itextpdf.signatures.PdfPKCS7;
import com.itextpdf.signatures.SignatureUtil;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.tsp.TimeStampToken;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.Security;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PDFChecker {


    public static boolean checkDigitalSignPDF(InputStream inputStream, String nameSign) throws IOException, GeneralSecurityException {
        PdfDocument pdfDoc = new PdfDocument(new PdfReader(inputStream));
        SignatureUtil signUtil = new SignatureUtil(pdfDoc);
        List<String> names = signUtil.getSignatureNames();
        for (String name : names) {
            if (name.equals(nameSign)) {
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
                boolean signatureIntegrityAndAuthenticity = pkcs7.verifySignatureIntegrityAndAuthenticity();
//                    boolean digitalSignCheck = checkDigitalSign(pkcs7, publicKey);
//                    System.out.println("Digital sign check OK? " + digitalSignCheck);
                pdfDoc.close();
                inputStream.close();
                return signatureIntegrityAndAuthenticity;
            }
        }
        pdfDoc.close();
        inputStream.close();
        return false;
    }

    public static Map<String, String> verifyPdfSignedIntegrity(InputStream resource) throws IOException, GeneralSecurityException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        PdfDocument pdfDoc = new PdfDocument(new PdfReader(resource));
        SignatureUtil signUtil = new SignatureUtil(pdfDoc);
        List<String> names = signUtil.getSignatureNames();
        Map<String, String> map = new HashMap<>();
        for (String name : names) {
            map.put("name", name);
            map.put("revision", signUtil.getRevision(name) + " of " + signUtil.getTotalRevisions());
            map.put("signatureCoversWholeDocument", signUtil.signatureCoversWholeDocument(name) + "");
            try {
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
                X509Certificate signingCertificate = pkcs7.getSigningCertificate();
                CertificateInfo.X500Name subjectFields = CertificateInfo.getSubjectFields(pkcs7.getSigningCertificate());
                map.put("getHashAlgorithm", pkcs7.getHashAlgorithm());
                map.put("getEncryptionAlgorithm", pkcs7.getEncryptionAlgorithm());
                map.put("getFilterSubtype", pkcs7.getFilterSubtype() + "");
                if (pkcs7.getSignName() != null) {
                    map.put("getSignName", pkcs7.getSignName());
                }
                SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SS");
                if (pkcs7.getTimeStampDate() != null) {
                    map.put("getTimeStampDate", date_format.format(pkcs7.getTimeStampDate().getTime()));
                    TimeStampToken ts = pkcs7.getTimeStampToken();
                    if (ts != null) {
                        map.put("getTimeStampToken", ts.getTimeStampInfo().getTsa().toString());
                        map.put("verifyTimestampImprint", pkcs7.verifyTimestampImprint() + "");
                    }

                }

                map.put("ST", subjectFields.getField("ST"));
                map.put("CN", subjectFields.getField("CN"));
                map.put("OU", subjectFields.getField("OU"));
                map.put("O", subjectFields.getField("O"));
                map.put("L", subjectFields.getField("L"));
                map.put("C", subjectFields.getField("C"));
                map.put("signatureIntegrityAndAuthenticity", pkcs7.verifySignatureIntegrityAndAuthenticity() + "");
                map.put("seri", signingCertificate.getSerialNumber() + "");
                map.put("before", signingCertificate.getNotBefore() + "");
                map.put("after", signingCertificate.getNotAfter() + "");
                map.put("algorithm", signingCertificate.getSigAlgName() + "");
                map.put("version", signingCertificate.getVersion() + "");
                map.put("subjectDN", signingCertificate.getSubjectDN() + "");
                map.put("issuerDN", signingCertificate.getIssuerDN() + "");
                map.put("location", pkcs7.getLocation());
                map.put("reason", pkcs7.getReason());
                map.put("subjectAlternativeNames", signingCertificate.getSubjectAlternativeNames() + "");
            } catch (InvalidKeyException e) {
                System.out.println("Error reading signature data for " + name + ": Invalid Key - " + e.getMessage());
            } catch (Exception e) {
                System.out.println("Error reading signature data for " + name + ": " + e.getMessage());
            }
        }
        pdfDoc.close();
        resource.close();
        return map;
    }

}
