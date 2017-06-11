package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.StudentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.model.StudentSearchDTO;

public class StudentDAOImpl implements StudentDAO {

	private ResultSet rs;
	public static int noOfRecords;
	@Override
	public StudentDTO findStudent(String studentId) throws DAOException, MyDataException {
		StudentDTO studentDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT * FROM caps.student WHERE studentId=?";
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, studentId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				studentDTO = new StudentDTO(rs.getString("studentId"), rs.getString("studentName"),
						rs.getString("studentEmail"), rs.getString("studentPhoneNumber"),
						rs.getString("studentAddress"), rs.getDate("enrollmentDate"));
			}
			if (studentDTO == null) {
				throw new MyDataException("There is no Student Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Student info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return studentDTO;
	}

	@Override
	public ArrayList<StudentDTO> findAllStudent(int offset, int noOfRecords) throws DAOException, MyDataException {
		ArrayList<StudentDTO> result = new ArrayList<StudentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT SQL_CALC_FOUND_ROWS * FROM caps.student limit "+ offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				StudentDTO studentDTO = new StudentDTO(rs.getString("studentId"), rs.getString("studentName"),
						rs.getString("studentEmail"), rs.getString("studentPhoneNumber"),
						rs.getString("studentAddress"), rs.getDate("enrollmentDate"));
				result.add(studentDTO);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if(rs.next())
			{
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Student Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all stuedent info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<StudentDTO> findStudentByCriteria(StudentSearchDTO studentSearchDTO)
			throws DAOException, MyDataException {
		ArrayList<StudentDTO> result = new ArrayList<StudentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = null;
		if (studentSearchDTO.getStudentName().trim().equalsIgnoreCase("")) {

			select = "SELECT * FROM caps.student WHERE studentName LIKE '" + studentSearchDTO.getStudentName().trim()
					+ "%';";
		} else {
			if (studentSearchDTO.getStudentName().trim().equalsIgnoreCase("")) {
				select = "SELECT * FROM caps.student WHERE studentName LIKE '"
						+ studentSearchDTO.getStudentName().trim() + "%';";
			} else {
				select = "SELECT * FROM caps.student WHERE studentId LIKE '" + studentSearchDTO.getStudentId().trim()
						+ "%' AND studentName LIKE '" + studentSearchDTO.getStudentName() + "%';";
			}
		}
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				StudentDTO studentDTO = new StudentDTO(rs.getString("studentId"), rs.getString("studentName"),
						rs.getString("studentEmail"), rs.getString("studentPhoneNumber"),
						rs.getString("studentAddress"), rs.getDate("enrollmentDate"));
				result.add(studentDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Student Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all stuedent info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int insertStudent(StudentDTO student) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date enrollmentDate = new java.sql.Date(student.getEnrollmentDate().getTime());

		String ins = "INSERT INTO caps.student(studentId, studentName, studentEmail, studentPhoneNumber, studentAddress, enrollmentDate) "
				+ "VALUES (?,?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, student.getStudentId());
			pstatement.setString(2, student.getStudentName());
			pstatement.setString(3, student.getStudentEmail());
			pstatement.setString(4, student.getStudentPhoneNumber());
			pstatement.setString(5, student.getStudentAddress());
			pstatement.setDate(6, enrollmentDate);

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Student!");
			} else {
				System.out.println("Success ! Insert Student!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert Student info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int updateStudent(StudentDTO student) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date enrollmentDate = new java.sql.Date(student.getEnrollmentDate().getTime());
		String ins = "UPDATE caps.student SET studentName=?, studentEmail=?, studentPhoneNumber=?, studentAddress=? WHERE studentId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, student.getStudentName());
			pstatement.setString(2, student.getStudentEmail());
			pstatement.setString(3, student.getStudentPhoneNumber());
			pstatement.setString(4, student.getStudentAddress());
			pstatement.setString(5, student.getStudentId());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Update Specific Student!");
			} else {
				System.out.println("Success ! Update Student!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Update Student info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int deleteStudent(StudentDTO student) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "DELETE FROM caps.student WHERE studentId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, student.getStudentId());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific Student!");
			} else {
				System.out.println("Success ! Delete Student!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete Student info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int getTotalStudentCount() throws DAOException {
		int studentTotalCount = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "select count(studentId) as studCount from caps.student;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				studentTotalCount = rs.getInt("studCount");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Student Count from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return studentTotalCount;
	}

	@Override
	public String getLastStudent() throws DAOException {
		String studentId = "";
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT studentId FROM caps.student order by enrollmentDate DESC limit 1;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				studentId = rs.getString("studentId");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Last Student ID from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return studentId;
	}

	@Override
	public int insertEnroll(EnrollmentDTO enrollmentDTO) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date enrollmentDate = new java.sql.Date(enrollmentDTO.getCourseEnrollmentDate().getTime());
		java.sql.Date corseStartDate = new java.sql.Date(enrollmentDTO.getCourseDTO().getCourseStartDate().getTime());
		String ins = "INSERT INTO caps.enrollment(studentId, courseId, courseStartDate, courseEnrollmentDate, grade) "
				+ "VALUES (?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, enrollmentDTO.getStudentDTO().getStudentId());
			pstatement.setString(2, enrollmentDTO.getCourseDTO().getCourseId());
			pstatement.setDate(3, corseStartDate);
			pstatement.setDate(4, enrollmentDate);
			pstatement.setFloat(5, enrollmentDTO.getGrade());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Student!");
			} else {
				System.out.println("Success ! Insert Student!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert Student info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}
}
