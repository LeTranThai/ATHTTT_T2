package org.example.demo.Services;

import org.example.demo.model.Brand;
import org.example.demo.dao.BrandDao;

import java.util.List;

public class BrandService {
    public static List<Brand> getBrandList() {
        return BrandDao.findAll();
    }

    public static boolean addBrand(String id, String name) {
        return false;
    }

    public static boolean deleteBrand(String id) {
        return false;
    }

    public static boolean updateBrand(String id, String name) {
        return false;
    }
}
