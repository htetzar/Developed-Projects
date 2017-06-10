package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.LecturerDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LecturerSearchDTO;
import edu.iss.team10.caps.model.StudentDTO;

public class LecturerDAOImpl implements LecturerDAO {

	private ResultSet rs;
	public static int noOfRecords;

	@Override
	public LecturerDTO findLecturer(String lecturerId) throws DAOException, MyDataException {
		LecturerDTO lecturerDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT * FROM caps.lecturer WHERE lecturerId=?";
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, lecturerId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"), rs.getDate("joiningDate"));
			}
			if (lecturerDTO == null) {
				throw new MyDataException("There is no Lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return lecturerDTO;
	}

	@Override
	public ArrayList<LecturerDTO> findAllLecturer() throws MyDataException {
		ArrayList<LecturerDTO> result = new ArrayList<LecturerDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT * FROM caps.lecturer; ";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"), rs.getDate("joiningDate"));
				result.add(lecturerDTO);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (result.size() == 0) {
				throw new MyDataException("There is no lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all stuedent info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<LecturerDTO> findAllLecturer(int offset, int noOfRecords) throws DAOException, MyDataException {
		ArrayList<LecturerDTO> result = new ArrayList<LecturerDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT SQL_CALC_FOUND_ROWS * FROM caps.lecturer limit " + offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"), rs.getDate("joiningDate"));
				result.add(lecturerDTO);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all stuedent info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<LecturerDTO> findLecturerByCriteria(LecturerSearchDTO lecturerSearchDTO)
			throws DAOException, MyDataException {
		ArrayList<LecturerDTO> result = new ArrayList<LecturerDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = null;
		if (lecturerSearchDTO.getLecturerName().trim().equalsIgnoreCase("")) {

			select = "SELECT * FROM caps.lecturer WHERE lecturerName LIKE '"
					+ lecturerSearchDTO.getLecturerName().trim() + "%';";
		} else {
			if (lecturerSearchDTO.getLecturerName().trim().equalsIgnoreCase("")) {
				select = "SELECT * FROM caps.lecturer WHERE lecturerName LIKE '"
						+ lecturerSearchDTO.getLecturerName().trim() + "%';";
			} else {
				select = "SELECT * FROM caps.lecturer WHERE lecturerId LIKE '"
						+ lecturerSearchDTO.getLecturerId().trim() + "%' AND lecturerName LIKE '"
						+ lecturerSearchDTO.getLecturerName() + "%';";
			}
		}
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				LecturerDTO lecturerDTO = new LecturerDTO(rs.getString("lecturerId"), rs.getString("lecturerName"),
						rs.getString("lecturerEmail"), rs.getString("lecturerPhoneNumber"),
						rs.getString("lecturerAddress"), rs.getDate("joiningDate"));
				result.add(lecturerDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no lecturer Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int insertLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date lecturerJoiningDate = new java.sql.Date(lecturer.getJoiningDate().getTime());
		String ins = "INSERT INTO caps.lecturer(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber, lecturerAddress, joiningDate) "
				+ "VALUES (?,?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerId());
			pstatement.setString(2, lecturer.getLecturerName());
			pstatement.setString(3, lecturer.getLecturerEmail());
			pstatement.setString(4, lecturer.getLecturerPhoneNumber());
			pstatement.setString(5, lecturer.getLecturerAddress());
			pstatement.setDate(6, lecturerJoiningDate);			
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
	public int updateLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "UPDATE caps.lecturer SET lecturerName=?, lecturerEmail=?, lecturerPhoneNumber=?, lecturerAddress=? WHERE lecturerId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerName());
			pstatement.setString(2, lecturer.getLecturerEmail());
			pstatement.setString(3, lecturer.getLecturerPhoneNumber());
			pstatement.setString(4, lecturer.getLecturerAddress());
			pstatement.setString(5, lecturer.getLecturerId());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Update Specific Lecturer!");
			} else {
				System.out.println("Success ! Update Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Update Lecturer info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int deleteLecturer(LecturerDTO lecturer) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "DELETE FROM caps.lecturer WHERE lecturerId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, lecturer.getLecturerId());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific Lecturer!");
			} else {
				System.out.println("Success ! Delete Lecturer!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete lecturer info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int getTotalLecturerCount() {
		int getcount = 0;
		PreparedStatement ps = null;
		Connection connection = ConnectionHandler.openConnection();
		String count = "SELECT count(lecturerId) as lecturercount from caps.lecturer;";
		try {
			ps = connection.prepareStatement(count);
			rs = ps.executeQuery();
			while (rs.next()) {
				getcount = rs.getInt("lecturercount");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Lecturer Count from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, ps);
		}
		return getcount;
	}

	@Override
	public ArrayList<CourseDTO> findCoursesByLecturer(String lecturerId) throws DAOException, MyDataException {
		ArrayList<CourseDTO> result = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		LocalDateTime now = LocalDateTime.now();
		int year = now.getYear();
		try {
			pstatement = connection.prepareStatement(
					"SELECT Distinct(c.courseId),c.courseName,c.courseStartDate,c.courseDuration,c.courseSize FROM caps.course c,caps.enrollment e WHERE c.courseId = e.courseId AND c.lecturerId = ? AND YEAR(e.courseEnrollmentDate) = ?");
			pstatement.setString(1, lecturerId);
			pstatement.setInt(2, year);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				CourseDTO courseDTO = new CourseDTO();
				courseDTO.setCourseId(rs.getString("courseId"));
				courseDTO.setCourseName(rs.getString("courseName"));
				courseDTO.setCourseSize(rs.getInt("courseSize"));
				courseDTO.setCourseStartDate(rs.getDate("courseStartDate"));
				courseDTO.setCourseDuration(rs.getDouble("courseDuration"));
				result.add(courseDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Student Info!");
			}
			ConnectionHandler.closeConnection(connection, pstatement);
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all student info from database.\n" + e.getMessage());

		} finally {

		}
		return result;
	}

	@Override
	public ArrayList<EnrollmentDTO> gradeStudent(String courseId) throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		EnrollmentDTO enrollmentDTO;
		CourseDTO courseDTO;
		StudentDTO studentDTO;
		rs = null;
		LocalDateTime now = LocalDateTime.now();
		int year = now.getYear();
		try {
			pstatement = connection.prepareStatement(
					"SELECT e.grade,c.courseName,c.courseCredit,s.studentId,s.studentName FROM caps.enrollment e,caps.course c,caps.student s WHERE e.courseId=c.courseId AND e.studentId=s.studentId AND c.courseId = ? AND YEAR(e.courseEnrollmentDate) = ? AND e.grade = 0 AND NOW() > DATE_ADD(c.courseStartDate,INTERVAL c.courseDuration DAY)");
			pstatement.setString(1, courseId);
			pstatement.setInt(2, year);

			rs = pstatement.executeQuery();
			System.out.println(rs.getRow());
			while (rs.next()) {
				enrollmentDTO = new EnrollmentDTO();
				courseDTO = new CourseDTO();
				studentDTO = new StudentDTO();
				enrollmentDTO.setCourseDTO(courseDTO);
				enrollmentDTO.setStudentDTO(studentDTO);
				enrollmentDTO.getCourseDTO().setCourseName(rs.getString("courseName"));
				enrollmentDTO.getCourseDTO().setCourseCredit(rs.getFloat("courseCredit"));
				enrollmentDTO.getStudentDTO().setStudentId(rs.getString("studentId"));
				enrollmentDTO.getStudentDTO().setStudentName(rs.getString("studentName"));
				enrollmentDTO.setGrade(rs.getFloat("grade"));
				result.add(enrollmentDTO);
			}
			/*
			 * if (result.size() == 0) { throw new
			 * MyDataException("There is no Student Info!"); }
			 */
			ConnectionHandler.closeConnection(connection, pstatement);
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all student info from database.\n" + e.getMessage());
		}
		return result;
	}

	@Override
	public String saveStudentGrade(String studentId, String courseName, Float grade)
			throws DAOException, MyDataException {
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		rs = null;
		String courseId = null;
		try {
			pstatement = connection.prepareStatement("SELECT courseId FROM caps.course WHERE courseName = ?");
			pstatement.setString(1, courseName);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				courseId = rs.getString("courseId");
			}
			pstatement = connection
					.prepareStatement("UPDATE caps.enrollment SET grade = ? WHERE studentId = ? AND courseId = ?");
			pstatement.setFloat(1, grade);
			pstatement.setString(2, studentId);
			pstatement.setString(3, courseId);
			pstatement.executeUpdate();
			ConnectionHandler.closeConnection(connection, pstatement);
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all student info from database.\n" + e.getMessage());
		}
		return courseId;
	}

