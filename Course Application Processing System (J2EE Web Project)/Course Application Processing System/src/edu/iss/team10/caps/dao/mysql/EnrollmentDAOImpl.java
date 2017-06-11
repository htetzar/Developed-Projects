package edu.iss.team10.caps.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import edu.iss.team10.caps.dao.ConnectionHandler;
import edu.iss.team10.caps.dao.EnrollmentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.StudentManager;

public class EnrollmentDAOImpl implements EnrollmentDAO {
	private static final int allowanceForEnrollmentCancellation = 7;
	private ResultSet rs;
	public static int noOfRecords;

	public ArrayList<EnrollmentDTO> listByStudentId(String userId) {
		ArrayList<EnrollmentDTO> enrollmentList = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String select = "select * from caps.course c,caps.enrollment e,caps.student s"
				+ " where c.courseID =e.courseId and e.studentId=s.studentId and e.grade != 0 and s.studentId= ?;";
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String courseId = rs.getString("courseId");
				String studentId = rs.getString("studentId");
				float grade = rs.getFloat("grade");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				boolean allowDelete = true;
				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);
				enrollmentList.add(enrollment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return enrollmentList;
	}

	@Override
	public ArrayList<EnrollmentDTO> loadAllEnrollment(int offset, int noOfRecords)
			throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		Date currentDate = new Date(System.currentTimeMillis());
		String select = "select SQL_CALC_FOUND_ROWS * from caps.course as c, caps.student as s, caps.enrollment as e"
				+ " where e.studentId=s.studentId  and e.courseId = c.courseId order by c.courseStartDate desc limit "
				+ offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String studentId = rs.getString("studentId");
				String courseId = rs.getString("courseId");
				float grade = rs.getFloat("grade");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				boolean allowDelete = true;
				Date courseStartDate = rs.getDate("courseStartDate");
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);
				// Do not show delete button for course that has passed or
				// occurring today
				if (courseStartDate.before(currentDate) || courseStartDate.equals(currentDate)) {
					enrollment.setAllowDelete(false);
				}
				result.add(enrollment);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Enrollment Info!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve Enrollment info from database.\n");
			e.printStackTrace();
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	public int deleteEnrollment(StudentDTO student, CourseDTO course) throws MyDataException, DAOException {
		int result = 0;
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		String del = "DELETE FROM caps.enrollment where studentId = ? and courseId = ?;";
		try {
			pstatement = connection.prepareStatement(del);
			pstatement.setString(1, student.getStudentId());
			pstatement.setString(2, course.getCourseId());
			result = pstatement.executeUpdate();
			if (result <= 0) {
				throw new MyDataException("Unable to delete the enrollment, please check your input.");
			} else {
				System.out.println("Success ! Enrollment deleted!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to Delete Enrollment Record from database.\n" + e.getMessage());
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	public ArrayList<EnrollmentDTO> loadStudentEnrollment(String userId, int offset, int noOfRecords)
			throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, allowanceForEnrollmentCancellation);
		Date allowedCancelDate = new java.sql.Date(cal.getTimeInMillis());
		System.out.println(allowedCancelDate);
		String select = "select * from caps.course as c, caps.student as s, caps.enrollment as e"
				+ " where e.studentId=s.studentId and e.courseId = c.courseId and e.studentId = ?"
				+ " order by c.courseStartDate desc limit " + offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String studentId = rs.getString("studentId");
				String courseId = rs.getString("courseId");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				float grade = rs.getFloat("grade");
				boolean allowDelete = true;
				Date courseStartDate = rs.getDate("courseStartDate");
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);
				// Do not show delete button for course that has passed or
				// occurring today
				if (courseStartDate.before(allowedCancelDate) || courseStartDate.equals(allowedCancelDate)) {
					enrollment.setAllowDelete(false);
				}
				result.add(enrollment);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Enrollment Info available!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve Enrollment info from database.\n");
			e.printStackTrace();
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	public ArrayList<EnrollmentDTO> loadStudentEnrollmentPage(String userId, int offset, int noOfRecords)
			throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, allowanceForEnrollmentCancellation);
		Date allowedCancelDate = new java.sql.Date(cal.getTimeInMillis());
		System.out.println(allowedCancelDate);
		String select = "select * from caps.course as c, caps.student as s, caps.enrollment as e"
				+ " where e.studentId=s.studentId and e.courseId = c.courseId and e.studentId = ?"
				+ " order by c.courseStartDate desc limit " + offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				String studentId = rs.getString("studentId");
				String courseId = rs.getString("courseId");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				float grade = rs.getFloat("grade");
				boolean allowDelete = true;
				Date courseStartDate = rs.getDate("courseStartDate");
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);
				// Do not show delete button for course that has passed or
				// occurring today
				if (courseStartDate.before(allowedCancelDate) || courseStartDate.equals(allowedCancelDate)) {
					enrollment.setAllowDelete(false);
				}
				result.add(enrollment);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Enrollment Info available!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve Enrollment info from database.\n");
			e.printStackTrace();
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

	public ArrayList<EnrollmentDTO> loadStudentEnrollmentSearch(String userId, int offset, int noOfRecords)
			throws DAOException, MyDataException {
		ArrayList<EnrollmentDTO> result = new ArrayList<EnrollmentDTO>();
		Connection connection = ConnectionHandler.openConnection();
		PreparedStatement pstatement = null;
		Date currentDate = new Date(System.currentTimeMillis());
		String select = "select * from caps.course as c, caps.student as s, caps.enrollment as e"
				+ " where e.studentId=s.studentId and e.courseId = c.courseId and e.studentId = ?"
				+ " order by c.courseStartDate desc limit " + offset + "," + noOfRecords;
		try {
			pstatement = connection.prepareStatement(select);
			pstatement.setString(1, userId);

			rs = pstatement.executeQuery();
			while (rs.next()) {
				String studentId = rs.getString("studentId");
				String courseId = rs.getString("courseId");
				Date courseEnrollmentDate = rs.getDate("courseEnrollmentDate");
				float grade = rs.getFloat("grade");
				boolean allowDelete = true;
				Date courseStartDate = rs.getDate("courseStartDate");
				CourseDTO newCourse = new CourseManager().findCourse(courseId);
				StudentDTO newStudent = new StudentManager().findStudent(studentId);
				EnrollmentDTO enrollment = new EnrollmentDTO(newCourse, newStudent, courseEnrollmentDate, grade,
						allowDelete);

				// Do not show delete button for course that has passed or
				// occurring today
				if (courseStartDate.before(currentDate) || courseStartDate.equals(currentDate)) {
					enrollment.setAllowDelete(false);
				}
				result.add(enrollment);
			}
			rs.close();
			rs = pstatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			if (result.size() == 0) {
				throw new MyDataException("There is no Course Enrollment Info available!");
			}
		} catch (SQLException e) {
			System.err.println("Error: Unable to retrieve Enrollment info from database.\n");
			e.printStackTrace();
		} finally {
			ConnectionHandler.closeConnection(connection, pstatement);
		}
		return result;
	}

}
