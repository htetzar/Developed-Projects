package edu.iss.team10.caps.exception;

public class MyDataException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MyDataException() {
	}

	public MyDataException(String s) {
		super(s);
	}

	public MyDataException(Exception e) {
		super(e);
	}
}
