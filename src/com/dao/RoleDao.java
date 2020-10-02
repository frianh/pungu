package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bean.RoleBean;
import com.util.DBConnection;

public class RoleDao {
	public ArrayList<RoleBean> getListRole(){
		ArrayList<RoleBean> roleList = new ArrayList<RoleBean>();
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_role";
			resultSet = statement.executeQuery(query);
	        while(resultSet.next()){
	        	RoleBean roleBean = new RoleBean();
	        	roleBean.setRole(resultSet.getString("role"));
	        	roleList.add(roleBean);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return roleList;
	}
}
