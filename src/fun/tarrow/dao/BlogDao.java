package fun.tarrow.dao;

import fun.tarrow.entity.Blog;

import java.util.List;

public interface BlogDao {
    /**
     * 获取所有博客
     *
     * @return List<Blog> 博客列表
     */
    List<Blog> getAllBlogs();

    /**
     * 搜索博客
     *
     * @param key     搜索分类
     * @param keyword 搜索关键字
     * @return List<Blog> 搜索到的博客列表
     */
    List<Blog> search(String key, String keyword);

    /**
     * 删除博客
     *
     * @param id 博客id
     * @return Integer 删除结果 1：成功 0：失败
     */
    Integer delete(int id);

}
