package org.example.demo.ca.bills;

import org.example.demo.dao.SignDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet(name = "DownloadBill", value = "/download-bill")
public class DownloadBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Bill oneByBillId = SignDao.findOneByBillId(Integer.parseInt(id));
        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=bill" + id + ".pdf");

            // Read the entire input stream into a byte array
            InputStream dataBytes = oneByBillId.getData();

            // Use try-with-resources for better resource management
            try (OutputStream os = response.getOutputStream(); ByteArrayInputStream bis = new ByteArrayInputStream(dataBytes.readAllBytes())) {
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = bis.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }

            }
            request.getRequestDispatcher("sign.jsp").forward(request,response);
        } catch (IOException e) {
            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
