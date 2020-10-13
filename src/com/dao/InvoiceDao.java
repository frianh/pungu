package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bean.InvoiceBean;
import com.util.DBConnection;

public class InvoiceDao {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	public int createNewInvoice(InvoiceBean invoiceBean, String createBy) {
		int invoiceNo = 0;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "INSERT INTO tbl_invoice(name, address, title, description, originalLink,"
					+"qty, remark, rate, total, discount, grandTotal, downPayment, remainingPayment, createBy, createDate, currentStatus, downPaymentStatus)"
					+"VALUES('"+invoiceBean.getName() +"', '" +invoiceBean.getAddress() +"', '" +invoiceBean.getTitle() +"', '"
					+invoiceBean.getDescription() +"', '" +invoiceBean.getOriginalLink() +"', '" +invoiceBean.getQty() +"', '" +invoiceBean.getRemark() +"', '"
					+invoiceBean.getRate() +"', '" +invoiceBean.getTotal() +"', '" +invoiceBean.getDiscount() +"', '"
					+invoiceBean.getGrandTotal() +"', '" +invoiceBean.getDownPayment() +"', '" +invoiceBean.getRemainingPayment() +"', '"
					+createBy +"', now(), 'menunggu approval', 'unpaid')";
			statement.executeUpdate(query);
			resultSet = statement.executeQuery("SELECT LAST_INSERT_ID()");
			if(resultSet.next()) {
				invoiceNo = resultSet.getInt(1);	
			}
			
			query = "INSERT INTO tbl_invoice_history VALUES('" +invoiceNo +"', 'pembuatan invoice', '" +createBy +"', now(), 'down payment belum dibayar')";
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return invoiceNo;
	}
	
