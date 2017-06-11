package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.LoginDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.LoginDTO;

public class LoginDAOImpl implements LoginDAO{

	private ResultSet rs;
	@Override
	public LoginDTO findUser(String userId, String password) throws DAOException,MyDataException {		
		LoginDTO loginDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;		
		String sl= "SELECT * FROM caps.login WHERE userId = ? AND password = ?";		
		try {
			pstatement = connection.prepareStatement(sl);
			pstatement.setString(1, userId);
			pstatement.setString(2, password);
			rs = pstatement.executeQuery();
			while(rs.next())
			{
				loginDTO = new LoginDTO(rs.getString("userId"),rs.getString("password"),rs.getString("role"));
			}
		} catch (SQLException e) {
			System.err.println("Error!occure");;
		}finally
		{
			ConnectionHandler.closeConnection(connection, pstatement);
		}		
		return loginDTO;
	}
	
	@Override
	public int insertUser(String userId, String password, String role) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "INSERT INTO caps.login(userId, password, role)"
				+ "VALUES (?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, userId);
			pstatement.setString(2, password);
			pstatement.setString(3, role);			
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Lecturer!");
			} else {
				System.out.println("Success ! Insert Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert lecturer info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;		
	}
	
	@Override
	public int deleteUser(String userId) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "DELETE FROM caps.login WHERE userId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, userId);
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific User!");
			} else {
				System.out.println("Success ! Delete User!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete User info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}
}
