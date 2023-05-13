/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String query = "select a.UserID, b.Name, b.Address, b.Phone, a.Role\n"
                + "from tbAccount a, tbUserInfor b\n"
                + "where a.UserID = b.UserID";
                
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getName(String userName) {
        try {
            String query = "select b.Name\n"
                    + "from tbAccount a, tbUserInfor b\n"
                    + "where a.UserID = b.UserID and a.UserName = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public String getAddress(String userName) {
        try {
            String query = "select b.Address\n"
                    + "from tbAccount a, tbUserInfor b\n"
                    + "where a.UserID = b.UserID and a.UserName = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public String getPhone(String userName) {
        try {
            String query = "select b.Phone\n"
                    + "from tbAccount a, tbUserInfor b\n"
                    + "where a.UserID = b.UserID and a.UserName = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }
}
