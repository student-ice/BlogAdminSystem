package fun.tarrow.service;

import fun.tarrow.dao.BlogDao;
import fun.tarrow.dao.BlogDaoImpl;
import fun.tarrow.entity.Blog;

import java.util.List;

public class BlogServiceImpl implements BlogService{
    private final BlogDaoImpl blogDaoImpl = new BlogDaoImpl();
    @Override
    public List<Blog> getAllBlogs() {
        return this.blogDaoImpl.getAllBlogs();
    }

    @Override
    public List<Blog> search(String key, String keyword) {
        return this.blogDaoImpl.search(key,keyword);
    }

    @Override
    public void delete(int id) {
        Integer result = this.blogDaoImpl.delete(id);
        if  (result != 1){
            // 删除失败
            throw new RuntimeException("删除失败");
        }
    }
}
