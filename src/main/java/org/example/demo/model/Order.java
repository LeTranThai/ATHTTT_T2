package org.example.demo.model;

import java.io.Serializable;
import java.util.List;

public class Order extends ModelParent implements Serializable {
    private Account account;
    private String recipient;
    private String orderPhone;
    private String hash;
    private Integer billId;
    private String orderAddress;
    private String HASHMESS;
    private Status status;
    private List<OrderItem> items;
    public String getHash() {
        return hash;
    }
    public void setHash(String hash) {
        this.hash = hash;
    }
    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public Integer getBillId() {
        return billId;
    }

    public String getHashMess() {
        return HASHMESS;
    }

    public void setHashMess(String HASHMESS) {
        this.HASHMESS = HASHMESS;
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
                "account=" + account.getId() +
                ", recipient='" + recipient + '\'' +
                ", orderPhone='" + orderPhone + '\'' +
                ", billId=" + billId +
                ", orderAddress='" + orderAddress + '\'' +
                ", HASHMESS='" + HASHMESS + '\'' +
                ", status=" + status +
                ", items=" + items +
                '}';
    }
}
