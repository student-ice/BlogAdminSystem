package fun.tarrow.dao;

import fun.tarrow.entity.Blog;

import java.util.List;

public interface BlogDao {
    public List<Blog> getAllBlogs();
    public List<Blog> search(String key, String keyword);
    public Integer delete(int id);

}
