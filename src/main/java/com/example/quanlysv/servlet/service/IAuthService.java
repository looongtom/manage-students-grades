package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.entity.AccountEntity;

public interface IAuthService {
    AccountEntity findAccountByUsernameAndPassword(String username, String password);


    boolean checkPassword(String username, String password);

    boolean changePassword(String username, String pass);

}
