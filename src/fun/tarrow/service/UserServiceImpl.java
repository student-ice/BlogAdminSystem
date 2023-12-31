package fun.tarrow.service;

import fun.tarrow.dao.UserDaoImpl;
import fun.tarrow.entity.User;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDaoImpl userDaoImpl = new UserDaoImpl();

    public List<User> getAllUsers() {
        return this.userDaoImpl.getAllUsers();
    }

    @Override
    public List<User> search(String key,String keyword) {
        if (keyword.equals(""))
            return this.getAllUsers();
        return this.userDaoImpl.search(key,keyword);
    }

    @Override
    public void save(User user) {
         Integer save = this.userDaoImpl.save(user);
         if (save != 1) {
            throw new RuntimeException("添加失败");
         }
    }

    @Override
    public void update(User user) {
        Integer save = this.userDaoImpl.update(user);
        if (save != 1) {
            throw new RuntimeException("修改失败");
        }
    }

    @Override
    public void delete(Integer id) {
        Integer save = this.userDaoImpl.delete(id);
        if (save != 1) {
            throw new RuntimeException("删除失败");
        }
    }
}