package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.entity.AccountEntity;

public interface IAccountDao extends IGenericDao<AccountEntity> {

    AccountEntity findAccountByUsernameAndPassword(String username,String password);
}
