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

public class ProcessControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO p = new ProductDAO();
        List<Product> list = p.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt = txt + o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt,list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id,num=0;
        try {
            id = Integer.parseInt(id_raw);
            num = Integer.parseInt(num_raw);
            Product pro = p.getProductByID(id_raw);
            int numberStore = pro.getQuantity();
            if(num == -1 && (cart.getQuantityById(id) <= 1))
                cart.removeItemById(id);
            else if(num == 1 && cart.getQuantityById(id) >= numberStore) num = 0;
            cart.setQuantityById(id, num);
        } catch (Exception e) {
        }
        List<Item> item = cart.getItems();
        txt = "";
        if(item.size() > 0){
            txt=item.get(0).getProduct().getProductID() + ":"
                    + item.get(0).getQuantity();
            for(int i = 1; i< item.size(); i++)
                txt+="/"+item.get(i).getProduct().getProductID() + ":"
                    + item.get(i).getQuantity();
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*60*24);
        response.addCookie(c);
        int n;
        if (item.isEmpty()) {
            n = 0;
        } else {
            n = item.size();
        }
        request.setAttribute("size", n);
        request.setAttribute("data", item);
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
