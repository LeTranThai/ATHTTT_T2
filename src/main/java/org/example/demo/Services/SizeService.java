package org.example.demo.Services;

import org.example.demo.dao.SizeDao;
import org.example.demo.model.Size;

public class SizeService {
    public static Size getSize(String code) {
        return SizeDao.findOneByCode(code);
    }
}
