package org.example.demo.Services;

import org.example.demo.dao.ColorDao;
import org.example.demo.model.Color;

public class ColorService {
    public static Color getColor(String code) {
        return ColorDao.findOneByCode(code);
    }
}
