package org.example.demo.Services;

import org.example.demo.dao.WareHouseDao;
import org.example.demo.model.Color;
import org.example.demo.model.Product;
import org.example.demo.model.Size;

import java.util.List;

public class WarehouseService {
    public static int getAmountProduct(Product product) {
        return WareHouseDao.sumAmountProduct(product);
    }
    public static int getAmountProductWithSizeAndColor(Product product, Size size, Color color) {
        return WareHouseDao.sumAmountProductWithSizeAndColor(product, size, color);
    }
    public static List<Color> getProductColors(Product product) {
        return WareHouseDao.findColorByProduct(product);
    }
    public static List<Size> getProductSizes(Product product) {
        return WareHouseDao.findSizeByProduct(product);
    }
}
