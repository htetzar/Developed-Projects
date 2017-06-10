package edu.iss.team10.caps.dao;

import edu.iss.team10.caps.dao.mysql.DAOFactoryImpl;

public abstract class DAOFactory {

	public abstract StudentDAO getStudentDAO();

	public abstract LoginDAO getLoginDAO();

	public abstract CourseDAO getCourseDAO();

	public abstract LecturerDAO getLecturerDAO();

	public abstract EnrollmentDAO getEnrollmentDAO();

	public static DAOFactory loadInstance() {
		return new DAOFactoryImpl();
	}

}
