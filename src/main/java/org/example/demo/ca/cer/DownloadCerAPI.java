package org.example.demo.ca.cer;


import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import org.example.demo.dao.SignDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/download-cer")
public class DownloadCerAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Certificate oneByCerId = SignDao.findOneByCerId(Integer.parseInt(id));
        try {
            // Set response headers for PDF download
            response.setContentType("application/pkcs12");
            response.setHeader("Content-Disposition", "attachment; filename=\"cer-" + id + ".jks\"");

            // Read the entire input stream into a byte array
            byte[] dataBytes = oneByCerId.getData().readAllBytes();
            // Send the byte array as the response output stream
            response.getOutputStream().write(dataBytes);
        } catch (IOException e) {
            e.printStackTrace();  // Consider logging the error
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }


}

