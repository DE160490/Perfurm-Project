/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProductDAO() {
        try {
            conn = new DBContext().getConnection();
        } catch (Exception e) {
        }

    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "Select * from tbProduct ";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Product getProductByID(String id) {

        try {
            String query = "select *from tbProduct\n"
                    + "where ProductID = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9));
                return p;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public List<Product> getProductbyCateID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from tbProduct\n"
                + "where CateID = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Category> getAllCategory() {

        List<Category> list = new ArrayList<>();
        String query = "Select *from tbCate";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Category getCateNameByID(String cid) {
        try {
            String query = "select CateName from tbCate\n"
                    + "where CateID = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            int id = Integer.parseInt(cid);
            while (rs.next()) {
                Category c = new Category(id, rs.getString(1));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(String pid) {
        String query = "delete from tbProduct\n"
                + "where ProductID = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getTotalProduct() {
        String query = "select count(*) from tbProduct";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "Select * from tbProduct\n"
                + "Order By ProductID\n"
                + "OFFSET ? ROW FETCH NEXT 5 ROW ONLY;";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertProduct(String ProductName, String PurchasePrice, String SalePrice,
            String Image, String Description, String CateID, String Quantity, String LastDayImport) {

        String query = "insert into tbProduct\n"
                + "values(?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductName);
            ps.setString(2, PurchasePrice);
            ps.setString(3, SalePrice);
            ps.setString(4, Image);
            ps.setString(5, Description);
            ps.setString(6, CateID);
            ps.setString(7, Quantity);
            ps.setString(8, LastDayImport);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getTop8ProductByCate(String i) {
        List<Product> list = new ArrayList<>();

        String query = "select top 8 ProductID,\n"
                + "ProductName, \n"
                + "SalePrice, \n"
                + "Image, \n"
                + "CateID from tbProduct\n"
                + "Where CateID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, i);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void UpdateProduct(String productID, String ProductName, String PurchasePrice, String SalePrice,
            String Image, String Description, String CateID, String Quantity, String LastDayImport) {

        String query = "Update tbProduct\n"
                + "Set [ProductName] = ?,\n"
                + "[PurchasePrice] = ?,\n"
                + "[SalePrice] = ?,\n"
                + "[Image] = ?,\n"
                + "[Description] = ?,\n"
                + "[CateID] = ?,\n"
                + "[Quantity] = ?,\n"
                + "[LastDayImport] = ?\n"
                + "where ProductID = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductName);
            ps.setString(2, PurchasePrice);
            ps.setString(3, SalePrice);
            ps.setString(4, Image);
            ps.setString(5, Description);
            ps.setString(6, CateID);
            ps.setString(7, Quantity);
            ps.setString(8, LastDayImport);
            ps.setString(9, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select *from tbProduct\n"
                + "where [ProductName] like ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
        }

        return list;
    }
    
    public List<Product> getTop8(){
        List<Product> list = new ArrayList<>();
        String query = "select top 8 *from tbProduct";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
        }

        return list;
    }
}
