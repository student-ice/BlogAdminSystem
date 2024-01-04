package fun.tarrow.dao;

import com.sun.org.apache.xpath.internal.operations.Bool;
import fun.tarrow.entity.Admin;
import fun.tarrow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDaoImpl implements LoginDao{
    @Override
    public boolean login(Admin admin) {
        boolean result = false;
        Connection conn = DBUtil.getConnection();
        String sql = "select * from admin where username = ? and password = ?";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement(sql);
            statement.setString(1,admin.getUsername());
            statement.setString(2,admin.getPassword());
            rs = statement.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.release(conn,statement,null);
        }
        return result;
    }
}
