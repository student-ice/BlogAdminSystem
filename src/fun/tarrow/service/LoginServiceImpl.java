package fun.tarrow.service;

import fun.tarrow.dao.LoginDaoImpl;
import fun.tarrow.entity.Admin;

public class LoginServiceImpl implements LoginService{
    private LoginDaoImpl loginDao = new LoginDaoImpl();
    @Override
    public boolean login(Admin admin) {
        return this.loginDao.login(admin);
    }
}
