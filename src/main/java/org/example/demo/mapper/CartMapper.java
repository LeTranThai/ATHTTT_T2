package org.example.demo.mapper;


import org.example.demo.dao.AccountDao;
import org.example.demo.dao.CartItemDao;
import org.example.demo.model.Cart;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper {
    public static Cart mapRow(ResultSet rs) throws SQLException {
        Cart cart = new Cart();
        cart.setId(rs.getLong("ID"));
        cart.setAccount(AccountDao.findOneById(rs.getLong("ACCOUNT_ID")));
        cart.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        cart.setCreatedBy(rs.getString("CREATED_BY"));
        cart.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        cart.setModifiedBy(rs.getString("MODIFIED_BY"));
        cart.setCartItems(CartItemDao.findById(cart.getId()));
        return cart;
    }
}
