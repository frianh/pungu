package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bean.RecoveryBean;
import com.util.DBConnection;

public class RecoveryDao {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	public void insertOtp(String email, String otp) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "DELETE FROM tbl_otp WHERE email='" +email +"'";
			statement.executeUpdate(query);
			query = "INSERT INTO tbl_otp VALUES('" +email +"', '" +otp +"', now())";
			statement.executeUpdate(query);
		} catch (Exception e) {
			
		}
	}
	
	public void insertNewPassword(String email, String newPassword) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_user SET password='" +newPassword +"' WHERE email='" +email +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			
		}
	}
	
	public RecoveryBean getOtpFromDatabase(String email) {
		RecoveryBean recoveryBean = new RecoveryBean();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_otp WHERE email='" +email +"'";
			resultSet = statement.executeQuery(query);
			
			while (resultSet.next()) {
				recoveryBean.setOtp(resultSet.getString("otp"));
				recoveryBean.setCreateDate(resultSet.getTimestamp("createDate"));
			}
		} catch (Exception e) {
			
		}
		
		return recoveryBean;
	}
}
