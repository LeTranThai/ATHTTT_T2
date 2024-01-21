package org.example.demo.response;

import org.example.demo.model.OrderItem;

import java.sql.Timestamp;
import java.util.List;

public class OrderResponse {
    private long id;
    private String recipient;
    private String orderPhone;
    private String orderAddress;
    private Timestamp createdDate;
    private String status;
    private List<OrderItem> orderItems;

    private double price;

    public OrderResponse() {

    }

    public OrderResponse(long id, String recipient, String orderPhone, String orderAddress, Timestamp createdDate, String status, double price) {
        this.id = id;
        this.recipient = recipient;
        this.orderPhone = orderPhone;
        this.orderAddress = orderAddress;
        this.createdDate = createdDate;
        this.status = status;
        this.price = price;
    }

    public OrderResponse(long id, String recipient, String orderPhone, String orderAddress, List<OrderItem> orderItems) {
        this.id = id;
        this.recipient = recipient;
        this.orderPhone = orderPhone;
        this.orderAddress = orderAddress;
        this.orderItems = orderItems;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
