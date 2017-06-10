package edu.iss.team10.caps.model;

import java.io.Serializable;

public class StudentSearchDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String studentId;

	String studentName;

	public StudentSearchDTO() {
		super();
	}

	public StudentSearchDTO(String studentId, String studentName) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	@Override
	public String toString() {
		return "StudentSearchDTO [studentId=" + studentId + ", studentName=" + studentName + "]";
	}

}
