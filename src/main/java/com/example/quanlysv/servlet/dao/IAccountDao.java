package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.entity.AccountEntity;

public interface IAccountDao extends IGenericDao<AccountEntity> {

    AccountEntity findAccountByUsernameAndPassword(String username);

    boolean changePass(String pass, String username);


    boolean changePassDefault(String pass, String username);

    boolean checkPassDefault(String username, String pass);
}