	@Override
	public ArrayList<EnrollmentDTO> viewStudentPerformance(String courseId) throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		rs = null;
		LocalDateTime now = LocalDateTime.now();
		int year = now.getYear();
		EnrollmentDTO enrollmentDTO;
		CourseDTO courseDTO;
		StudentDTO studentDTO;
		try {
			pstatement = connection.prepareStatement(
					"SELECT s.studentId,s.studentName,c.courseName,e.grade FROM caps.enrollment e,caps.course c,caps.student s WHERE e.courseId=c.courseId AND e.studentId=s.studentId AND c.courseId = ? AND YEAR(e.courseEnrollmentDate) = ? AND e.grade != 0");
			pstatement.setString(1, courseId);
			pstatement.setInt(2, year);
			rs = pstatement.executeQuery();
			System.out.println(rs.getRow());
			while (rs.next()) {
				enrollmentDTO = new EnrollmentDTO();
				courseDTO = new CourseDTO();
				studentDTO = new StudentDTO();
				enrollmentDTO.setCourseDTO(courseDTO);
				enrollmentDTO.setStudentDTO(studentDTO);
				enrollmentDTO.getCourseDTO().setCourseName(rs.getString("courseName"));
				enrollmentDTO.getStudentDTO().setStudentId(rs.getString("studentId"));
				enrollmentDTO.getStudentDTO().setStudentName(rs.getString("studentName"));
				enrollmentDTO.setGrade(rs.getFloat("grade"));
				result.add(enrollmentDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Student Info!");
			}
			ConnectionHandler.closeConnection(connection, pstatement);
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all student info from database.\n" + e.getMessage());

		} finally {

		}
		return result;
	}

