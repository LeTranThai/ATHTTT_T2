package org.example.demo.Services;

import org.example.demo.dao.SignDao;
import org.example.demo.dao.VerificationDao;
import org.example.demo.model.Account;
import org.example.demo.model.Sign;
import org.example.demo.model.Verification;

public class VerificationService {
    public static long add(Verification verification) {
        return VerificationDao.add(verification);
    }
}
