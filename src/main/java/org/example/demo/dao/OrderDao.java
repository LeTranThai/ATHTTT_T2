package org.example.demo.dao;

import org.example.demo.mapper.OrderMapper;
import org.example.demo.model.Account;
import org.example.demo.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public static List<Order> findAll() {
        List<Order> orders = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM orders";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = OrderMapper.mapRow(resultSet);
                orders.add(order);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static List<Order> findAllByAccount(Account account) {
        List<Order> orders = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM orders WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, account.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = OrderMapper.mapRow(resultSet);
                orders.add(order);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static Order findOneByAccount(Account account) {
        Connection connection = Connect.getInstance().getConnection();
        Order order = null;
        try {
            String query = "SELECT * FROM orders WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, account.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order = OrderMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static Order findOneByAccountAndStatus(Account account, int status) {
        Connection connection = Connect.getInstance().getConnection();
        Order order = null;
        try {
            String query = "SELECT * FROM orders WHERE ACCOUNT_ID = ? AND STATUS_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, account.getId());
            preparedStatement.setLong(2, status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order = OrderMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static Order findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Order order = null;
        try {
            String query = "SELECT * FROM orders WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order = OrderMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static void main(String[] args) {
        System.out.println(findOneById(26));
    }

    public static boolean delete(long id) {
        OrderItemDao.delete(id);
        String sql = "DELETE FROM orders WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Order order) {
        String sql = "UPDATE orders SET STATUS_ID = ? WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, order.getStatus().getId());
            preparedStatement.setLong(2, order.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateHash(String HASH, long id) {
        String sql = "UPDATE orders SET hash = ? WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, HASH);
            preparedStatement.setLong(2, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateStatus(int idStatus, long id) {
        String sql = "UPDATE orders SET STATUS_ID = ? WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, idStatus);
            preparedStatement.setLong(2, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateOrder(int idStatus, long id) {
        String sql = "UPDATE orders SET billId = ? WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, idStatus);
            preparedStatement.setLong(2, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static long add(Order order) {
        String sql = "INSERT INTO orders(ACCOUNT_ID, RECIPIENT, ORDERS_PHONE, ORDERS_ADDRESS, HASHMESS) VALUES(?,?, ?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        long id = -1;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, order.getAccount().getId());
            preparedStatement.setString(2, order.getRecipient());
            preparedStatement.setString(3, order.getOrderPhone());
            preparedStatement.setString(4, order.getOrderAddress());
            preparedStatement.setString(5, order.getHashMess());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
            connection.setAutoCommit(true);
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }


}

