package edu.iss.team10.caps.model;

import java.io.Serializable;
import java.util.Date;

public class LecturerDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	String lecturerId;

	String lecturerName;

	String lecturerEmail;

	String lecturerPhoneNumber;

	String lecturerAddress;

	Date joiningDate;

	public LecturerDTO() {
		super();
	}

	public LecturerDTO(String lecturerId, String lecturerName, String lecturerEmail, String lecturerPhoneNumber,
			String lecturerAddress, Date joiningDate) {
		super();
		this.lecturerId = lecturerId;
		this.lecturerName = lecturerName;
		this.lecturerEmail = lecturerEmail;
		this.lecturerPhoneNumber = lecturerPhoneNumber;
		this.lecturerAddress = lecturerAddress;
		this.joiningDate = joiningDate;
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

	public String getLecturerEmail() {
		return lecturerEmail;
	}

	public void setLecturerEmail(String lecturerEmail) {
		this.lecturerEmail = lecturerEmail;
	}

	public String getLecturerPhoneNumber() {
		return lecturerPhoneNumber;
	}

	public void setLecturerPhoneNumber(String lecturerPhoneNumber) {
		this.lecturerPhoneNumber = lecturerPhoneNumber;
	}

	public String getLecturerAddress() {
		return lecturerAddress;
	}

	public void setLecturerAddress(String lecturerAddress) {
		this.lecturerAddress = lecturerAddress;
	}

	public Date getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LecturerDTO [lecturerId=" + lecturerId + ", lecturerName=" + lecturerName + ", lecturerEmail="
				+ lecturerEmail + ", lecturerPhoneNumber=" + lecturerPhoneNumber + ", lecturerAddress="
				+ lecturerAddress + ", joiningDate=" + joiningDate + "]";
	}	
}
