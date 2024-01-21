package org.example.demo.ca.cer;

import org.example.demo.Services.LoginService;
import org.example.demo.Services.OrderServices;
import org.example.demo.dao.SignDao;
import org.example.demo.model.Account;
import org.example.demo.model.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet(name = "CancelCer", value = "/cancel")
public class CancelCer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pass = request.getParameter("pass-user");
        Account account = (Account) request.getSession().getAttribute("account");
        if (account.getPassword().equals(hashString(pass))){
            SignDao.updateCerById(Integer.parseInt(id));
            LoginService.login(request, response);
            response.sendRedirect("my-account");
        } else {
            List<Order> orders = OrderServices.getAllByAccount(account);
            List<Certificate> certificates = SignDao.getAllCerByAccountId(account.getId());
            request.setAttribute("message", "Sai mật khẩu");
            request.setAttribute("orders", orders);
            request.setAttribute("signsByIdA", certificates);
            request.setAttribute("pageName", "Tài khoản");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/myAccount.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public static String hashString(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(input.getBytes());
            byte[] digest = md.digest();
            BigInteger bigInt = new BigInteger(1, digest);
            String hashText = bigInt.toString(16);
            while (hashText.length() < 32) {
                hashText = "0" + hashText;
            }
            return hashText;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
