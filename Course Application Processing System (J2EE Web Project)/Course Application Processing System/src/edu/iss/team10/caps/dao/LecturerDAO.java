package edu.iss.team10.caps.dao;

import java.util.ArrayList;

import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LecturerSearchDTO;

public interface LecturerDAO {

	LecturerDTO findLecturer(String lecturerId) throws DAOException, MyDataException;

	ArrayList<LecturerDTO> findAllLecturer() throws DAOException, MyDataException;
	
	ArrayList<LecturerDTO> findAllLecturer(int offset,int noOfRecords) throws DAOException, MyDataException;

	ArrayList<LecturerDTO> findLecturerByCriteria(LecturerSearchDTO lecturerSearchDTO)
			throws DAOException, MyDataException;

	int insertLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int updateLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int deleteLecturer(LecturerDTO lecturer) throws DAOException, MyDataException;

	int getTotalLecturerCount() throws DAOException;
	
	public ArrayList<CourseDTO> findCoursesByLecturer(String lecturerId) throws DAOException, MyDataException;

	public ArrayList<EnrollmentDTO> gradeStudent(String courseId) throws DAOException, MyDataException;
	
	public String saveStudentGrade(String studentId,String courseName,Float grade) throws DAOException, MyDataException;
	
	public ArrayList<EnrollmentDTO> viewStudentPerformance(String courseId) throws DAOException, MyDataException;
	
	public ArrayList<EnrollmentDTO> viewEnrollmentStudents(String courseId) throws DAOException, MyDataException;	

	public String getLastLecturer() throws DAOException;
}
