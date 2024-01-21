package org.example.demo.ca.cer;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CertificateRowMapper {


    public static Certificate mapRow(ResultSet rs) throws SQLException {
        Certificate certificate = new Certificate();
        certificate.setId(rs.getInt("id"));
        certificate.setUserId(rs.getInt("userId"));
        certificate.setStartDate(rs.getTimestamp("startDate"));
        certificate.setEndDate(rs.getTimestamp("endDate"));
        if (rs.getBlob("data") != null) {
            certificate.setData(rs.getBlob("data").getBinaryStream());
        }
        certificate.setStatus(rs.getString("status"));
        certificate.setCreated_at(rs.getTimestamp("created_at"));
        certificate.setUpdate_at(rs.getTimestamp("updated_at"));
        return certificate;
    }
}
