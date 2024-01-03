package fun.tarrow.dao;

import fun.tarrow.entity.Blog;
import fun.tarrow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDaoImpl implements BlogDao{
    @Override
    public List<Blog> getAllBlogs() {
        Connection conn = DBUtil.getConnection();
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT b.id,b.title,b.content,b.author_id,u.username,b.view_count,b.comment_count,b.created_at,b.updated_at,b.status FROM blog b,  user u WHERE b.author_id = u.id";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setAuthorId(rs.getInt("author_id"));
                blog.setAuthorName(rs.getString("username"));
                blog.setViewCount(rs.getInt("view_count"));
                blog.setCommentCount(rs.getInt("comment_count"));
                blog.setCreateTime(rs.getString("created_at"));
                blog.setUpdateTime(rs.getString("updated_at"));
                blog.setStatus(rs.getString("status"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,rs);
        }

        return blogs;
    }

    @Override
    public List<Blog> search(String key, String keyword) {
        Connection conn = DBUtil.getConnection();
        List<Blog> blogs = new ArrayList<>();
        String sql = "select * from (SELECT b.id,b.title,b.content,b.author_id,u.username,b.view_count,b.comment_count,b.created_at,b.updated_at,b.status FROM blog b,  user u WHERE b.author_id = u.id) as bu where "+key+" like '%" +keyword +"%'";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setAuthorId(rs.getInt("author_id"));
                blog.setAuthorName(rs.getString("username"));
                blog.setViewCount(rs.getInt("view_count"));
                blog.setCommentCount(rs.getInt("comment_count"));
                blog.setCreateTime(rs.getString("created_at"));
                blog.setUpdateTime(rs.getString("updated_at"));
                blog.setStatus(rs.getString("status"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,rs);
        }

        return blogs;
    }

    @Override
    public Integer delete(int id) {
        Connection conn = DBUtil.getConnection();
        String sql = "delete from blog where id = " + id;
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = conn.prepareStatement(sql);
            result = statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn, statement, null);
        }

        return result;
    }
}
