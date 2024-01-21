package org.example.demo.bills;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bill  implements Serializable {
    private Integer userId;
    private transient InputStream data;
    private transient InputStream dataSign;
    private String status;
    private Integer cerId;
    private Integer id;
    private Timestamp created_at;
    private Timestamp update_at;
}

