package view;

import java.awt.EventQueue;

import javax.swing.JFrame;

public class Home extends JFrame {

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Home frame = new Home();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Home() {
		setTitle("ATBMHTTT_2023_Tool");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 978, 599);
		MainPanel mainPanel = new MainPanel();
		setContentPane(mainPanel);
	}
}