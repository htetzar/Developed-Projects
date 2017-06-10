package edu.iss.team10.caps.service;

import java.util.ArrayList;

import edu.iss.team10.caps.dao.DAOFactory;
import edu.iss.team10.caps.dao.StudentDAO;
import edu.iss.team10.caps.exception.DAOException;
import edu.iss.team10.caps.exception.MyDataException;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.model.StudentSearchDTO;

public class StudentManager {

	private StudentDAO studentDAO;

	public StudentManager() {
		studentDAO = DAOFactory.loadInstance().getStudentDAO();
	}

	public int getTotalStudentCount() {
		int totalStudentCount = 0;
		try {
			totalStudentCount = studentDAO.getTotalStudentCount();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return totalStudentCount;
	}

	public ArrayList<StudentDTO> findStudentsByCriteria(StudentSearchDTO studentSearchDTO) {
		ArrayList<StudentDTO> currentList = new ArrayList<StudentDTO>();
		try {
			currentList = studentDAO.findStudentByCriteria(studentSearchDTO);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public StudentDTO findStudent(String studentId) {
		StudentDTO currentStudent = new StudentDTO();
		try {
			currentStudent = studentDAO.findStudent(studentId);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentStudent;
	}

	public ArrayList<StudentDTO> findAllStudent(int offSet, int noOfRec) {
		ArrayList<StudentDTO> currentList = new ArrayList<StudentDTO>();
		try {
			currentList = studentDAO.findAllStudent(offSet, noOfRec);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return currentList;
	}

	public int insertStudent(StudentDTO student) {
		int insert = 0;
		try {
			insert = studentDAO.insertStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return insert;
	}

	public int updateStudent(StudentDTO student) {
		int update = 0;
		try {
			update = studentDAO.updateStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return update;
	}

	public int deletestudent(StudentDTO student) {
		int delete = 0;
		try {
			delete = studentDAO.deleteStudent(student);
		} catch (DAOException e) {
			e.printStackTrace();
		} catch (MyDataException e) {
			e.printStackTrace();
		}
		return delete;
	}
	
	public String getLastStudent() {
		String studentId = "";
		try {
			studentId = studentDAO.getLastStudent();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return studentId;
	}
}
