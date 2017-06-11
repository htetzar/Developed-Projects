package edu.iss.team10.caps.model;

import java.io.Serializable;

public class CourseSearchDTO implements Serializable{

	private static final long serialVersionUID = 1L;

	String courseId;

	String courseName;

	public CourseSearchDTO() {
		super();
	}

	public CourseSearchDTO(String courseId, String courseName) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
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

	@Override
	public String toString() {
		return "CourseSearchDTO [courseId=" + courseId + ", courseName=" + courseName + "]";
	}
	
}
