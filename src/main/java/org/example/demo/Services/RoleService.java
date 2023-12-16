package org.example.demo.Services;

import org.example.demo.dao.RoleDao;
import org.example.demo.model.Role;

import java.util.List;

public class RoleService {
    public static List<Role> getRoles() {
        return RoleDao.findAll();
    }

    public static Role getRole(long id) {
        return RoleDao.findOneById(id);
    }

    public static Role getRoleByName(String name) {
        return RoleDao.findOneByName(name);
    }

}
