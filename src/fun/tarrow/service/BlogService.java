package fun.tarrow.service;

import fun.tarrow.entity.Blog;

import java.util.List;


public interface BlogService {
    /**
     * 获取所有博客
     *
     * @return List<Blog> 返回所有博客
     */
    public List<Blog> getAllBlogs();

    /**
     * 搜索博客
     *
     * @param key     搜索分类
     * @param keyword 搜索关键字
     * @return List<Blog> 搜索到的博客列表
     */
    public List<Blog> search(String key, String keyword);

    /**
     * 删除博客
     *
     * @param id 博客id
     */
    public void delete(int id);
}
