/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class ManagerControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        
        if(indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
//        int previous = index - 1;
//        int next = index + 1;
//        
        //Get data from DAO
        ProductDAO dao = new ProductDAO();
        List<Product> listProduct = dao.getAllProduct();
        
        List<Category> listCate = dao.getAllCategory();
        int count = dao.getTotalProduct();
        int endPage = count / 5;
        if(count % 5 != 0){
            endPage++;
        }
        List<Product> listPage = dao.pagingProduct(index);
        //Set data 
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCate", listCate);
        request.setAttribute("listPage", listPage);
        request.setAttribute("endP", endPage);
//        request.setAttribute("pre", previous);
//        request.setAttribute("next", next);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}
