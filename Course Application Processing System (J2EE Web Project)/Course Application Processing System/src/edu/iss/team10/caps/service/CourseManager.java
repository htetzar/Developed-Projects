package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.CourseDAO;
import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.EnrollmentDAO;
import edu.iss.team10.caps.dao.StudentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.CourseSearchDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;

public class CourseManager {

	private CourseDAO courseDAO;

	private EnrollmentDAO enrollmentDAO;

	private StudentDAO studentDAO;

	public CourseManager() {
		courseDAO = DAOFactory.loadInstance().getCourseDAO();
		enrollmentDAO = DAOFactory.loadInstance().getEnrollmentDAO();
		studentDAO = DAOFactory.loadInstance().getStudentDAO();
	}

	public int getTotalCourseCount() {
		int totalCourseCount = 0;
		try {
			totalCourseCount = courseDAO.getTotalCourseCount();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return totalCourseCount;
	}

	public ArrayList<CourseDTO> findCoursesByCriteria(CourseSearchDTO courseSearchDTO) {
		ArrayList<CourseDTO> currentList = new ArrayList<CourseDTO>();
		try {
			currentList = courseDAO.findCourseByCriteria(courseSearchDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public CourseDTO findCourse(String courseName) {
		CourseDTO currentCourse = new CourseDTO();
		try {
			currentCourse = courseDAO.findCourse(courseName);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentCourse;
	}

	public ArrayList<CourseDTO> findAllCourse(int offSet, int noOfRec) {
		ArrayList<CourseDTO> currentList = new ArrayList<CourseDTO>();
		try {
			currentList = courseDAO.findAllCourse(offSet, noOfRec);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public int insertCourse(CourseDTO course) {
		int insert = 0;
		try {
			insert = courseDAO.insertCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}

	public int updateCourse(CourseDTO course) {
		int update = 0;
		try {
			update = courseDAO.updateCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return update;
	}

	public int deletecourse(CourseDTO course) {
		int delete = 0;
		try {
			delete = courseDAO.deleteCourse(course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}

	public ArrayList<EnrollmentDTO> listByStudentID(String userId) {
		ArrayList<EnrollmentDTO> currentList = new ArrayList<EnrollmentDTO>();
		try {
			currentList = enrollmentDAO.listByStudentId(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public String getLastCourse() {
		String courseId = "";
		try {
			courseId = courseDAO.getLastCourse();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return courseId;
	}

	public ArrayList<CourseDTO> listByCourse(String userId) {
		ArrayList<CourseDTO> currentList = new ArrayList<CourseDTO>();
		try {
			currentList = courseDAO.listByCourse(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public int insertEnroll(EnrollmentDTO enrollmentDTO) {
		int insert = 0;
		try {
			insert = studentDAO.insertEnroll(enrollmentDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}
}
