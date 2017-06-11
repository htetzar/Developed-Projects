package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.LecturerDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LecturerSearchDTO;


public class LecturerManager {
	private LecturerDAO lecturerDAO;

	public LecturerManager() {
		lecturerDAO = DAOFactory.loadInstance().getLecturerDAO();
	}

    public int getTotalLecturerCount() {
    	int totallecturercount=0;
    	try {
			totallecturercount=lecturerDAO.getTotalLecturerCount();
		} catch (DAOException e) {
			e.printStackTrace();
		}
    	return totallecturercount;
    }
    
    
	public ArrayList<LecturerDTO> findLecturersByCriteria(LecturerSearchDTO lecturerSearchDTO) {
		ArrayList<LecturerDTO> currentList = new ArrayList<LecturerDTO>();
		try {
			currentList = lecturerDAO.findLecturerByCriteria(lecturerSearchDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}
  
	public LecturerDTO findLecturer(String lecturerId) {
		LecturerDTO currentLecturer = new LecturerDTO();
		try {
			currentLecturer = lecturerDAO.findLecturer(lecturerId);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentLecturer;
	}

	public ArrayList<LecturerDTO> findAllLecturer(){
		ArrayList<LecturerDTO> currentList = new ArrayList<LecturerDTO>();
		try {
			currentList = lecturerDAO.findAllLecturer();
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public ArrayList<LecturerDTO> findAllLecturer(int offset,int noOfRecords) {
		ArrayList<LecturerDTO> currentList = new ArrayList<LecturerDTO>();
		try {
			currentList = lecturerDAO.findAllLecturer(offset,noOfRecords);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public int insertLecturer(LecturerDTO lecturer) {
		int insert = 0;
		try {
			insert = lecturerDAO.insertLecturer(lecturer);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}

	public int updateLecturer(LecturerDTO lecturer) {
		int update = 0;
		try {
			update = lecturerDAO.updateLecturer(lecturer);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return update;
	}

	public int deletelecturer(LecturerDTO lecturer) {
		int delete = 0;
		try {
			delete = lecturerDAO.deleteLecturer(lecturer);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}


	public ArrayList<CourseDTO> findCoursesByLecturer(String lecturerId) {
		ArrayList<CourseDTO> courseDTOs = null;
		try {
			courseDTOs = lecturerDAO.findCoursesByLecturer(lecturerId);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {			
		}
		return courseDTOs;
	}
	
	public ArrayList<EnrollmentDTO> gradeStudent(String courseId) {
		ArrayList<EnrollmentDTO> enrollmentDTOs = null;
		try {
			enrollmentDTOs = lecturerDAO.gradeStudent(courseId);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			
		}
		return enrollmentDTOs;		
	}
	
	public String saveStudentGrade(String studentId,String courseName,Float grade) {		
		String courseId = null;
		try {
			courseId = lecturerDAO.saveStudentGrade(studentId,courseName,grade);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			
		}
		return courseId;		
	}
	
	
	public ArrayList<EnrollmentDTO> viewStudentPerformance(String courseId) {		
		ArrayList<EnrollmentDTO> enrollmentDTOs = null;
		try {
			enrollmentDTOs = lecturerDAO.viewStudentPerformance(courseId);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			
		}
		return enrollmentDTOs;		
	}
	
	public ArrayList<EnrollmentDTO> viewEnrolledStudents(String courseId){
		ArrayList<EnrollmentDTO> enrollmentDTOs = null;
		try {
			enrollmentDTOs = lecturerDAO.viewEnrollmentStudents(courseId);
		} catch (DAOException e) {
			e.printStackTrace();
		}  catch (MyDataException e) {
			e.printStackTrace();
		} finally {
			
		}
		return enrollmentDTOs;			
	}
	
	public String getLastLecturer() {
		String lecturerId = "";
		try {
			lecturerId = lecturerDAO.getLastLecturer();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return lecturerId;
	}
}
