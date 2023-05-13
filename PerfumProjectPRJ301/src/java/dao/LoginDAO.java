package dao;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author PC
 */
public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean checkUser(String user) {
        try {
            String query = "select * from tbAccount \n"
                    + "where UserName = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next())  return true;
        } catch (Exception e) {
        }

        return false;
    }

    public Account checkLogin(String user, String pass) {
        try {
            String query = "select * from tbAccount \n"
                    + "where UserName = ? and Password = ? ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            
            UserDAO userdao = new UserDAO();
            rs = ps.executeQuery();
            while (rs.next()) {

                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        userdao.getName(user),
                        userdao.getAddress(user),
                        userdao.getPhone(user)
                );
                return a;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public boolean checkAccountExits(String user) {

        try {
            String query = "select * from tbAccount where username = ?  ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }

        return true;
    }

    public Account signup(String user, String pass) {
        try {
            String query = "insert into tbAccount values(?,?, 0)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return null;
    }
}