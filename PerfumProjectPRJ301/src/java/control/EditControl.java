/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class EditControl extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("pid");
        ProductDAO dao = new ProductDAO();
        Product detail = dao.getProductByID(id);
        List<Category> list = dao.getAllCategory();
        
        request.setAttribute("detail", detail);
        request.setAttribute("listCate", list);
        request.getRequestDispatcher("Edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String sid = request.getParameter("id");
        String sname = request.getParameter("name");
        String spurchaseprice = request.getParameter("purchaseprice");
        String ssaleprice = request.getParameter("saleprice");
        String simage = request.getParameter("image");
        String sdescription = request.getParameter("description");
        String scateid = request.getParameter("category");
        String squantity = request.getParameter("quantity");
        String sdaytoimport = request.getParameter("daytoimport");
        
        ProductDAO dao = new ProductDAO();
        dao.UpdateProduct(sid, sname, spurchaseprice, ssaleprice, simage, sdescription, scateid, squantity, sdaytoimport);
        response.sendRedirect("manager");
    }
}
