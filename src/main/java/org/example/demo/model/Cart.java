package org.example.demo.model;

import java.io.Serializable;
import java.util.List;

public class Cart extends ModelParent implements Serializable {
   private Account account;
   private List<CartItem> cartItems;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
    public static String removeTrailingComma(String input) {
        if (input != null && input.length() > 0 && input.endsWith(",")) {
            StringBuilder sb = new StringBuilder(input);
            sb.deleteCharAt(sb.length() - 1);
            return sb.toString();
        }
        return input;
    }

    public static void main(String[] args) {
        System.out.println(removeTrailingComma("77, 78,"));
    }
}
