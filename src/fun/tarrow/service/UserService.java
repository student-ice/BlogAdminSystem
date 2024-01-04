package fun.tarrow.service;

import fun.tarrow.entity.User;

import java.util.List;

public interface UserService {
    /**
     * 获取所有用户
     *
     * @return List<User> 所有用户列表
     */
    List<User> getAllUsers();

    /**
     * 搜索用户
     *
     * @param key     搜索分类
     * @param keyword 搜索关键字
     * @return List<User> 搜索到的用户列表
     */
    List<User> search(String key, String keyword);

    /**
     * 添加用户
     *
     * @param user 用户对象
     */
    void save(User user);

    /**
     * 修改用户信息
     *
     * @param user 用户对象
     */
    void update(User user);

    /**
     * 删除用户
     *
     * @param id 要删除的用户id
     */
    void delete(Integer id);
}
