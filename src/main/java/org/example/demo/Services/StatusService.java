package org.example.demo.Services;

import org.example.demo.dao.StatusDao;
import org.example.demo.model.Status;

import java.util.List;

public class StatusService {
    public static Status getStatus(long id) {
        return StatusDao.findOneById(id);
    }

    public static Status getStatusByName(String name) {
        return StatusDao.findOneByName(name);
    }

    public static List<Status> getAllStatusWithStatusGroup(String statusGroup) {
        return StatusDao.findByStatusGroup(statusGroup);
    }
}
