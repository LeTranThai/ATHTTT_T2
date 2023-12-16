package org.example.demo.Services;

import org.example.demo.dao.SignDao;
import org.example.demo.model.Account;
import org.example.demo.model.Sign;

public class SignService {
    public static  Sign getSignWithAccountAndIsActive(Account account, Boolean isActive) {
        return SignDao.findOneByAccountIdAndIsActive(account.getId(), isActive);
    }
    public static boolean update(Sign sign) {
        return SignDao.update(sign);
    }
    public static long add(Sign sign) {
        return SignDao.add(sign);
    }
}
