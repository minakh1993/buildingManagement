package com.websystique.springmvc.security.paswordEncryption;

import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;

public class md5 {

    public String md5(String password) {
        String myHash = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myHash;
    }

}
