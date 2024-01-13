package org.example.demo.model;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

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
        String key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsLpiev9NiqPO9fE2jonluzHfBMDi9UTAo76wq3PqGSi72N2Lj1MCxV9O/ZCiT+M5C7rThNGz/MJUuS/h95JOg9XEYgLLESzQyDzQK2kz62wlAjuX4NzncZb+bPBKZ4NXAna8MFuSlREgkv/CTjAE5DrPqyqIZA9K1BbRTWb5w/tJIdsep/tRsFJCQdHwQkrM3o3zleplKA8+it7bLcTqnFeFRvOL/9Jv6m6i6dzygXNk1CA+4z7NfMMJoENqUu9aL89eeFU6XSgpWba9B6bbIP+Qf9JJckbIwCw86JQMoB8Zz6/eABDHnwPGg6i6GQ1ExCYlmXpMng/tabFKdU0jsQIDAQAB";
        String text ="AJ6yoQM3EFOuV7dewLUpDjh9kon1iKo58LntME64taIUUq231JotEFgmwNTxeTo8EZAp8cvLYbQy91d34D4LnUMoccq0fJSRhvdFVClSklMOUJ+3SiOk+1qg1HtRWFzFSjmADEKIsHr4+iMKNCFWdiWdCkKXYeWHJ4MS4LElWm2r39b5RbRf6P8nzLx04fBZMBPXmGg/7juu8YOWH6u+/Cp0/XNX7MKI/q7IH/OQp4p5lss0WpI3ASeAAMwyNQ7gUI9zs2BTLm/d4M5lsSDKSDLa9UHcc6vjhz+l/NyshBsl1zs/KyqpuRuNgv3GmXGf1paVC3C1oVEH6OqsEYu1zA==";
        System.out.println(rsa.decryptFromBase64(text, key));
    }
}