	public ArrayList<InvoiceBean> getInvoiceListByInvoice(String invoiceNo){
		ArrayList<InvoiceBean> invoiceList = new ArrayList<InvoiceBean>();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT invoiceNo, name, description, grandTotal, createBy, createDate, currentStatus FROM tbl_invoice WHERE invoiceNo=" +invoiceNo;

			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				InvoiceBean invoiceBean = new InvoiceBean();
				invoiceBean.setInvoiceNumber(resultSet.getInt("invoiceNo"));
				invoiceBean.setName(resultSet.getString("name"));
				invoiceBean.setDescription(resultSet.getString("description"));
				invoiceBean.setGrandTotal(resultSet.getBigDecimal("grandTotal"));
				invoiceBean.setCreateBy(resultSet.getString("createBy"));
				invoiceBean.setCreateDate(resultSet.getTimestamp("createDate"));
				invoiceBean.setCurrentStatus(resultSet.getString("currentStatus"));
				invoiceList.add(invoiceBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return invoiceList;
	}
	
	public ArrayList<InvoiceBean> getInvoiceList(String invoiceStatus, String invoiceCreatedByFilter){
		ArrayList<InvoiceBean> invoiceList = new ArrayList<InvoiceBean>();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "";
			
			if(invoiceStatus.equals("all")) {
				if(invoiceCreatedByFilter.equals("")) {
					query = "SELECT invoiceNo, name, description, grandTotal, createBy, createDate, currentStatus FROM tbl_invoice ORDER BY invoiceNo DESC LIMIT 100";	
				}else {
					query = "SELECT invoiceNo, name, description, grandTotal, createBy, createDate, currentStatus FROM tbl_invoice WHERE createBy='" +invoiceCreatedByFilter +"' ORDER BY invoiceNo DESC LIMIT 100";
				}
			}else{
				if(invoiceCreatedByFilter.equals("")) {
					query = "SELECT invoiceNo, name, description, grandTotal, createBy, createDate, currentStatus FROM tbl_invoice WHERE currentStatus='" +invoiceStatus +"' ORDER BY invoiceNo DESC LIMIT 100";	
				}else {
					query = "SELECT invoiceNo, name, description, grandTotal, createBy, createDate, currentStatus FROM tbl_invoice WHERE currentStatus='" +invoiceStatus +"' AND createBy='" +invoiceCreatedByFilter +"'  ORDER BY invoiceNo DESC LIMIT 100";
				}
			}
			
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				InvoiceBean invoiceBean = new InvoiceBean();
				invoiceBean.setInvoiceNumber(resultSet.getInt("invoiceNo"));
				invoiceBean.setName(resultSet.getString("name"));
				invoiceBean.setDescription(resultSet.getString("description"));
				invoiceBean.setGrandTotal(resultSet.getBigDecimal("grandTotal"));
				invoiceBean.setCreateBy(resultSet.getString("createBy"));
				invoiceBean.setCreateDate(resultSet.getTimestamp("createDate"));
				invoiceBean.setCurrentStatus(resultSet.getString("currentStatus"));
				invoiceList.add(invoiceBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return invoiceList;
	}
	
	public ArrayList<InvoiceBean> getInvoiceHistory(int invoiceNo){
		ArrayList<InvoiceBean> invoiceHistory = new ArrayList<InvoiceBean>();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_invoice_history WHERE invoiceNo = '" +invoiceNo +"' ORDER BY createDate";
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				InvoiceBean invoiceBean = new InvoiceBean();
				invoiceBean.setAct(resultSet.getString("act"));
				invoiceBean.setCreateBy(resultSet.getString("createBy"));
				invoiceBean.setCreateDate(resultSet.getTimestamp("createDate"));
				invoiceBean.setRemarkHistory(resultSet.getString("remarkHistory"));
				invoiceHistory.add(invoiceBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return invoiceHistory;
	}
	
	public InvoiceBean getInvoiceDetail(int invoiceNo) {
		InvoiceBean invoiceBean = new InvoiceBean();
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_invoice WHERE invoiceNo = '" +invoiceNo +"'";
			resultSet = statement.executeQuery(query);
			
			while (resultSet.next()) {
				invoiceBean.setInvoiceNumber(resultSet.getInt("invoiceNo"));
				invoiceBean.setName(resultSet.getString("name"));
				invoiceBean.setAddress(resultSet.getString("address"));
				invoiceBean.setTitle(resultSet.getString("title"));
				invoiceBean.setDescription(resultSet.getString("description"));
				invoiceBean.setOriginalLink(resultSet.getString("originalLink"));
				invoiceBean.setQty(resultSet.getInt("qty"));
				invoiceBean.setRemark(resultSet.getString("remark"));
				invoiceBean.setRate(resultSet.getBigDecimal("rate"));
				invoiceBean.setTotal(resultSet.getBigDecimal("total"));
				invoiceBean.setDiscount(resultSet.getBigDecimal("discount"));
				invoiceBean.setGrandTotal(resultSet.getBigDecimal("grandTotal"));
				invoiceBean.setDownPayment(resultSet.getBigDecimal("downPayment"));
				invoiceBean.setDownPaymentStatus(resultSet.getString("downPaymentStatus"));
				invoiceBean.setRemainingPayment(resultSet.getBigDecimal("remainingPayment"));
				invoiceBean.setCreateBy(resultSet.getString("createBy"));
				invoiceBean.setCreateDate(resultSet.getTimestamp("createDate"));
				invoiceBean.setCurrentStatus(resultSet.getString("currentStatus"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return invoiceBean;
	}
	
	public String updateStatusInvoice(int invoiceNo, String action, String createBy, String remarkHistory) {
		String result = "fail";
		Connection con = null;
		Statement statement = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "";
			
			if(action.equals("approve")) {
				query = "UPDATE tbl_invoice SET currentStatus='dalam proses' WHERE invoiceNo='"+invoiceNo +"'";
			}else if (action.equals("reject")) {
				query = "UPDATE tbl_invoice SET currentStatus='reject' WHERE invoiceNo='"+invoiceNo +"'";
			}else if (action.equals("finish")) {
				query = "UPDATE tbl_invoice SET currentStatus='selesai' WHERE invoiceNo='"+invoiceNo +"'";
			}else if (action.equals("cancel")) {
				query = "UPDATE tbl_invoice SET currentStatus='cancel' WHERE invoiceNo='"+invoiceNo +"'";
			}
			
			statement.executeUpdate(query);
			
			query = "INSERT INTO tbl_invoice_history VALUES('" +invoiceNo +"', '" +action +"', '" +createBy +"', now(), '"+remarkHistory +"')";
			statement.executeUpdate(query);
			result = "success";
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	public void updateStatusDownPayment(int invoiceNo) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_invoice SET downPaymentStatus='paid' WHERE invoiceNo='" +invoiceNo +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<InvoiceBean> getInvoiceTitle(){
		ArrayList<InvoiceBean> invoiceTitle = new ArrayList<InvoiceBean>();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_invoice_title";
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				InvoiceBean invoiceBean = new InvoiceBean();
				invoiceBean.setTitle(resultSet.getString("title"));
				invoiceTitle.add(invoiceBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return invoiceTitle;
	}
	
	public InvoiceBean getLastUpdate() {
		InvoiceBean invoiceBean = new InvoiceBean();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT lastUpdate, updateBy FROM tbl_invoice_title LIMIT 1";
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				invoiceBean.setLastUpdate(resultSet.getTimestamp("lastUpdate"));
				invoiceBean.setUpdateBy(resultSet.getString("updateBy"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return invoiceBean;
	}
	
	public void updateTitleList(String updateBy, ArrayList<String> titleList) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement.executeQuery("TRUNCATE tbl_invoice_title");
		
			//multiple insert
			String currentValue = "";
			String temp1 = "";
			for(int i=0; i<titleList.size(); i++) {
				currentValue = "('" +titleList.get(i) +"'),";
				if(!temp1.contains(currentValue)) {
					currentValue = temp1 +currentValue;
					temp1 = currentValue;	
				}
			}
			
			String query = "INSERT INTO tbl_invoice_title (title) VALUES" +temp1.substring(0,temp1.length() - 1);
			statement.executeUpdate(query);
			
			query = "UPDATE tbl_invoice_title SET lastUpdate=now(), updateBy='" +updateBy +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
