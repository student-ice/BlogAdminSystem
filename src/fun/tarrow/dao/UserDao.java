package fun.tarrow.dao;

import fun.tarrow.entity.User;

import java.util.List;

public interface UserDao {
    /**
     * 获取所有用户
     *
     * @return List<User> 用户列表
     */
    public List<User> getAllUsers();

    /**
     * 搜索用户
     *
     * @param key     搜索分类
     * @param keyword 搜索关键字
     * @return List<User> 搜索到的用户列表
     */
    public List<User> search(String key, String keyword);

    /**
     * 添加用户
     *
     * @param user 用户对象
     * @return Integer 添加成功返回1，否则返回0
     */
    public Integer save(User user);

    /**
     * 修改用户信息
     *
     * @param user 用户对象
     * @return Integer 修改成功返回1，否则返回0
     */
    public Integer update(User user);

    /**
     * 删除用户
     *
     * @param id 用户id
     * @return Integer 删除成功返回1，否则返回0
     */
    public Integer delete(Integer id);
}
