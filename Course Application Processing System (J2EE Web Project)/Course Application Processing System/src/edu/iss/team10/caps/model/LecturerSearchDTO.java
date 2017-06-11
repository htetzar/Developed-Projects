package edu.iss.team10.caps.model;

public class LecturerSearchDTO {
	private static final long serialVersionUID = 1L;

	String lecturerId;

	String lecturerName;

	public LecturerSearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LecturerSearchDTO(String lecturerId, String lecturerName) {
		super();
		this.lecturerId = lecturerId;
		this.lecturerName = lecturerName;
	}

	public String getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(String lecturerId) {
		this.lecturerId = lecturerId;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LecturerSearchDTO [lecturerId=" + lecturerId + ", lecturerName=" + lecturerName + "]";
	}
	
}
