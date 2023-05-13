package control;

import dao.LoginDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpControl extends HttpServlet { 
  
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("su_username");
        String pass = request.getParameter("su_password");
        String repass = request.getParameter("repass");
        if (!pass.equals(repass)) {
            request.setAttribute("error", "Account creation failed");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            LoginDAO dao = new LoginDAO();
            boolean a = dao.checkAccountExits(user);
            if (a) {
                //dc signup
                dao.signup(user, pass);
                request.setAttribute("error", "Successful account creation");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                //Day ve trang login
                request.setAttribute("error", "Account already exists");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
    }
}