package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProfileDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProfileDAO() {
        try {
            conn = new context.DBContext().getConnection();
        } catch (Exception e) {
        }

    }

//    Hiện thị thông tin người dùng lấy từ data khi đã đăng nhập và vào thông tin chi tiết 
    public Account getProfileUser(String username) {
        try {
            String query = "select [UserName], [Password], [Name], [Address], [Phone]\n"
                    + "from tbAccount a inner join tbUserInfor b\n"
                    + "on a.UserID =b.UserID and a.UserName = ? ";

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getNString(4), rs.getNString(5));
                return a;
            }
        } catch (Exception e) {
        }

        return null;
    }

//    Cập nhật password cho tài khoản
    public void UpdatePassword(String username, String password) {
        String query = "Update tbAccount \n"
                + "set Password = ? \n"
                + "Where UserName = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
//            ps.setNString(1, password);
//            ps.setNString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

//    Cập nhật thông tin cho tài khoản
    public void UpdateProfile(int userID, String name, String phone, String address) {
        String query = "Update tbUserInfor \n"
                + "set Name = ?,\n"
                + "Phone = ?,\n"
                + "Address = ? \n"
                + "Where UserID = ? ";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
//            ps.setNString(1, name);
//            ps.setNString(2, phone);
//            ps.setNString(3, address);
            ps.setInt(4, userID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getUserID(String username) {
//            Lấy UserID khi có Username nhằm lấy chính xác ID của đối tượng cần cập nhật
        int UserID = 0;
        String id = null;
        try {
            String query = "Select UserID from tbAccount\n"
                    + "Where UserName = ?";

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserID = rs.getInt(1);
            }
            return UserID;
        } catch (Exception e) {
            e.getMessage();
            return 0;
        }
    }

}
