package org.example.demo.model;

import javax.crypto.Cipher;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class RSA {

    private KeyPair keyPair;
    private PublicKey publickey;
    private PrivateKey privatekey;

    public void generateKeyPair(int size) {
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(size);
            keyPair = keyPairGenerator.generateKeyPair();
            publickey = keyPair.getPublic();
            privatekey = keyPair.getPrivate();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public String exportPublickey() {
        return Base64.getEncoder().encodeToString(publickey.getEncoded());
    }

    public String exportPrivatekey() {
        return Base64.getEncoder().encodeToString(privatekey.getEncoded());
    }

    public PublicKey importPublicKey(String publicKey) {
        try {
            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKey);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePublic(keySpec);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid Public Key");
        }
    }

    public PrivateKey importPrivateKey(String privateKey) {
        try {
            byte[] privateKeyBytes = Base64.getDecoder().decode(privateKey);
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePrivate(keySpec);

        } catch (Exception e) {

            throw new IllegalArgumentException("Invalid Private Key");
        }
    }

    public String encryptToBase64(String text, String privateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, importPrivateKey(privateKey));
        byte[] plaintext = text.getBytes(StandardCharsets.UTF_8);
        byte[] cipherText = cipher.doFinal(plaintext);
        return Base64.getEncoder().encodeToString(cipherText);
    }

    public String decryptFromBase64(String text, String publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, importPublicKey(publicKey));
        byte[] plaintext = cipher.doFinal(Base64.getDecoder().decode(text));
        return new String(plaintext, StandardCharsets.UTF_8);
    }
    public String exportPublicKey() {
        return Base64.getEncoder().encodeToString(publickey.getEncoded());
    }
    public String exportPrivateKey() {
        return Base64.getEncoder().encodeToString(privatekey.getEncoded());
    }


    public static void main(String[] args) throws Exception {
        RSA rsa = new RSA();
        String key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuOB+Lk0P0fkyWQAKLcqi/ZsmUaV7dFWTHzQ6R605wYFp7IzdEejMMlTcMWVVNofjPiid09ln6lhcNPdvbVnHumXRWXE52VQQKYcYjfl5i5kqFssjDeIyAgvg7nK25h3sPGEJquhcD0GijlGTDGFHa9GYrpQWHG1VbBcXUmkCAa5JekX8xlCbr7Pn2hCbR9pvwI+zJKMMxl0XLis5Q0PxSaI69979pv8J8W1SgtNExtB+MHpPE/Q0xa6kf5WQDXtHpA1rS8/OnanE7f/BFlEBn0mWFNIqL6s/iSzoRyCRr2FVGprFl9vwuomJG92XDL7X6jSUP7o24fME9wbLY2n/uwIDAQAB";
        String text ="csareNRqV3+UH2o6qF1lhvlamHEXX1S186QtFSn4aeAyHzdqSR2hKzxLe/rTFSg2rU9kISA8tEpKSwzDa/klU0w3N5/hoWEPtL4X2N0+/63NT3udcCicQBD86rOUNitE69U9cQbkDdX/dYv0mwFaQxsetSoNaQv258fr4nJJQQuBx/T1K/2TALpwxpua8oie3pG8Pv539ZAyQiPU8P2VaLF7Goe4o26g6wsfR8DqC01mywGoBcL19RSObwGCc1lom5ZT2MstOdJTduqFO9dZ1s2GwtipQw9ZOKnsS4gbMR0tU+/qGli7lBMctJ6z4BQVlfEKe8QnCkRJpgKgMZnZtQ==";
        System.out.println(rsa.decryptFromBase64(text, key));
    }
}
