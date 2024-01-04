package fun.tarrow.dao;

import fun.tarrow.entity.Admin;

public interface LoginDao {
    /**
     * 登录
     * @param admin 管理员对象
     * @return boolean 登录成功返回 true，否则返回 false
     */
    boolean login(Admin admin);
}
