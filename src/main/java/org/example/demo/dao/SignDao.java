package org.example.demo.dao;

import org.example.demo.ca.bills.Bill;
import org.example.demo.ca.bills.BillRowMapper;
import org.example.demo.ca.cer.Certificate;
import org.example.demo.ca.cer.CertificateRowMapper;
import org.example.demo.mapper.SignMapper;
import org.example.demo.model.Sign;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SignDao {

    public static Sign findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Sign sign = null;
        try {
            String query = "SELECT * FROM sign WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = SignMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static Bill findOneByBillId(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Bill sign = null;
        try {
            String query = "SELECT * FROM bills WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = BillRowMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static Certificate findOneByCerId(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Certificate sign = null;
        try {
            String query = "SELECT * FROM certificates WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = CertificateRowMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }
    public static Certificate findOneCerByUserId(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Certificate sign = null;
        try {
            String query = "SELECT * FROM certificates WHERE userId = ? and status = 'SELECTED'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = CertificateRowMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }
    public static List<Certificate> getAllCerByAccountId(long id) {
        List<Certificate> signs = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM certificates WHERE userId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Certificate sign = CertificateRowMapper.mapRow(resultSet);
                signs.add(sign);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return signs;
    }
    public static List<Sign> findOneByAccountId(long id) {
        List<Sign> signs = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM sign WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Sign sign = SignMapper.mapRow(resultSet);
                signs.add(sign);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return signs;
    }

    public static Sign findOneByAccountIdAndIsActive(long id, boolean isActive) {
        Connection connection = Connect.getInstance().getConnection();
        Sign sign = null;
        try {
            String query = "SELECT * FROM sign WHERE ACCOUNT_ID = ? AND IS_ACTIVE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.setBoolean(2, isActive);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = SignMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static int add(Sign sign) {
        String sql = "INSERT INTO sign(ACCOUNT_ID, SIGN, KEY_SIZE, IS_ACTIVE, CREATED_DATE,MODIFIED_DATE) VALUES(?, ?, ?, ?,?,?);";
        Connection connection = Connect.getInstance().getConnection();
        int id = -1;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, sign.getAccount().getId());
            preparedStatement.setString(2, sign.getSign());
            preparedStatement.setInt(3, sign.getKeySize());
            preparedStatement.setBoolean(4, sign.isActive());
            preparedStatement.setTimestamp(5, sign.getCreatedDate());
            preparedStatement.setTimestamp(6, sign.getModifiedDate());
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

    public static boolean delete(long id) {
        String sql = "DELETE FROM sign WHERE ID = ?";
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

    public static boolean update(Sign sign) {
        String sql = "UPDATE sign SET SIGN = ?, KEY_SIZE = ?, IS_ACTIVE = ?  WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, sign.getSign());
            preparedStatement.setInt(2, sign.getKeySize());
            preparedStatement.setBoolean(3, sign.isActive());
            preparedStatement.setLong(4, sign.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateStatusKey(String signId, boolean isActive, Timestamp timestamp) {
        String sql = "UPDATE sign SET IS_ACTIVE = ?, MODIFIED_DATE = ?  WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBoolean(1, isActive);
            preparedStatement.setTimestamp(2, timestamp);
            preparedStatement.setString(3, signId);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateStatusKeyByIdA(boolean isActive, String idA, Timestamp timestamp) {
        String sql = "UPDATE sign SET IS_ACTIVE = ?, MODIFIED_DATE = ?  WHERE ACCOUNT_ID = ? AND MODIFIED_DATE IS NULL";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBoolean(1, isActive);
            preparedStatement.setTimestamp(2, timestamp);
            preparedStatement.setString(3, idA);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateCer(int idA) {
        String sql = "update certificates set status = 'EXPIRED' where userId = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idA);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateCerById(int idA) {
        String sql = "update certificates set status = 'EXPIRED' where id = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idA);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateBill(InputStream sign, int id) {
        String sql = " update bills set status='đã ký' ,  data_sign = ?, updated_at = ? where id = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBlob(1, sign);
            preparedStatement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            preparedStatement.setInt(3, id);

            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateBillData(InputStream sign, long id) {
        String sql = " update bills set data = ? where id = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBlob(1, sign);
            preparedStatement.setLong(2, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static long add(Bill bill) {
        Connection connection = Connect.getInstance().getConnection();
        long id = -1;
        try {
            connection.setAutoCommit(false);
            String query = "INSERT INTO bills(userid, created_at, updated_at, data_sign, status, cerId) VALUES ( ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, bill.getUserId());
            preparedStatement.setTimestamp(2, bill.getCreated_at());
            preparedStatement.setTimestamp(3, bill.getUpdate_at());
            preparedStatement.setBlob(4, bill.getDataSign());
            preparedStatement.setString(5, bill.getStatus());
            preparedStatement.setInt(6, bill.getCerId());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getLong(1);
            }
            connection.commit();
            connection.setAutoCommit(true);
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }


    public static long add(Certificate certificate) {
        Connection connection = Connect.getInstance().getConnection();
        long id = -1;
        try {
            connection.setAutoCommit(false);
            String query = "insert into certificates (userId,startDate,endDate,data,status,created_at,updated_at) values ( ?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, certificate.getUserId());
            preparedStatement.setTimestamp(2, certificate.getStartDate());
            preparedStatement.setTimestamp(3, certificate.getEndDate());
            preparedStatement.setBlob(4, certificate.getData());
            preparedStatement.setString(5, certificate.getStatus());
            preparedStatement.setTimestamp(6, certificate.getCreated_at());
            preparedStatement.setTimestamp(7, certificate.getUpdate_at());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getLong(1);
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

