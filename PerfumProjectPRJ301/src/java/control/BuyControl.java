package control;

import dao.ProductDAO;
import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BuyControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO p = new ProductDAO();
        List<Product> list = p.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null)
            for(Cookie o:arr)
                if(o.getName().equals("cart")){
                    txt = txt + o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
        String num = request.getParameter("num");
        String id = request.getParameter("id");
        
        if(txt.isEmpty())
            txt = id +":"+num;
        else txt = txt + "/" + id + ":" + num;
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24*60*60);
        response.addCookie(c);
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if(listItem.isEmpty()) n = 0;
        else n = listItem.size();
        request.setAttribute("size", n);
        request.setAttribute("data", listItem);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}