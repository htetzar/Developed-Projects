package edu.iss.team10.caps.model;

import java.io.Serializable;
import java.util.Date;

public class CourseDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String courseId;
	private String courseName;
	private LecturerDTO lecturer;
	private String courseDescription;
	private String courseType;
	private Double courseDuration;
	private Date courseStartDate;
	private int courseSize;
	private float courseCredit;
	private Date createdDate;

	public CourseDTO() {
		super();
	}

	public CourseDTO(String courseId, String courseName, LecturerDTO lecturer, String courseDescription,
			String courseType, Double courseDuration, Date courseStartDate, int courseSize, float courseCredit,
			Date createdDate) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.lecturer = lecturer;
		this.courseDescription = courseDescription;
		this.courseType = courseType;
		this.courseDuration = courseDuration;
		this.courseStartDate = courseStartDate;
		this.courseSize = courseSize;
		this.courseCredit = courseCredit;
		this.createdDate = createdDate;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public LecturerDTO getLecturer() {
		return lecturer;
	}

	public void setLecturer(LecturerDTO lecturer) {
		this.lecturer = lecturer;
	}

	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public Double getCourseDuration() {
		return courseDuration;
	}

	public void setCourseDuration(Double courseDuration) {
		this.courseDuration = courseDuration;
	}

	public Date getCourseStartDate() {
		return courseStartDate;
	}

	public void setCourseStartDate(Date courseStartDate) {
		this.courseStartDate = courseStartDate;
	}

	public int getCourseSize() {
		return courseSize;
	}

	public void setCourseSize(int courseSize) {
		this.courseSize = courseSize;
	}

	public float getCourseCredit() {
		return courseCredit;
	}

	public void setCourseCredit(float courseCredit) {
		this.courseCredit = courseCredit;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CourseDTO [courseId=" + courseId + ", courseName=" + courseName + ", lecturer=" + lecturer
				+ ", courseDescription=" + courseDescription + ", courseType=" + courseType + ", courseDuration="
				+ courseDuration + ", courseStartDate=" + courseStartDate + ", courseSize=" + courseSize
				+ ", courseCredit=" + courseCredit + ", createdDate=" + createdDate + "]";
	}

}
