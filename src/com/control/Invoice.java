package com.control;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.InvoiceBean;
import com.dao.InvoiceDao;

public class Invoice extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Invoice() {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id")==null) {
			request.setAttribute("sessionExpiredMessage", "Silahkan login.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		doGet(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getSession().getAttribute("id")==null) {
			request.setAttribute("sessionExpiredMessage", "Silahkan login.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/invoice/new":
				showFormAddNewInvoice(request, response);
				break;
			case "/invoice/review":;
				showFormReviewInvoice(request, response);
				break;
			case "/invoice/new/create":;
				createInvoice(request, response);
				break;
			case "/invoice/detail":;
				detailInvoice(request, response);
				break;
			case "/invoice/update":;
				updateInvoice(request, response);
				break;
			default:
				listInvoice(request, response);
				break;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	private void showFormAddNewInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("type", "add");
		request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
	}
	
	private void showFormReviewInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("create_to", request.getParameter("hidden_create_to"));
		request.setAttribute("create_address", request.getParameter("hidden_create_address"));
		request.setAttribute("create_title", request.getParameter("hidden_create_title"));
		request.setAttribute("create_description", request.getParameter("hidden_create_description"));
		request.setAttribute("create_rate", request.getParameter("hidden_create_rate"));
		request.setAttribute("create_qty", request.getParameter("hidden_create_qty"));
		request.setAttribute("create_remark", request.getParameter("hidden_create_remark"));
		request.setAttribute("create_total", request.getParameter("hidden_create_total"));
		request.setAttribute("create_discount", request.getParameter("hidden_create_discount"));
		request.setAttribute("create_grand_total", request.getParameter("hidden_create_grand_total"));
		request.setAttribute("create_dp", request.getParameter("hidden_create_dp"));
		request.setAttribute("create_remaining_pay", request.getParameter("hidden_create_remaining_pay"));
		request.setAttribute("invoice_number", "INV# Invoice");
		request.setAttribute("type", "review");
		
		DateTimeFormatter dateTimeFrmt = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
	    LocalDateTime now = LocalDateTime.now();
	    String currentTime = dateTimeFrmt.format(now);
	    
	    request.setAttribute("current_time", currentTime);
		request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
	}
	
