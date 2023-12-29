package fun.tarrow.dao;

import fun.tarrow.entity.*;
import fun.tarrow.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements  UserDao{

    public List<User> getAllUsers(){
        Connection conn = DBUtil.getConnection();
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setTelephone(rs.getString("telephone"));
                user.setGender(rs.getString("gender"));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,rs);
        }

        return users;
    }

    @Override
    public List<User> search(String key,String keyword) {
        Connection conn = DBUtil.getConnection();
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE " + key + " like '%" + keyword + "%'";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setTelephone(rs.getString("telephone"));
                user.setGender(rs.getString("gender"));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,rs);
        }

        return users;
    }

    @Override
    public Integer save(User user) {
        Connection conn = DBUtil.getConnection();
        List<User> users = new ArrayList<>();
        String sql = "insert into user(id,username,password,email,telephone,gender) values (?,?,?,?,?,?)";
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = conn.prepareStatement(sql);
            statement.setInt(1,user.getId());
            statement.setString(2,user.getUsername());
            statement.setString(3,user.getPassword());
            statement.setString(4,user.getEmail());
            statement.setString(5,user.getTelephone());
            statement.setString(6,user.getGender());
            result = statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,null );
        }

        return result;
    }
}