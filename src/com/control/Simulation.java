package com.control;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SimBean;
import com.dao.SimDao;

public class Simulation extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Simulation() {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String action = request.getServletPath();
		
		try {
			switch (action) {
				case "/simulation/edit":
					edit(request, response);
					break;
				case "/simulation/update":
					update(request, response);
					break;
				default:
					showSimulationPage(request, response);
					break;
			}
		} catch (IOException e) {
			request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
		}
	}
	
	private void showSimulationPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimDao simDao = new SimDao();
		SimBean simBean = new SimBean();
		simBean = simDao.getKursInfo();
		
		ArrayList<SimBean> priceList = simDao.getPrice();
		request.setAttribute("priceList", priceList);
		
		request.setAttribute("rates", simBean.getRates());
		request.setAttribute("type", "default");
		request.getRequestDispatcher("/WEB-INF/simulation.jsp").forward(request, response);
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id")==null) {
			request.setAttribute("sessionExpiredMessage", "Silahkan login.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		SimBean simBean = new SimBean();
		SimDao simDao = new SimDao();
		
		simBean = simDao.getKursInfo();
		
		request.setAttribute("rates", simBean.getRates());
		request.setAttribute("lastUpdate", simBean.getLastUpdate());
		request.setAttribute("updateBy", simBean.getUpdateBy());
		
		ArrayList<SimBean> priceList = simDao.getPrice();
		request.setAttribute("priceList", priceList);
		request.setAttribute("type", "edit");
		request.getRequestDispatcher("/WEB-INF/simulation.jsp").forward(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id")==null) {
			request.setAttribute("sessionExpiredMessage", "Silahkan login.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		try {
			String id = (String) request.getSession().getAttribute("id");
			String rates = request.getParameter("rates_now");
			SimDao simDao = new SimDao();
			simDao.updateKurs(rates, id);
			
			String prices = request.getParameter("arrPrice");
			
			ArrayList<String> arrPrice = new ArrayList<String>();
			
			for(String prc: prices.split(",")) {
				arrPrice.add(NumberFormat.getNumberInstance(Locale.US).format(Integer.parseInt(prc)));
			}
			
			simDao.updatePrice(arrPrice);
			
			SimBean simBean = new SimBean();
			simBean = simDao.getKursInfo();
			
			ArrayList<SimBean> priceList = simDao.getPrice();
			request.setAttribute("priceList", priceList);
			
			request.setAttribute("rates", simBean.getRates());
			request.setAttribute("type", "default");
			
			request.setAttribute("result", "success");
			request.setAttribute("message", "Halaman simulasi berhasil di perbarui");
			
			request.getRequestDispatcher("/WEB-INF/simulation.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
}
