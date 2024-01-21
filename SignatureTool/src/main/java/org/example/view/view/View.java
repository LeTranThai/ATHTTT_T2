package org.example.view.view;

import java.awt.*;
import javax.swing.*;
import javax.swing.JFrame;

public class View {

    private void initComponents() {
        JFrame mainFrame = new JFrame();
        menuPanel = new JPanel();
        mainPanel = new JPanel();
        {
            mainFrame.setTitle("Phần mềm ký hóa đơn PDF");
            mainFrame.setLayout(new BorderLayout());
            mainFrame.add(menuPanel, BorderLayout.NORTH);
            {
                mainPanel.setLayout(new BorderLayout());
            }
            DigitalSignatureScreen digitalSignatureScreen = new DigitalSignatureScreen();
            addScreen(digitalSignatureScreen.getPanel(), mainPanel);
            mainFrame.add(mainPanel, BorderLayout.CENTER);
            mainFrame.pack();
            mainFrame.setLocationRelativeTo(null);
            mainFrame.setVisible(true);
            mainFrame.setSize(800, 600);
            mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        }
    }

    private void addScreen(JPanel panel, JPanel mainPanel) {
        mainPanel.add(panel);
    }

    private JPanel menuPanel;
    private JPanel mainPanel;

    public static void main(String[] args) {
        View run = new View();
        run.initComponents();
    }
}
