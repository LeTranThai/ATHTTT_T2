package org.example.demo.controller.admin;

import com.google.gson.Gson;
import org.example.demo.Services.*;
import org.example.demo.dao.OrderItemDao;
import org.example.demo.model.Account;
import org.example.demo.model.Order;
import org.example.demo.model.OrderItem;
import org.example.demo.response.AccountResponse;
import org.example.demo.response.OrderResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "orderManageController", value = "/admin-order-manage")
public class OrderManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null || !(account.getRole().getName().equals("ADMIN"))) {
            response.sendRedirect("login");
        } else {
            String base = request.getServletContext().getContextPath();
            request.setAttribute("base", base);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order-manage.jsp");
            //get list order
            List<Order> listOrder = OrderServices.getAll();
            request.setAttribute("subTabName", "manageOrder");
            request.setAttribute("tabName", "manage");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String action = request.getParameter("action");
        Gson gson = new Gson();
        switch (action) {
            case "getAllOrder": {
                List<Order> listOrder = OrderServices.getAll();
                List<OrderResponse> orderResponses = new ArrayList<>();
                double price = 0;
                for (Order order : listOrder) {
                    try {
                        price = OrderItemDao.getPriceById(order.getId());
                    } catch (SQLException e) {
                        price = 0;
                    }
                    orderResponses.add(new OrderResponse(order.getId(), order.getRecipient(), order.getOrderPhone(), order.getOrderAddress(), order.getCreatedDate(), order.getStatus().getName(), price));
                }
                String json = gson.toJson(orderResponses);
                pw.write(json);
                break;
            }
            case "getOrder" : {
                String id = request.getParameter("id");
                Order order = OrderServices.getOrder(Long.parseLong(id));
                List<OrderItem> orderItems = OrderItemDao.findById(order.getId());
                OrderResponse orderResponse = new OrderResponse(order.getId(), order.getRecipient(), order.getOrderPhone(), order.getOrderAddress(), orderItems);
                String json = gson.toJson(orderResponse);
                pw.write(json);
                break;
            }
        }
    }
}