	private void createInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			InvoiceBean invoiceBean = new InvoiceBean();
			invoiceBean.setName(request.getParameter("hidden_rev_create_to"));
			invoiceBean.setAddress(request.getParameter("hidden_rev_create_address"));
			invoiceBean.setTitle(request.getParameter("hidden_rev_create_title"));
			invoiceBean.setDescription(request.getParameter("hidden_rev_create_description"));
			invoiceBean.setQty(Integer.valueOf(request.getParameter("hidden_rev_create_qty")));
			invoiceBean.setRemark(request.getParameter("hidden_rev_create_remark"));
			invoiceBean.setRate(BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_rate").replace(",", ""))));
			invoiceBean.setTotal(BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_total").replace(",", ""))));
			if(request.getParameter("hidden_rev_create_discount").replace(",", "").equals("")) {
				invoiceBean.setDiscount(BigDecimal.valueOf((Double.valueOf(0))));
			}else {
				invoiceBean.setDiscount(BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_discount").replace(",", ""))));
			}
			invoiceBean.setGrandTotal(BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_grand_total").replace(",", ""))));
			
			Random random = new Random();
			int maximum = 499;
			int minimum = 102;
			int range = maximum - minimum + 1;
			int uniqueDp =  random.nextInt(range) + minimum;
			
			BigDecimal bigDecimaldp = BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_dp").replace(",", "")));
			BigDecimal dpAndUniqueNo =  BigDecimal.valueOf(uniqueDp).add(bigDecimaldp);
			
			invoiceBean.setDownPayment(dpAndUniqueNo);
			
			invoiceBean.setRemainingPayment(BigDecimal.valueOf(Double.valueOf(request.getParameter("hidden_rev_create_remaining_pay").replace(",", ""))));
			
			InvoiceDao invoiceDao = new InvoiceDao();
			
			int getInvoiceNo = invoiceDao.createNewInvoice(invoiceBean, request.getSession().getAttribute("id").toString());
			
			String updateMessage = "invoice berhasil dibuat";
			response.sendRedirect(request.getContextPath() +"/invoice/detail?invoiceNo=" +getInvoiceNo +"&updateResult=success&updateMessage="+updateMessage);
		} catch (Exception e) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
	
	private void listInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("hidden_invoice_no_filter")==null) {
			//without invoice no
			InvoiceDao invoiceDao = new InvoiceDao();
			
			String invoiceStatus = request.getParameter("hidden_invoice_status");
			String invoiceCreatedByFilter = request.getParameter("hidden_invoice_created_by_filter");
			
			if(invoiceStatus == null || invoiceStatus.equals("")) {
				invoiceStatus = "all";
			}
			
			if(invoiceCreatedByFilter == null) {
				invoiceCreatedByFilter = "";
			}
			
			ArrayList<InvoiceBean> invoiceList = invoiceDao.getInvoiceList(invoiceStatus, invoiceCreatedByFilter.toLowerCase());
			
			if(invoiceList.size()==0) {
				request.setAttribute("emptyData", true);
			}else {
				request.setAttribute("emptyData", false);
			}
			
			request.setAttribute("invoiceStatus", invoiceStatus);
			request.setAttribute("invoiceList", invoiceList);
			request.setAttribute("invoiceCreatedByFilter", invoiceCreatedByFilter);
			request.setAttribute("type", "list");
			
			request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
		}else {
			//with invoice no
			InvoiceDao invoiceDao = new InvoiceDao();
			ArrayList<InvoiceBean> invoiceList = invoiceDao.getInvoiceListByInvoice(request.getParameter("hidden_invoice_no_filter").trim());
			
			if(invoiceList.size()==0) {
				request.setAttribute("emptyData", true);
			}else {
				request.setAttribute("emptyData", false);
			}
			
			request.setAttribute("invoiceList", invoiceList);
			request.setAttribute("type", "list");
			request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
		}
	}
	
	private void detailInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String invoiceNo = request.getParameter("invoiceNo").trim();

			if(invoiceNo.equals("") || invoiceNo==null) {
				request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
			}
			
			InvoiceDao invoiceDao = new InvoiceDao();
			
			DecimalFormat df = (DecimalFormat) DecimalFormat.getCurrencyInstance();
			DecimalFormatSymbols dfs = new DecimalFormatSymbols();
			dfs.setCurrencySymbol("Rp. ");
			dfs.setMonetaryDecimalSeparator('.');
			dfs.setGroupingSeparator(',');
			df.setDecimalFormatSymbols(dfs);
			
			InvoiceBean invoiceBean = invoiceDao.getInvoiceDetail(Integer.valueOf(invoiceNo));
			request.setAttribute("invoice_number", invoiceBean.getInvoiceNumber());
			request.setAttribute("to", invoiceBean.getName());
			request.setAttribute("address", invoiceBean.getAddress());
			request.setAttribute("title", invoiceBean.getTitle());
			request.setAttribute("description", invoiceBean.getDescription());
			request.setAttribute("qty", invoiceBean.getQty());
			request.setAttribute("remark", invoiceBean.getRemark());
			request.setAttribute("rate", df.format(invoiceBean.getRate()));
			request.setAttribute("total", df.format(invoiceBean.getTotal()));
			request.setAttribute("discount", df.format(invoiceBean.getDiscount()));
			request.setAttribute("grand_total", df.format(invoiceBean.getGrandTotal()));
			request.setAttribute("dp", df.format(invoiceBean.getDownPayment()));
			request.setAttribute("dpStatus", invoiceBean.getDownPaymentStatus());
			request.setAttribute("remaining_pay", df.format(invoiceBean.getRemainingPayment()));
			request.setAttribute("create_by", invoiceBean.getCreateBy());
			request.setAttribute("create_date", invoiceBean.getCreateDate());
			request.setAttribute("current_status", invoiceBean.getCurrentStatus());
			
			ArrayList<InvoiceBean> invoiceHistory = invoiceDao.getInvoiceHistory(Integer.valueOf(invoiceNo));
			
			request.setAttribute("invoiceHistory", invoiceHistory);
			request.setAttribute("type", "detail");
			
			if(request.getParameter("updateResult")!=null) {
				request.setAttribute("updateResult", request.getParameter("updateResult"));
			}
			
			if(request.getParameter("updateMessage")!=null) {
				if(request.getParameter("updateMessage").equals("invoice berhasil dibuat")) {
					request.setAttribute("updateMessage", request.getParameter("updateMessage") +" INV#" +invoiceNo);
				}
			}
			
			if(invoiceBean.getCurrentStatus().equals("menunggu approval")) {
				String[] arrDp = df.format(invoiceBean.getDownPayment()).split("\\.");
				String notifyDownPayment = arrDp[0] +arrDp[1];
				request.setAttribute("notifyDownPayment", notifyDownPayment);
			}
			
			request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
	
	private void updateInvoice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int invoiceNo = Integer.valueOf(request.getParameter("invoiceNo"));
		String invoiceAction = request.getParameter("invoiceAction").trim();
		String createBy = request.getSession().getAttribute("id").toString();
		String remarkHistory = request.getParameter("remarkHistory");

		InvoiceDao invoiceDao = new InvoiceDao();
		String resultUpdate = invoiceDao.updateStatusInvoice(invoiceNo, invoiceAction, createBy, remarkHistory);
		
		if(invoiceAction.equals("approve")) {
			invoiceDao.updateStatusDownPayment(invoiceNo);
		}
		
		DecimalFormat df = (DecimalFormat) DecimalFormat.getCurrencyInstance();
		DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setCurrencySymbol("Rp. ");
		dfs.setMonetaryDecimalSeparator('.');
		dfs.setGroupingSeparator(',');
		df.setDecimalFormatSymbols(dfs);
		
		if(resultUpdate.equals("success")) {
			InvoiceBean invoiceBean = invoiceDao.getInvoiceDetail(Integer.valueOf(invoiceNo));
			request.setAttribute("invoice_number", invoiceBean.getInvoiceNumber());
			request.setAttribute("to", invoiceBean.getName());
			request.setAttribute("address", invoiceBean.getAddress());
			request.setAttribute("title", invoiceBean.getTitle());
			request.setAttribute("description", invoiceBean.getDescription());
			request.setAttribute("qty", invoiceBean.getQty());
			request.setAttribute("remark", invoiceBean.getRemark());
			request.setAttribute("rate", df.format(invoiceBean.getRate()));
			request.setAttribute("total", df.format(invoiceBean.getTotal()));
			request.setAttribute("discount", df.format(invoiceBean.getDiscount()));
			request.setAttribute("grand_total", df.format(invoiceBean.getGrandTotal()));
			request.setAttribute("dp", df.format(invoiceBean.getDownPayment()));
			request.setAttribute("dpStatus", invoiceBean.getDownPaymentStatus());
			request.setAttribute("remaining_pay", df.format(invoiceBean.getRemainingPayment()));
			request.setAttribute("create_by", invoiceBean.getCreateBy());
			request.setAttribute("create_date", invoiceBean.getCreateDate());
			request.setAttribute("current_status", invoiceBean.getCurrentStatus());
			
			ArrayList<InvoiceBean> invoiceHistory = invoiceDao.getInvoiceHistory(Integer.valueOf(invoiceNo));
			
			request.setAttribute("updateResult", "success");
			request.setAttribute("updateMessage", "Invoice berhasil di update.");
			
			request.setAttribute("invoiceHistory", invoiceHistory);
			request.setAttribute("type", "detail");
			request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
		}else {
			InvoiceBean invoiceBean = invoiceDao.getInvoiceDetail(Integer.valueOf(invoiceNo));
			request.setAttribute("invoice_number", invoiceBean.getInvoiceNumber());
			request.setAttribute("to", invoiceBean.getName());
			request.setAttribute("address", invoiceBean.getAddress());
			request.setAttribute("title", invoiceBean.getTitle());
			request.setAttribute("description", invoiceBean.getDescription());
			request.setAttribute("qty", invoiceBean.getQty());
			request.setAttribute("remark", invoiceBean.getRemark());
			request.setAttribute("rate", df.format(invoiceBean.getRate()));
			request.setAttribute("total", df.format(invoiceBean.getTotal()));
			request.setAttribute("discount", df.format(invoiceBean.getDiscount()));
			request.setAttribute("grand_total", df.format(invoiceBean.getGrandTotal()));
			request.setAttribute("dp", df.format(invoiceBean.getDownPayment()));
			request.setAttribute("dpStatus", invoiceBean.getDownPaymentStatus());
			request.setAttribute("remaining_pay", df.format(invoiceBean.getRemainingPayment()));
			request.setAttribute("create_by", invoiceBean.getCreateBy());
			request.setAttribute("create_date", invoiceBean.getCreateDate());
			request.setAttribute("current_status", invoiceBean.getCurrentStatus());
			
			ArrayList<InvoiceBean> invoiceHistory = invoiceDao.getInvoiceHistory(Integer.valueOf(invoiceNo));
			
			request.setAttribute("updateResult", "fail");
			request.setAttribute("updateMessage", "Oops! Terjadi Kesalahan, update gagal.");
			
			request.setAttribute("invoiceHistory", invoiceHistory);
			request.setAttribute("type", "detail");
			request.getRequestDispatcher("/WEB-INF/invoice.jsp").forward(request, response);
		}
	}
}
