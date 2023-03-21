package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.IAccountDao;
import com.example.quanlysv.servlet.dao.impl.AccountDaoImpl;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.service.IAuthService;

public class AuthServiceImpl implements IAuthService {


   private IAccountDao accountDao;

   public AuthServiceImpl(){
       accountDao = new AccountDaoImpl();
   }


    @Override
    public AccountEntity findAccountByUsernameAndPassword(String username, String password) {
        return accountDao.findAccountByUsernameAndPassword(username, password);
    }
}
