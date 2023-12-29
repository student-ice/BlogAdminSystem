package fun.tarrow.service;

import fun.tarrow.entity.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers();
    public List<User> search(String key,String keyword);
    public void save(User user);
}
