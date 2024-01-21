package org.example.demo.ca;

import org.example.demo.model.Order;
import org.example.demo.model.OrderItem;

import java.util.List;

public class Order2 {
    private Order order;
    private List<OrderItem> orderItemList;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    @Override
    public String toString() {
        return "Order2{" + "order=" + order + ", orderItemList=" + orderItemList + '}';
    }
}
