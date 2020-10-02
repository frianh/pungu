package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import com.bean.UserBean;
import com.util.DBConnection;

public class UserDao {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	public UserBean authenticateUser(String id, String password) {
		UserBean userBean = new UserBean();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM tbl_user WHERE (id='" +id +"' OR email='" +id +"') AND active='y'");
			
			while(resultSet.next()) {
				if(password.equals(resultSet.getString("password"))) {
					userBean.setId(resultSet.getString("id"));
					userBean.setName(resultSet.getString("name"));
					userBean.setEmail(resultSet.getString("email"));
					userBean.setRole(resultSet.getString("role"));
				}
			}
		} catch (Exception e) {
			
		}
		
		return userBean;
	}
	
	public boolean validateExistingNewUser(String newEmail, String newId) {
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		boolean exist = true;

		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_user WHERE (email='" +newEmail +"') OR (id='" +newId +"')";
			
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()){
	        	UserBean userBean = new UserBean();
	        	userBean.setId(resultSet.getString("id"));
	        	userBean.setEmail(resultSet.getString("email"));
	        	userList.add(userBean);
			}
			
			if(userList.size()==0) {
				exist = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return exist;
	}
	
	public ArrayList<UserBean> getUserList(){
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "SELECT * FROM tbl_user WHERE active = 'y'";
			resultSet = statement.executeQuery(query);
	        while(resultSet.next()){
	        	UserBean userBean = new UserBean();
	        	userBean.setId(resultSet.getString("id"));
	        	userBean.setEmail(resultSet.getString("email"));
	        	userBean.setName(resultSet.getString("name"));
	        	userBean.setRole(resultSet.getString("role"));
	        	userBean.setCreateDate(resultSet.getDate("createDate"));
	        	userBean.setCreateBy(resultSet.getString("createBy"));
	        	userBean.setLastUpdate(resultSet.getDate("lastUpdate"));
	        	userBean.setLastUpdateBy(resultSet.getString("lastUpdateBy"));
	        	userList.add(userBean);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public UserBean getUserInfo(String user_id) {
		UserBean userBean = new UserBean();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM tbl_user WHERE id='" +user_id +"'");
			
			while(resultSet.next()) {
				userBean.setId(resultSet.getString("id"));
	        	userBean.setEmail(resultSet.getString("email"));
	        	userBean.setName(resultSet.getString("name"));
	        	userBean.setRole(resultSet.getString("role"));
	        	userBean.setCreateDate(resultSet.getTimestamp("createDate"));
	        	userBean.setCreateBy(resultSet.getString("createBy"));
	        	userBean.setLastUpdate(resultSet.getTimestamp("lastUpdate"));
	        	userBean.setLastUpdateBy(resultSet.getString("lastUpdateBy"));
			}
		} catch (Exception e) {
			
		}
		
		return userBean;
	}
	
	public String insertNewUser(UserBean userBean) {
		//random password
		Random random = new Random();
		String password = "Pungu" +String.format("%04d", random.nextInt(10000));
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "INSERT INTO tbl_user VALUES('"+userBean.getId() +"', '"+password +"', '"
					+userBean.getEmail() +"', '" +userBean.getName() +"', '" +userBean.getRole() 
					+"', now(), '" +userBean.getCreateBy() +"', NULL, NULL, 'y')";
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return password;
	}
	
	public void updateRole(String idToUpdate, String newRole, String idCreateBy) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_user SET role='" +newRole +"', lastUpdate=now(), lastUpdateBy='" +idCreateBy +"' WHERE id='" +idToUpdate +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void deleteUser(String idToUpdate, String idCreateBy) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_user SET active='n', lastUpdate=now(), lastUpdateBy='" +idCreateBy +"' WHERE id='" +idToUpdate +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void updatePassword(String id, String newPassword) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_user SET password='" +newPassword +"' WHERE id='" +id +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void updateProfile(String id, String name, String email) {
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			String query = "UPDATE tbl_user SET name='" +name +"', email='" +email +"' " +"WHERE id='" +id +"'";
			statement.executeUpdate(query);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public UserBean checkExistingEmail(String emailAddress) {
		UserBean userBean = new UserBean();
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT email, name FROM tbl_user WHERE email='" +emailAddress +"'");
			
			while (resultSet.next()) {
				userBean.setEmail(resultSet.getString("email"));
				userBean.setName(resultSet.getString("name"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return userBean;
	}
}
