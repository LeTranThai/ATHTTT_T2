package org.example.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connect {
    private static Connect instance;
    private static Connection connection;

    private Connect() {
        String url = "jdbc:mysql://localhost:3306/clothers_shop";
        String userName = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,userName,password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connect getInstance() {
        try {
            if (instance == null|| connection.isClosed()) {
                instance = new Connect();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return instance;
    }

    public  Connection getConnection() {

        //this.connection
        return connection;
    }
    public static void main(String[] args) {
        //test connection
        Connect connect = Connect.getInstance();
        Connection connection = connect.getConnection();
        if(connection != null){
            System.out.println("Connect success");
        }else{
            System.out.println("Connect fail");

        }
    }
}
