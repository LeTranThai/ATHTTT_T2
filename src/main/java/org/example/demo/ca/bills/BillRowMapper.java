package org.example.demo.ca.bills;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillRowMapper {


    public static Bill mapRow(ResultSet rs) throws SQLException {
        Bill bill = new Bill();
        bill.setUserId(rs.getInt("userId"));
        if (rs.getBlob("data") != null) {
            bill.setData(rs.getBlob("data").getBinaryStream());
        }
        bill.setCreated_at(rs.getTimestamp("created_at"));
        bill.setUpdate_at(rs.getTimestamp("updated_at"));
        bill.setStatus(rs.getString("status"));
        if (rs.getBlob("data_sign") != null) {
            bill.setDataSign(rs.getBlob("data_sign").getBinaryStream());
        }
        bill.setId(rs.getInt("id"));
        bill.setCerId(rs.getInt("cerId"));
        return bill;
    }
}
