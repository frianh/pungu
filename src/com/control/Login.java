package com.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Login() {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getSession().getAttribute("id")==null) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);	
		}else {
			request.getRequestDispatcher("/home").include(request, response);
		}
	}
}
