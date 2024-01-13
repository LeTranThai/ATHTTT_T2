package org.example.demo.controller.web;

import org.example.demo.Services.OrderServices;
import org.example.demo.Services.SignService;
import org.example.demo.model.Account;
import org.example.demo.model.Order;
import org.example.demo.model.Sign;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CancelKeyControll", value = "/cancel-key")
public class CancelKeyControll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String signId = request.getParameter("signId");
        Date currentDate = new Date();
        Timestamp timestampFromDate = new Timestamp(currentDate.getTime());
        boolean status = SignService.updateStatusKey(signId, false, timestampFromDate);
        String message = "Hủy khóa thất bại, vui lòng thử lại sau";
        if (status) {
            message = "Hủy khóa thành công!";
        }
        request.setAttribute("message", message);
        Account account = (Account) request.getSession().getAttribute("account");
        List<Order> orders = OrderServices.getAllByAccount(account);
        List<Sign> signsByIdA = SignService.getSigns(account);
        request.setAttribute("orders", orders);
        request.setAttribute("signsByIdA", signsByIdA);
        request.setAttribute("pageName", "Tài khoản");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/myAccount.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
