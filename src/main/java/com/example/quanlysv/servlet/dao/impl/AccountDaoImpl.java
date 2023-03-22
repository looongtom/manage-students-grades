package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IAccountDao;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.mapper.AccountMapper;

import java.util.List;

public class AccountDaoImpl extends AbstractDao<AccountEntity> implements IAccountDao {


    @Override
    public AccountEntity findAccountByUsernameAndPassword(String username, String password) {
        String sql = "select * from taikhoan where username=? and password=?";
        List<AccountEntity> accountEntities = findByProperties(sql, new AccountMapper(), username, password);
        return accountEntities.isEmpty() ? null : accountEntities.get(0);
    }
}
