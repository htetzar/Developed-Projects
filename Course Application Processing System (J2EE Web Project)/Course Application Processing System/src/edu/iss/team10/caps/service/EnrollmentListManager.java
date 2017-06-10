package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.EnrollmentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;

public class EnrollmentListManager {
	private EnrollmentDAO enrollmentDAO;

	public EnrollmentListManager() {
		enrollmentDAO = DAOFactory.loadInstance().getEnrollmentDAO();
	}

	public ArrayList<EnrollmentDTO> loadAllEnrollment(int offset,int noOfRecords) {
		ArrayList<EnrollmentDTO> enrollmentList = new ArrayList<EnrollmentDTO>();
		try {
			enrollmentList = enrollmentDAO.loadAllEnrollment(offset,noOfRecords);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
        return enrollmentList;
	}

	public int deleteEnrollment(StudentDTO student,CourseDTO course) {
		int delete = 0;
		try {
			delete = enrollmentDAO.deleteEnrollment(student, course);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}

	public ArrayList<EnrollmentDTO> loadStudentEnrollment(String studentId,int offset,int noOfRecords) {
		ArrayList<EnrollmentDTO> studentEnrollmentList = new ArrayList<EnrollmentDTO>();
		try {
			studentEnrollmentList = enrollmentDAO.loadStudentEnrollment(studentId,offset,noOfRecords);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return studentEnrollmentList;
	}
	
	public ArrayList<EnrollmentDTO> loadStudentEnrollmentSearch(String studentId,int offset,int noOfRecords) {
		ArrayList<EnrollmentDTO> studentEnrollmentList = new ArrayList<EnrollmentDTO>();
		try {
			studentEnrollmentList = enrollmentDAO.loadStudentEnrollmentSearch(studentId,offset,noOfRecords);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return studentEnrollmentList;
	} 

}
