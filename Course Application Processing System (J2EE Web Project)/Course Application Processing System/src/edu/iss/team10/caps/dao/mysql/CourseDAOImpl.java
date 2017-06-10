package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.CourseDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.CourseSearchDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.service.LecturerManager;

public class CourseDAOImpl implements CourseDAO {

	private ResultSet rs;
	public static int noOfRecords;

	@Override
	public CourseDTO findCourse(String courseId) throws DAOException, MyDataException {
		CourseDTO courseDTO = null;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String selectCourse = "SELECT * FROM caps.course WHERE courseId=?";

		try {
			pstatement = connection.prepareStatement(selectCourse);
			pstatement.setString(1, courseId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String lecturerId = rs.getString("lecturerId");
				LecturerDTO lecturer = new LecturerManager().findLecturer(lecturerId);
				courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"), lecturer,
						rs.getString("courseDescription"), rs.getString("courseType"), rs.getDouble("courseDuration"),
						rs.getDate("courseStartDate"), rs.getInt("courseSize"), rs.getFloat("courseCredit"),
						rs.getDate("createdDate"));
			}
			if (courseDTO == null) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return courseDTO;
	}

	@Override
	public ArrayList<CourseDTO> findAllCourse(int offset, int noOfRecords) throws DAOException, MyDataException {
		ArrayList<CourseDTO> result = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;

		String select = "SELECT SQL_CALC_FOUND_ROWS  * FROM caps.course limit " + offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String lecturerId = rs.getString("lecturerId");
				LecturerDTO lecturer = new LecturerManager().findLecturer(lecturerId);
				CourseDTO courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"), lecturer,
						rs.getString("courseDescription"), rs.getString("courseType"), rs.getDouble("courseDuration"),
						rs.getDate("courseStartDate"), rs.getInt("courseSize"), rs.getFloat("courseCredit"),
						rs.getDate("createdDate"));
				result.add(courseDTO);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public ArrayList<CourseDTO> findCourseByCriteria(CourseSearchDTO courseSearchDTO)
			throws DAOException, MyDataException {
		ArrayList<CourseDTO> result = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = null;
		if (courseSearchDTO.getCourseName().trim().equalsIgnoreCase("")) {
			select = "SELECT * FROM caps.course WHERE courseName LIKE '" + courseSearchDTO.getCourseName().trim()
					+ "%';";
		} else {
			if (courseSearchDTO.getCourseName().trim().equalsIgnoreCase("")) {
				select = "SELECT * FROM caps.course WHERE courseName LIKE '" + courseSearchDTO.getCourseName().trim()
						+ "%';";
			} else {
				select = "SELECT * FROM caps.course WHERE courseId LIKE '" + courseSearchDTO.getCourseId().trim()
						+ "%' AND coursetName LIKE '" + courseSearchDTO.getCourseName() + "%';";
			}
		}
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String lecturerId = rs.getString("lecturerId");
				LecturerDTO lecturer = new LecturerManager().findLecturer(lecturerId);
				CourseDTO courseDTO = new CourseDTO(rs.getString("courseId"), rs.getString("courseName"), lecturer,
						rs.getString("courseDescription"), rs.getString("courseType"), rs.getDouble("courseDuration"),
						rs.getDate("courseStartDate"), rs.getInt("courseSize"), rs.getFloat("courseCredit"),
						rs.getDate("createdDate"));
				result.add(courseDTO);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve all course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int insertCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date courseStartDate = new java.sql.Date(course.getCourseStartDate().getTime());
		java.sql.Date courseCreatedDate = new java.sql.Date(course.getCreatedDate().getTime());
		String ins = "INSERT INTO caps.course(courseId, courseName, lecturerId, courseDescription, courseType,"
				+ "courseDuration, courseStartDate, courseSize, courseCredit, createdDate) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseId());
			pstatement.setString(2, course.getCourseName());
			pstatement.setString(3, course.getLecturer().getLecturerId());
			pstatement.setString(4, course.getCourseDescription());
			pstatement.setString(5, course.getCourseType());
			pstatement.setDouble(6, course.getCourseDuration());
			pstatement.setDate(7, courseStartDate);
			pstatement.setInt(8, course.getCourseSize());
			pstatement.setFloat(9, course.getCourseCredit());
			pstatement.setDate(10, courseCreatedDate);

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Insert Specific Course!");
			} else {
				System.out.println("Success ! Insert Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to insert Course info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int updateCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		java.sql.Date courseStartDate = new java.sql.Date(course.getCourseStartDate().getTime());
		String ins = "UPDATE caps.course SET courseName=?, lecturerId=?, courseDescription=?, courseType=?, courseDuration=?, courseStartDate=?, courseSize=?, courseCredit=? WHERE courseId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseName());
			pstatement.setString(2, course.getLecturer().getLecturerId());
			pstatement.setString(3, course.getCourseDescription());
			pstatement.setString(4, course.getCourseType());
			pstatement.setDouble(5, course.getCourseDuration());
			pstatement.setDate(6, courseStartDate);
			pstatement.setInt(7, course.getCourseSize());
			pstatement.setFloat(8, course.getCourseCredit());
			pstatement.setString(9, course.getCourseId());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Update Specific Course!");
			} else {
				System.out.println("Success ! Update Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Update Course info to database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int deleteCourse(CourseDTO course) throws DAOException, MyDataException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String ins = "DELETE FROM caps.course WHERE courseId = ?; ";
		try {
			pstatement = connection.prepareStatement(ins);
			pstatement.setString(1, course.getCourseId());

			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("FAIL! Delete Specific Course!");
			} else {
				System.out.println("Success ! Delete Course!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete Course info from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	@Override
	public int getTotalCourseCount() throws DAOException {
		int courseTotalCount = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "select count(courseId) as courseCount from caps.course;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				courseTotalCount = rs.getInt("courseCount");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Course Count from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return courseTotalCount;
	}

	@Override
	public String getLastCourse() throws DAOException {
		String courseId = "";
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "SELECT courseId FROM caps.course order by createdDate DESC limit 1;";
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				courseId = rs.getString("courseId");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Select Last Course ID from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return courseId;
	}

	public ArrayList<CourseDTO> listByCourse(String userId) {
		ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "select * from (select c.courseId,c.courseName,c.courseStartDate ,c.courseDuration,c.courseSize - count(e.courseId)As AvailableSlot"
				+ " from course c left join enrollment e on c.courseId=e.courseId where now() < c.courseStartDate group by c.courseId) s where s.courseid not in"
				+ " (select c.courseId from caps.course c,caps.enrollment e,caps.student s where c.courseID =e.courseId and e.studentId=s.studentId"
				+ " and s.studentId=? group by c.courseId);";
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String courseId = rs.getString("courseId");
				String courseName = rs.getString("courseName");
				Date courseStartDate = rs.getDate("courseStartDate");
				Double courseDuration = rs.getDouble("courseDuration");
				int courseSize = rs.getInt("AvailableSlot");
				LecturerDTO lecturerDTO = new LecturerDTO();
				if (courseSize > 0) {
					CourseDTO courseDTO = new CourseDTO(courseId, courseName, lecturerDTO, "", "", courseDuration,
							courseStartDate, courseSize, 0.0f, new Date());
					courseList.add(courseDTO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courseList;
	}
}
