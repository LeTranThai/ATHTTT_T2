package org.example.demo.ca;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import org.example.demo.Services.OrderServices;
import org.example.demo.dao.OrderDao;
import org.example.demo.dao.SignDao;
import org.example.demo.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(value = {"/import-bill-signed"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ImportBillSigned extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String order_id = request.getParameter("import_bill_signed_id");
        Part filePart = request.getPart("import_bill_signed_file");
        Order order = OrderDao.findOneById(Integer.parseInt(order_id));
        PdfReader reader = new PdfReader(filePart.getInputStream());
        PdfDocument pdfDoc = new PdfDocument(reader);
        String hashPdf = pdfDoc.getDocumentInfo().getMoreInfo("hash");

        System.out.println(hashPdf);

        if (hashPdf.equals(order.getHash())) {
            OrderServices.updateStatusCan(5, order.getId());
            Order order1 = OrderDao.findOneById(Integer.parseInt(order_id));
            OrderDao.updateHash(hashString(order1.toString()), order.getId());
            SignDao.updateBill(filePart.getInputStream(), order.getBillId());
            request.setAttribute("pageName", "Thông báo");
            request.setAttribute("message", "Đặt hàng thành công");
            request.getRequestDispatcher("/views/web/notification.jsp").forward(request,response);
        } else {
            request.setAttribute("message", "Chữ ký không hợp lệ");
            request.getRequestDispatcher("/views/web/notification.jsp").forward(request,response);
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
