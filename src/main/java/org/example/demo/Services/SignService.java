package org.example.demo.Services;

import org.example.demo.dao.ProductDao;
import org.example.demo.dao.SignDao;
import org.example.demo.model.Account;
import org.example.demo.model.Product;
import org.example.demo.model.Sign;

import java.sql.Timestamp;
import java.util.List;

public class SignService {
    public static Sign getSignWithAccountAndIsActive(Account account, Boolean isActive) {
        return SignDao.findOneByAccountIdAndIsActive(account.getId(), isActive);
    }

    public static boolean update(Sign sign) {
        return SignDao.update(sign);
    }

    public static long add(Sign sign) {
        return SignDao.add(sign);
    }

    public static List<Sign> getSigns(Account account) {
        return SignDao.findOneByAccountId(account.getId());
    }

    public static boolean updateStatusKey(String signId, boolean isActive, Timestamp timestamp) {
        return SignDao.updateStatusKey(signId, isActive, timestamp);
    }

}
