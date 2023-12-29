package fun.tarrow.dao;

import fun.tarrow.entity.User;

import java.util.List;

public interface UserDao {
    public List<User> getAllUsers();
    public List<User> search(String key,String keyword);

    public Integer save(User user);
}
