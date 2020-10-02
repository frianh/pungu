package com.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.RoleBean;
import com.bean.UserBean;
import com.dao.RoleDao;
import com.dao.UserDao;
import com.util.BodyMessage;
import com.util.Email;

public class Users extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Users() {
		
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
				case "/users/new":
					showFormAddNewUser(request, response);
					break;
				case "/users/new/create":
					createNewUser(request, response);
					break;
				case "/users/edit":
					edit(request, response);
					break;
				case "/users/delete":
					delete(request, response);
					break;
				case "/users/my-profile":
					showMyProfile(request, response);
					break;
				case "/users/my-profile/update":
					showMyProfile(request, response);
					break;
				case "/users/my-profile/reset-password":
					showMyProfile(request, response);
					break;
				default:
					listUsers(request, response);
					break;
			}
		} catch (IOException e) {
			
		}
	}
	
	private void showMyProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String current_id = request.getSession().getAttribute("id").toString();
		
		//if update profile perform
		if(request.getParameter("hidden_new_name")!=null) {
			String newName = request.getParameter("hidden_new_name");
			String newEmail = request.getParameter("hidden_new_email");
			
			try {
				UserDao userDao = new UserDao();
				userDao.updateProfile(current_id, newName, newEmail);
				request.setAttribute("resultUpdateProfile", "success");
				request.setAttribute("message", "Profil berhasil di perbarui.");
			} catch (Exception e) {
				request.setAttribute("resultUpdateProfile", "fail");
				request.setAttribute("message", "Terjadi kesalahan, gagal memperbarui profil.");
			}
		}
		
		//if change password perform
		if(request.getParameter("hidden_new_password")!=null) {
			String oldPassword = request.getParameter("hidden_old_password");
			String newPassword = request.getParameter("hidden_new_password");
			
			try {
				UserDao userDao = new UserDao();
				UserBean userBean = new UserBean();
				userBean = userDao.authenticateUser(current_id, oldPassword);
				
				if(userBean.getName()==null) {
					request.setAttribute("resultResetPassword", "fail");
					request.setAttribute("message", "Gagal memperbarui password !");
				}else {
					try {
						userDao.updatePassword(current_id, newPassword);
						request.setAttribute("resultResetPassword", "success");
						request.setAttribute("message", "Password berhasil diperbarui.");
					} catch (Exception e) {
						request.setAttribute("result", "fail");
						request.setAttribute("message", "Terjadi kesalahan. ");
						request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		UserDao userDao = new UserDao();
		UserBean userBean = new UserBean();
		
		userBean = userDao.getUserInfo(current_id);
		
		request.setAttribute("user_id", userBean.getId());
		request.setAttribute("email", userBean.getEmail());
		request.setAttribute("name", userBean.getName());
		request.setAttribute("role", userBean.getRole());
		request.setAttribute("createDate", userBean.getCreateDate());
		
		request.setAttribute("type", "show");
		request.getRequestDispatcher("/WEB-INF/myprofile.jsp").forward(request, response);
	}
	
	private void showFormAddNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoleDao roleDao = new RoleDao();
		ArrayList<RoleBean> roleList = roleDao.getListRole();
		
		request.setAttribute("roleList", roleList);
		request.setAttribute("type", "add");
		request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
	}
	
	private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			RoleDao roleDao = new RoleDao();
			ArrayList<RoleBean> roleList = roleDao.getListRole();
			
			request.setAttribute("roleList", roleList);
			
			UserBean userBean = new UserBean();
			UserDao userDao = new UserDao();
			
			String newUserId  = request.getParameter("hidden_create_id").toLowerCase().replace("\n", "").replace("\r", "").trim();
			String newEmail = request.getParameter("hidden_create_email").toLowerCase().replace("\n", "").replace("\r", "").trim();
			String newName = request.getParameter("hidden_create_name").toLowerCase().replace("\n", "").replace("\r", "").trim();
			String newRole = request.getParameter("hidden_create_role").toLowerCase().replace("\n", "").replace("\r", "").trim();
			String createBy = request.getParameter("hidden_create_by").toLowerCase().replace("\n", "").replace("\r", "").trim();
			
			userBean.setId(newUserId);
			userBean.setName(newName);
			userBean.setEmail(newEmail);
			userBean.setRole(newRole);
			userBean.setCreateBy(createBy);
			
			request.setAttribute("hidden_create_id", newUserId);
			request.setAttribute("hidden_create_name", newName);
			request.setAttribute("hidden_create_email", newEmail);
			
			if(userDao.validateExistingNewUser(newEmail, newUserId)) {
				request.setAttribute("type", "add");
				request.setAttribute("result", "fail");
				request.setAttribute("message", "Email atau ID yang anda masukan sudah terdaftar");
				request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
			}else {
				String getNewPassword = userDao.insertNewUser(userBean);
				
				Email email = new Email();
				BodyMessage bodyMessage = new BodyMessage();
				
				String message = bodyMessage.messageToNewUser(newName, newEmail, newUserId, getNewPassword);
				email.send("pungujayaemailserver@gmail.com", "Pungu123", newEmail, message, "Pembuatan User Baru");
				
				message = bodyMessage.messageToCreator(request.getSession().getAttribute("id").toString(), newName, newEmail, newUserId, newRole);
				email.send("pungujayaemailserver@gmail.com", "Pungu123", request.getSession().getAttribute("email").toString(), message, "Pembuatan User Baru");
				
				request.setAttribute("type", "add");
				request.setAttribute("result", "success");
				request.setAttribute("message", "User baru berhasil dibuat, silahkan cek email");
				request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("hidden_new_role")!=null) {
			String newRole = request.getParameter("hidden_new_role");
			String idToUpdate = request.getParameter("hidden_user_id");
			String idCreateBy = request.getSession().getAttribute("id").toString();
			
			try {
				UserDao userDao = new UserDao();
				userDao.updateRole(idToUpdate, newRole, idCreateBy);
				request.setAttribute("result", "success");
				request.setAttribute("message", "User berhasil diperbarui");
			} catch (Exception e) {
				request.setAttribute("result", "fail");
				request.setAttribute("message", "Terjadi kesalahan. ");
			}
		}
		
		RoleDao roleDao = new RoleDao();
		ArrayList<RoleBean> roleList = roleDao.getListRole();
		request.setAttribute("roleList", roleList);
		
		UserBean userBean = new UserBean();
		UserDao userDao = new UserDao();
		
		if(request.getParameter("user_id")==null) {
			userBean = userDao.getUserInfo(request.getParameter("hidden_user_id"));
		}else {
			userBean = userDao.getUserInfo(request.getParameter("user_id"));
		}
		
		request.setAttribute("user_id", userBean.getId());
		request.setAttribute("email", userBean.getEmail());
		request.setAttribute("name", userBean.getName());
		request.setAttribute("role", userBean.getRole());
		request.setAttribute("createDate", userBean.getCreateDate());
		request.setAttribute("createBy", userBean.getCreateBy());
		
		if(userBean.getLastUpdate() == null) {
			request.setAttribute("lastUpdate", "-");
		}else {
			request.setAttribute("lastUpdate", userBean.getLastUpdate());
		}
		
		if(userBean.getLastUpdate() == null) {
			request.setAttribute("lastUpdateBy", "-");
		}else {
			request.setAttribute("lastUpdateBy", userBean.getLastUpdateBy());
		}
		
		if(userBean.getId()==null) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
			return;
		}
		
		request.setAttribute("type", "edit");
		request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idToUpdate = request.getParameter("hidden_delete_user_id");
		String idCreateBy = request.getSession().getAttribute("id").toString();
		
		try {
			UserDao userDao = new UserDao();
			userDao.deleteUser(idToUpdate, idCreateBy);
			request.setAttribute("result", "success");
			request.setAttribute("message", "User " +idToUpdate +" berhasil dihapus");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
	
	private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDao userDao = new UserDao();
			ArrayList<UserBean> userList = userDao.getUserList();
			
			request.setAttribute("userList", userList);
			request.setAttribute("type", "list");
			request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("result", "fail");
			request.setAttribute("message", "Maaf, terjadi kesalahan");
			request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
		}
	}
}
