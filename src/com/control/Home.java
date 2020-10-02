package com.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.InvoiceBean;
import com.bean.UserBean;
import com.dao.InvoiceDao;
import com.dao.UserDao;

public class Home extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Home() {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		UserBean userBean = new UserBean();
		UserDao userDao = new UserDao();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		userBean = userDao.authenticateUser(id, password);
		
		if(userBean.getId() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", userBean.getId());
			session.setAttribute("name", userBean.getName());
			session.setAttribute("email", userBean.getEmail());
			session.setAttribute("role", userBean.getRole());
			
			if(request.getSession().getAttribute("id")==null) {
				request.setAttribute("sessionExpiredMessage", "Silahkan login.");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
			}
			
			doGet(request, response);
		}else {
			request.setAttribute("errMessage", "Percobaan login gagal !");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getSession().getAttribute("id")==null) {
			request.setAttribute("sessionExpiredMessage", "Silahkan login.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
			
		InvoiceDao invoiceDao = new InvoiceDao();
		ArrayList<InvoiceBean> listInvoiceBean = invoiceDao.getInvoiceList("menunggu approval", "");
		request.setAttribute("waitApproveInvoice", listInvoiceBean.size());
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}
