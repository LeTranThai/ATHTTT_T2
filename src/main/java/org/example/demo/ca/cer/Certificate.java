package org.example.demo.ca.cer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Certificate implements Serializable {
    private Integer userId;
    private Timestamp startDate;
    private Timestamp endDate;
    private InputStream data;
    private String status;
    private Integer id;
    private Timestamp created_at;
    private Timestamp update_at;

}
