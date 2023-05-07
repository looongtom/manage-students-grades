package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.IAccountDao;
import com.example.quanlysv.servlet.dao.impl.AccountDaoImpl;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.service.IAuthService;
import org.mindrot.jbcrypt.BCrypt;

public class AuthServiceImpl implements IAuthService {


   private IAccountDao accountDao;

   public AuthServiceImpl(){
       accountDao = new AccountDaoImpl();
   }


    @Override
    public AccountEntity findAccountByUsernameAndPassword(String username, String password) {
        return accountDao.findAccountByUsernameAndPassword(username, password);
    }

    @Override
    public boolean checkPassword(String username, String password) {
        AccountEntity accountEntity = findAccountByUsernameAndPassword(username, password);
        if(accountEntity == null) return false;
        String passwordOld =accountEntity.getPassword();
        return BCrypt.checkpw(password, passwordOld);
    }

    @Override
    public boolean changePassword(String username, String pass) {
          try {
              String passwordNew = BCrypt.hashpw(pass, BCrypt.gensalt());
              return accountDao.changePass(passwordNew, username);
          }catch (Exception e){
              System.out.println(e.getMessage());
              return false;
          }
    }
}
