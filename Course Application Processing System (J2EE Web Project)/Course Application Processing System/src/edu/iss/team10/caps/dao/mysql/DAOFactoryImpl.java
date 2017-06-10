package edu.iss.team10.caps.dao.mysql;

import edu.iss.team10.caps.dao.CourseDAO;
import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.EnrollmentDAO;
import edu.iss.team10.caps.dao.LecturerDAO;
import edu.iss.team10.caps.dao.LoginDAO;
import edu.iss.team10.caps.dao.StudentDAO;

public class DAOFactoryImpl extends DAOFactory {

	private StudentDAO studentDAO = new StudentDAOImpl();
	private LoginDAO loginDAO = new LoginDAOImpl();
	private CourseDAO courseDAO = new CourseDAOImpl();
	private LecturerDAO lecturerDAO = new LecturerDAOImpl();
	private EnrollmentDAO enrollmentDAO = new EnrollmentDAOImpl();

	@Override
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

	@Override
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	@Override
	public CourseDAO getCourseDAO() {
		return courseDAO;
	}

	@Override
	public LecturerDAO getLecturerDAO() {
		return lecturerDAO;
	}

	@Override
	public EnrollmentDAO getEnrollmentDAO() {
		return enrollmentDAO;
	}
}
