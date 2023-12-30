package fun.tarrow.service;

import fun.tarrow.entity.Blog;

import java.util.List;

public interface BlogService {
    public List<Blog> getAllBlogs();
    public List<Blog> search(String key,String keyword);
    public void delete(int id);
}
