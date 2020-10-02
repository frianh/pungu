package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bean.SimBean;
import com.util.DBConnection;

public class SimDao {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	public SimBean getKursInfo() {
		SimBean simBean = new SimBean();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM tbl_kurs");
			
			while(resultSet.next()) {
				simBean.setRates(resultSet.getString("rates"));
				simBean.setLastUpdate(resultSet.getTimestamp("lastUpdate"));
				simBean.setUpdateBy(resultSet.getString("updateBy"));
			}
		} catch (Exception e) {
			
		}
		
		return simBean;
	}
	
	public void updateKurs(String newKurs, String id) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement.executeUpdate("UPDATE tbl_kurs SET rates='" +newKurs +"', lastUpdate=now(), updateBy='" +id +"'");
		} catch (Exception e) {
			
		}
	}
	
	public ArrayList<SimBean> getPrice(){
		ArrayList<SimBean> priceList = new ArrayList<SimBean>();
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT price, CONVERT(REPLACE(price, \",\", \"\"),UNSIGNED INTEGER) formattedPrice\n"+
					"FROM tbl_price ORDER BY formattedPrice;";
			resultSet = statement.executeQuery(query);
	        while(resultSet.next()){
	        	SimBean simBean = new SimBean();
	        	simBean.setPrice(resultSet.getString("price"));

	        	priceList.add(simBean);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return priceList;
	}
	
	public void updatePrice(ArrayList<String> priceList) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement.executeQuery("TRUNCATE tbl_price");
		
			//multiple insert
			String currentValue = "";
			String temp1 = "";
			for(int i=0; i<priceList.size(); i++) {
				currentValue = "('" +priceList.get(i) +"'),";
				if(!temp1.contains(currentValue)) {
					currentValue = temp1 +currentValue;
					temp1 = currentValue;	
				}
			}
			
			String query = "INSERT INTO tbl_price VALUES" +temp1.substring(0,temp1.length() - 1);
			statement.executeUpdate(query);
		} catch (Exception e) {
			
		}
	}
}
