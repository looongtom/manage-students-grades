package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IAccountDao;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.mapper.AccountMapper;

import java.util.List;

public class AccountDaoImpl extends AbstractDao<AccountEntity> implements IAccountDao {


    @Override
    public AccountEntity findAccountByUsernameAndPassword(String username, String password) {
        String sql = "select tk.id as id, tk.username as username, " +
                "tk.password as password, tk.email as email, " +
                "tk.role_id as roleId from taikhoan as tk where username=?";
        List<AccountEntity> accountEntities = findByProperties(sql, new AccountMapper(), username);
        return accountEntities.isEmpty() ? null : accountEntities.get(0);
    }

    @Override
    public boolean changePass(String pass, String username) {
        try {
            String sql = "update taikhoan set password =? where username = ?";
            return update(sql, pass, username );
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
