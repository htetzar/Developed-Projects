package edu.iss.team10.caps.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LoginDTO implements Serializable{
	String userId;
	String password;
	String role;
	boolean valid;
	public LoginDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDTO(String userId, String password, String role) {
		super();
		this.userId = userId;
		this.password = password;
		this.role = role;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoginDTO other = (LoginDTO) obj;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", password=" + password + ", role=" + role + "]";
	}
	public boolean isValid() {
		// TODO Auto-generated method stub
		return valid;
	}
    public void setValid(boolean newValid) {
        valid = newValid;
	}	
	
}
