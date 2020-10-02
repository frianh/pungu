package com.control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.RecoveryBean;
import com.bean.UserBean;
import com.dao.RecoveryDao;
import com.dao.UserDao;
import com.util.BodyMessage;
import com.util.Email;

public class Recovery extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Recovery() {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getSession().getAttribute("id")!=null) {
			response.sendRedirect(request.getContextPath() +"/home");
		}else {
			String action = request.getServletPath();
			
			try {
				switch (action) {
				case "/recovery/reset-password":
					resetPassword(request, response);
					break;
				case "/recovery/auth":
					auth(request, response);
					break;
				default:
					showRecoveryForm(request, response);
					break;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}	
		}
	}
	
	private void showRecoveryForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("type", "reset");
		request.getRequestDispatcher("/WEB-INF/recovery.jsp").forward(request, response);
	}
	
	private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean userBean = new UserBean();
		UserDao userDao = new UserDao();
		
		String emailRecover = request.getParameter("email_recover").trim();
		
		userBean = userDao.checkExistingEmail(emailRecover);
		
		if(userBean.getEmail()==null) {
			request.setAttribute("type", "reset");
			request.setAttribute("errMessage", "Email tidak terdaftar.");
			request.getRequestDispatcher("/WEB-INF/recovery.jsp").forward(request, response);
		}else {
			String getName = userBean.getName();
			
			Random random = new Random();
			String getOtp = String.format("%04d", random.nextInt(10000));
			
			Email email = new Email();
			BodyMessage bodyMessage = new BodyMessage();
			
			String message = bodyMessage.notificationOtp(getName, emailRecover, getOtp);
			
			email.send("pungujayaemailserver@gmail.com", "Pungu123", emailRecover, message, "OTP Request");
			
			try {
				RecoveryDao recoveryDao = new RecoveryDao();
				recoveryDao.insertOtp(emailRecover, getOtp);
				
				request.setAttribute("type", "auth");
				request.setAttribute("emailRecover", emailRecover);
				request.setAttribute("nameRecover", getName);
				request.getRequestDispatcher("/WEB-INF/recovery.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("result", "fail");
				request.setAttribute("message", "Maaf, terjadi kesalahan");
				request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
			}
		}
	}
	
	private void auth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String getOtpFromPage = request.getParameter("auth");
		String emailRecover = request.getParameter("emailRecover");
		String nameRecover = request.getParameter("nameRecover");
		
		RecoveryBean recoveryBean = new RecoveryBean();
		RecoveryDao recoveryDao = new RecoveryDao();
		
		String getOtpFromDb = "";
		recoveryBean = recoveryDao.getOtpFromDatabase(emailRecover);
		if(recoveryBean.getOtp()==null) {
			getOtpFromDb = "";
		}else {
			getOtpFromDb = recoveryBean.getOtp();
		}
		
		if(getOtpFromPage.equals(getOtpFromDb)) {
			//here, generate new password and send email
			Random random = new Random();
			String newPassword = "Pungu" +String.format("%04d", random.nextInt(10000));
			
			BodyMessage bodyMessage = new BodyMessage();
			String message = bodyMessage.successfullyRecover(nameRecover, emailRecover, newPassword);
			
			Email email = new Email();
			email.send("pungujayaemailserver@gmail.com", "Pungu123", emailRecover, message, "Pemulihan Password Berhasil");
			
			recoveryDao.insertNewPassword(emailRecover, newPassword);
			
			request.setAttribute("recoverMessage", "Recovery account berhasil, silahkan cek email anda.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else {
			request.setAttribute("errMessage", "OTP tidak sesuai.");
			request.setAttribute("type", "auth");
			request.setAttribute("emailRecover", emailRecover);
			request.getRequestDispatcher("/WEB-INF/recovery.jsp").forward(request, response);
		}
	}
}