	@Override
	public ArrayList<EnrollmentDTO> viewEnrollmentStudents(String courseId) throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		rs = null;
		EnrollmentDTO enrollmentDTO;
		CourseDTO courseDTO;
		StudentDTO studentDTO;
		try {
			pstatement = connection.prepareStatement(
					"SELECT s.studentId,s.studentName,s.studentEmail,s.enrollmentDate,c.courseName FROM caps.course c,caps.student s,caps.enrollment e WHERE e.courseId=c.courseId AND e.studentId=s.studentId AND c.courseId = ?");
			pstatement.setString(1, courseId);
			rs = pstatement.executeQuery();
			System.out.println(rs.getRow());
			while (rs.next()) {
				enrollmentDTO = new EnrollmentDTO();
				courseDTO = new CourseDTO();
				studentDTO = new StudentDTO();
				enrollmentDTO.setCourseDTO(courseDTO);
				enrollmentDTO.setStudentDTO(studentDTO);
				enrollmentDTO.getStudentDTO().setStudentId(rs.getString("studentId"));
				enrollmentDTO.getStudentDTO().setStudentName(rs.getString("studentName"));
				enrollmentDTO.getStudentDTO().setStudentEmail(rs.getString("studentEmail"));
				enrollmentDTO.setCourseEnrollmentDate(rs.getDate("enrollmentDate"));
				enrollmentDTO.getCourseDTO().setCourseName(rs.getString("courseName"));
				result.add(enrollmentDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Student Info!");
			}
			ConnectionHandler.closeConnection(connection, pstatement);
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all student info from database.\n" + e.getMessage());

		} finally {

		}
		return result;
	}

	@Override
	public String getLastLecturer() throws DAOException {
		String lecturerId = "";
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT lecturerId FROM caps.lecturer order by joiningDate DESC limit 1;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				lecturerId = rs.getString("lecturerId");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Last Lecturer ID from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return lecturerId;
	}
}
