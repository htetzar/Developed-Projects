package edu.iss.team10.caps.model;

import java.util.Date;

public class EnrollmentDTO {
	private CourseDTO courseDTO;
	private StudentDTO studentDTO;
	private Date courseEnrollmentDate;
	private float grade;
	private boolean allowDelete;

	public CourseDTO getCourseDTO() {
		return courseDTO;
	}

	public void setCourseDTO(CourseDTO courseDTO) {
		this.courseDTO = courseDTO;
	}

	public StudentDTO getStudentDTO() {
		return studentDTO;
	}

	public void setStudentDTO(StudentDTO studentDTO) {
		this.studentDTO = studentDTO;
	}

	public Date getCourseEnrollmentDate() {
		return courseEnrollmentDate;
	}

	public void setCourseEnrollmentDate(Date courseEnrollmentDate) {
		this.courseEnrollmentDate = courseEnrollmentDate;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public boolean isAllowDelete() {
		return allowDelete;
	}

	public void setAllowDelete(boolean allowDelete) {
		this.allowDelete = allowDelete;
	}

	public EnrollmentDTO(CourseDTO courseDTO, StudentDTO studentDTO, Date courseEnrollmentDate, float grade,
			boolean allowDelete) {
		super();
		this.courseDTO = courseDTO;
		this.studentDTO = studentDTO;
		this.courseEnrollmentDate = courseEnrollmentDate;
		this.grade = grade;
		this.allowDelete = allowDelete;
	}

	public EnrollmentDTO() {
		super();
	}

	@Override
	public String toString() {
		return "EnrollmentDTO [courseDTO=" + courseDTO + ", studentDTO=" + studentDTO + ", courseEnrollmentDate="
				+ courseEnrollmentDate + ", grade=" + grade + "]";
	}

}
