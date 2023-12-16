package org.example.demo.Services;

import org.example.demo.dao.CategoryDao;
import org.example.demo.model.Category;

import java.util.List;

public class CategoryService {
    public static List<Category> getAllCategory() {
        return CategoryDao.findAll();
    }
}
