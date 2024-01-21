package org.example.demo.ca.bills;

import org.example.demo.dao.SignDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Optional;

@WebServlet(value = "/download-bill-signed")
public class DownloadSignedAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Bill oneByBillId = SignDao.findOneByBillId(Integer.parseInt(id));
        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=bill-signed" + id + ".pdf");

            // Read the entire input stream into a byte array
            InputStream dataBytes = oneByBillId.getDataSign();

            // Use try-with-resources for better resource management
            try (OutputStream os = response.getOutputStream(); ByteArrayInputStream bis = new ByteArrayInputStream(dataBytes.readAllBytes())) {
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = bis.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        } catch (IOException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}

