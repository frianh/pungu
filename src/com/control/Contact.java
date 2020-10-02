package com.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.BodyMessage;
import com.util.Email;

public class Contact extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Contact() {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String action = request.getServletPath();
		
		try {
			if(action.equals("/contact/send-email")) {
				String messageFromSender = request.getParameter("body_email");
				String senderEmail = request.getParameter("sender_email");
				String senderName = request.getParameter("sender_name");
				
				if(messageFromSender.trim().equals("") || senderEmail.trim().equals("") || senderName.trim().equals("")) {
					
				}else {
					Email email = new Email();
					BodyMessage bodyMessage = new BodyMessage();
					
					String message = bodyMessage.messageForOfficial(messageFromSender, senderEmail, senderName);
					email.send("pungujayaemailserver@gmail.com", "Pungu123", "pungujayalogistic@gmail.com", message, "Message From Web Contact");
					email.send("pungujayaemailserver@gmail.com", "Pungu123", senderEmail, bodyMessage.replyForSenderWebContact(), "Email Berhasil Terkirim");
					
					request.setAttribute("result", "success");
					request.setAttribute("message", "Email berhasil terkirim.");	
				}
			}
		} catch (Exception e) {
			request.setAttribute("result", "failed");
			request.setAttribute("message", "Maaf terjadi kesalahan, email gagal terkirim.");
		}
		
		request.getRequestDispatcher("/WEB-INF/contact.jsp").forward(request, response);
	}
}
