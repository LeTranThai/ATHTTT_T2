package org.example.demo.controller.web;

import org.example.demo.Services.*;
import org.example.demo.model.*;
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
import java.util.List;

@WebServlet(name = "checkoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        request.setAttribute("totalCart", CartService.totalCart(cart));
        List<Sign> signs = SignService.getSigns(account);
        boolean flag = false;
        for (Sign sign : signs) {
            if (sign.getModifiedDate() == null) {
                flag = true;
                break;
            }
        }
        if (flag) {
            request.setAttribute("pageName", "Thanh toán");
            request.getRequestDispatcher("/views/web/checkout.jsp").forward(request, response);;
        } else {
            request.setAttribute("pageName", "Giỏ hàng");
            request.setAttribute("message", "Bạn chưa có khóa, vui lòng cập nhật khóa trước khi đặt hàng!!!");
            request.getRequestDispatcher("/views/web/shoppingCart.jsp").forward(request, response);
        }
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
            long orderId= OrderServices.add(account, cart, recipient, phone, address, hashMess);
            order = OrderServices.getOrder(orderId);
            CreatePDFOrder createPDFOrder = new CreatePDFOrder("order-" + orderId, order);
            createPDFOrder.setRootFolder(request.getServletContext().getRealPath(request.getServletContext().getContextPath()));
            createPDFOrder.createPdf();

            CartService.clear(cart);
            request.setAttribute("message", "Đặt hàng thành công");
            request.setAttribute("pageName", "Thông báo");
            request.setAttribute("orderId", orderId);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/notification.jsp");
            rd.forward(request, response);
        }

    }
}
