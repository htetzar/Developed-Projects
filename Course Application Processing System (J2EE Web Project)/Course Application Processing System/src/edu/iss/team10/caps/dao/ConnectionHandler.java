package edu.iss.team10.caps.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionHandler {

	public final static String URL = "jdbc:mysql://localhost/caps?verifyServerCertificate=false&useSSL=true";
	public final static String USER = "root";
	public final static String PASSWORD = "hzca1111";
	public final static String DRIVER_CLASS = "com.mysql.jdbc.Driver";

	public static Connection openConnection() {
		Connection connection = null;
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			System.err.println("Error: Unable to load the driver class.\n" + e.getMessage());
		}

		try {
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			System.err.println("ERROR: Unable to Connect to Database.\n" + e.getMessage());
		}
		return connection;
	}

	public static void closeConnection(Connection connection, PreparedStatement pstatement) {
		try {
			pstatement.close();
			connection.close();
		} catch (SQLException e) {
			System.err.println("Error: Unable to Close to Database.\n" + e.getMessage());
		}
	}

}
