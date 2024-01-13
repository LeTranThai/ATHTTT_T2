package org.example.demo.Services;

import org.example.demo.dao.OrderItemDao;
import org.example.demo.model.*;
import org.example.demo.dao.OrderDao;

import java.util.ArrayList;
import java.util.List;

public class OrderServices {

    public static long add(Order order) {
        return OrderDao.add(order);
    }

    public static Order getOrderByAccountAndStatus(Account account, Status status) {
        return OrderDao.findOneByAccountAndStatus(account, status);
    }

    public static long add(Account account, Cart cart, String recipient, String phone, String address, String hashMess) {
        Order order = new Order();
        order.setAccount(account);
        order.setRecipient(recipient);
        order.setOrderPhone(phone);
        order.setOrderAddress(address);
        order.setHashMess(hashMess);
        long orderId = OrderServices.add(order);
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setColor(cartItem.getColor());
            orderItem.setSize(cartItem.getSize());
            orderItem.setPrice(cartItem.getProduct().getPrice());
            orderItem.setDiscount(cartItem.getProduct().getDiscount());
            orderItem.setAmount(cartItem.getAmount());
            OrderItemDao.add(orderItem);
        }
        return orderId;
    }

    public static Order getOrder(long id) {
        return OrderDao.findOneById(id);
    }

    public static List<Order> getAll() {
        return OrderDao.findAll();
    }
    public static List<Order> getAllByAccount(Account account) {
        return OrderDao.findAllByAccount(account);
    }

    public static boolean deleteOrder(long id) {
        return OrderDao.delete(id);
    }

    public static boolean updateStatus(Order order) {
        return OrderDao.update(order);
    }

    public static void main(String[] args) {
        // get all method
        List<Order> listOrder = OrderServices.getAll();
        for (Order order : listOrder) {
            System.out.println(order);
        }
    }
}
