package org.example.demo.controller.web;


import org.example.demo.model.RSA;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;

@WebServlet(name = "KeyController", value = "/keys")
public class KeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command != null && command.equals("setKey")) {
            RSA rsa = new RSA();
            try {
                rsa.generateKeyPair(2048);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            String publicKey = rsa.exportPublickey();
            String privateKey = rsa.exportPrivatekey();

            // Tạo đối tượng JSON
            JSONObject keyPairJson = new JSONObject();
            keyPairJson.put("publicKey", publicKey);
            keyPairJson.put("privateKey", privateKey);

            // Ghi đối tượng JSON vào tệp
            String jsonFileName = "keyPair.json";
            try (FileWriter fileWriter = new FileWriter(jsonFileName)) {
                fileWriter.write(keyPairJson.toJSONString());
            }

            // Thiết lập các thông số cho việc tải về tệp JSON
            response.setContentType("application/json");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + jsonFileName + "\"");
            // Gửi nội dung tệp JSON đến client
            response.getWriter().write(keyPairJson.toJSONString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
