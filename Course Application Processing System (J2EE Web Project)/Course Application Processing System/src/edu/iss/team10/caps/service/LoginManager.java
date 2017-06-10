package edu.iss.team10.caps.service;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.LoginDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LoginDTO;

public class LoginManager {
	private LoginDAO loginDAO;

	public LoginManager() {
		loginDAO = DAOFactory.loadInstance().getLoginDAO();
	}

	
	public LoginDTO findUser(String userId, String password) {
		LoginDTO currentLogin = new LoginDTO();
		try {
			currentLogin = loginDAO.findUser(userId, password);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MyDataException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}
		return currentLogin;
	}

	public int insertUser(String userId, String password, String role){
		int insert = 0;
		try {
			insert = loginDAO.insertUser(userId, password, role);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}
	
	public int deleteUser(String userId){
		int delete = 0;
		try {
			delete = loginDAO.deleteUser(userId);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}	
}
