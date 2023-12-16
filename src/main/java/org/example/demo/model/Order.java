package org.example.demo.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Order extends ModelParent implements Serializable {
    private Account account;
    private String recipient;
    private String orderPhone;
    private String orderAddress;
    private String hashMess;
    private Status status;
    private List<OrderItem> items;

    public String getHashMess() {
        return hashMess;
    }

    public void setHashMess(String hashMess) {
        this.hashMess = hashMess;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
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

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Order{" +
                "account=" + account +
                ", recipient='" + recipient + '\'' +
                ", orderPhone='" + orderPhone + '\'' +
                ", orderAddress='" + orderAddress + '\'' +
                ", hashMess='" + hashMess + '\'' +
                ", status=" + status +
                ", items=" + items +
                '}';
    }
}
