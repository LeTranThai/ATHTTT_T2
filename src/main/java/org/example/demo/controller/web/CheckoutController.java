package org.example.demo.controller.web;

import org.example.demo.Services.LoginService;
import org.example.demo.Services.OrderServices;
import org.example.demo.Services.StatusService;
import org.example.demo.model.*;
import org.example.demo.Services.CartService;
import org.example.demo.util.CreatePDFOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "checkoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Cart cart = (Cart) session.getAttribute("cart");
        request.setAttribute("totalCart", CartService.totalCart(cart));
        request.setAttribute("pageName", "Thanh toán");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/checkout.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RSA rsa = new RSA();
        Account account = (Account) session.getAttribute("account");
        String recipient = request.getParameter("fullname");
        String phone = request.getParameter("sdt");
        String address = request.getParameter("address");
        String privateKey = request.getParameter("private");
        String infor = "";
        String listProduct = "";
        Cart cart = CartService.getCart(account);
        for (CartItem item : cart.getCartItems()) {
            listProduct += item.getProduct().getId() + "" +
                    item.getProduct().getPrice() +
                    item.getProduct().getDiscount() +
                    item.getAmount() +
                    item.getSize().getId() +
                    item.getColor().getId();
        }
        infor += account.getId() + recipient + phone + address + listProduct ;
        String hashMess = "";
        try {
            hashMess = rsa.encryptToBase64(infor,privateKey);
        } catch (Exception e) {
            request.setAttribute("message", "Có lỗi trong quá trình đặt hàng, mời thử lại sau!");
        }
        if (cart.getCartItems().isEmpty()) {
            request.setAttribute("message", "Giỏ hàng rỗng");
        } else {
            Order order = OrderServices.getOrderByAccountAndStatus(account, StatusService.getStatusByName("WAIT"));
            if (order != null) {
                order.setStatus(StatusService.getStatusByName("VERIFY"));
                OrderServices.updateStatus(order);
            }
            OrderServices.add(account, cart, recipient, phone, address, hashMess);
            CartService.clear(cart);
            request.setAttribute("message", "Đặt hàng thành công");
            request.setAttribute("pageName", "Thông báo");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/notification.jsp");
            rd.forward(request, response);
        }
    }
}
