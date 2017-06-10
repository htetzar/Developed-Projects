package edu.iss.team10.caps.dao;

import java.util.ArrayList;

import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.StudentDTO;

public interface EnrollmentDAO {
	public ArrayList<EnrollmentDTO> listByStudentId(String userId);

	public ArrayList<EnrollmentDTO> loadAllEnrollment(int offset,int noOfRecords) throws DAOException, MyDataException;

	public int deleteEnrollment(StudentDTO student, CourseDTO course) throws DAOException, MyDataException;

	public ArrayList<EnrollmentDTO> loadStudentEnrollment(String studentId,int offset,int noOfRecords) throws DAOException, MyDataException;
	
	public ArrayList<EnrollmentDTO> loadStudentEnrollmentSearch(String userId, int offset, int noOfRecords) throws DAOException, MyDataException;
}
