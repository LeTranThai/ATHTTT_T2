package org.example.demo.ca;

import org.example.demo.Services.LoginService;
import org.example.demo.Services.OrderServices;
import org.example.demo.ca.cer.Certificate;
import org.example.demo.dao.SignDao;
import org.example.demo.model.Account;
import org.example.demo.model.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet(value = {"/create-cer"})
public class CreateCertificate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String cn = req.getParameter("CN");
            String ou = req.getParameter("OU");
            String o = req.getParameter("O");
            String l = req.getParameter("L");
            String s = req.getParameter("S");
            String c = req.getParameter("C");
            String passKeyStore = req.getParameter("passKeyStore");
            String passUser = req.getParameter("pass-user");
            Account account = (Account) req.getSession().getAttribute("account");
            if (account.getPassword().equals(hashString(passUser))) {
                Cer.generateAndLoadKeyStore2(account, passKeyStore, cn, ou, o, s, l, c);
                resp.sendRedirect("/my-account");
            } else {
                LoginService.login(req, resp);
                req.setAttribute("message", "Sai mật khẩu");
                List<Order> orders = OrderServices.getAllByAccount(account);
                List<Certificate> certificates = SignDao.getAllCerByAccountId(account.getId());
                req.setAttribute("orders", orders);
                req.setAttribute("signsByIdA", certificates);
                req.setAttribute("pageName", "Tài khoản");
                RequestDispatcher rd = req.getRequestDispatcher("/views/web/myAccount.jsp");
                rd.forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
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
