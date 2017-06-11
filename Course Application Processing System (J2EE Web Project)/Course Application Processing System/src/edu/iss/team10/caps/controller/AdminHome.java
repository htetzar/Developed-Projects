package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iss.team10.caps.dao.mysql.CourseDAOImpl;
import edu.iss.team10.caps.dao.mysql.EnrollmentDAOImpl;
import edu.iss.team10.caps.dao.mysql.LecturerDAOImpl;
import edu.iss.team10.caps.dao.mysql.StudentDAOImpl;
import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.EnrollmentListManager;
import edu.iss.team10.caps.service.LecturerManager;
import edu.iss.team10.caps.service.LoginManager;
import edu.iss.team10.caps.service.StudentManager;
import edu.iss.team10.caps.util.Email;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet({ "/adminHome", "/studentInsert", "/studentEdit", "/studentDelete", "/studentSearch",
		"/lecturerList", "/lecturerInsert",	"/lecturerEdit", "/lecturerDelete", "/lecturerSearch",
		"/courseList", "/courseInsert", "/courseEdit", "/courseDelete", "/courseSearch", "/prepareForNewCourse",
		"/prepareForEditCourse", "/adminEnrollment", "/deleteEnrollment", "/searchEnroll" })
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentManager studentManager = new StudentManager();
	LecturerManager lecturerManager = new LecturerManager();
	CourseManager courseManager = new CourseManager();
	LoginManager loginManager = new LoginManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminHome() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("AdminHome Servlet: URL : " + path);

		switch (path) {
		case "/studentInsert":
			doInsertStudent(request, response);
			break;
		case "/studentEdit":
			doEditStudent(request, response);
			break;
		case "/studentDelete":
			doDeleteStudent(request, response);
			break;
		case "/adminHome":
			doGetStudentLsit(request, response);
			break;
		case "/studentSearch":
			doSearchStudent(request, response);
			break;
		case "/lecturerInsert":
			doInsertLecturer(request, response);
			break;
		case "/lecturerEdit":
			doEditLecturer(request, response);
			break;
		case "/lecturerDelete":
			doDeleteLecturer(request, response);
			break;
		case "/lecturerList":
			doGetLecturerLsit(request, response);
			break;
		case "/lecturerSearch":
			doSearchLecturer(request, response);
			break;
		case "/prepareForNewCourse":
			doPrepareForNewCourse(request, response);
			break;
		case "/courseInsert":
			doInsertCourse(request, response);
			break;
		case "/courseEdit":
			doEditCourse(request, response);
			break;
		case "/courseDelete":
			doDeleteCourse(request, response);
			break;
		case "/courseList":
			doGetCourseLsit(request, response);
			break;
		case "/courseSearch":
			doSearchCourse(request, response);
			break;
		case "/prepareForEditCourse":
			doPrepareForEditCourse(request, response);
			break;
		case "/adminEnrollment":
			doGetEnrollmentList(request, response);
			break;
		case "/deleteEnrollment":
			doDeleteEnrollment(request, response);
			break;
		case "/searchEnroll":
			doSearchEnrollment(request, response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Student Method

	private void doGetStudentLsit(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		ArrayList<StudentDTO> studentList = studentManager.findAllStudent((page - 1) * recordsPerPage, recordsPerPage);
		int noOfPages = (int) Math.ceil(StudentDAOImpl.noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("studentList", studentList);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		RequestDispatcher rd = request.getRequestDispatcher("views/Student_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doInsertStudent(HttpServletRequest request, HttpServletResponse response) {
		int totalStudentCount = studentManager.getTotalStudentCount();
		String studentId = "";
		if (totalStudentCount == 0) {
			studentId = "s001";
		} else {
			String lastStudentId = studentManager.getLastStudent();
			String lastNoString = lastStudentId.substring(1);
			int lastNo = Integer.parseInt(lastNoString) + 1;
			if (lastNo <= 9) {
				studentId = "s00" + lastNo;
			} else {
				studentId = "s0" + lastNo;
			}
		}
		String studentName = (String) request.getParameter("studentName");
		String studentEmail = (String) request.getParameter("studentEmail");
		String studentPhoneNumber = (String) request.getParameter("studentPhoneNumber");
		String studentAddress = (String) request.getParameter("studentAddress");
		Date enrollmentDate = new Date();
		StudentDTO studentDTO = new StudentDTO(studentId, studentName, studentEmail, studentPhoneNumber, studentAddress,
				enrollmentDate);
		int insertStudent = studentManager.insertStudent(studentDTO);
		int insertUser = loginManager.insertUser(studentId, studentId, "student");
		if (insertStudent > 0 & insertUser > 0) {
			System.out.println("Insert Success");
		} else {
			System.out.println("Insert Fail");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/main");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String studentId = (String) request.getParameter("studentId");
		String studentName = (String) request.getParameter("studentName");
		String studentEmail = (String) request.getParameter("studentEmail");
		String studentPhoneNumber = (String) request.getParameter("studentPhoneNumber");
		String studentAddress = (String) request.getParameter("studentAddress");
		Date enrollmentDate = new Date();
		StudentDTO studentDTO = new StudentDTO(studentId, studentName, studentEmail, studentPhoneNumber, studentAddress,
				enrollmentDate);
		int update = studentManager.updateStudent(studentDTO);
		if (update > 0) {
			System.out.println("Update Success");
		} else {
			System.out.println("Fail Update Student");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/main");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doDeleteStudent(HttpServletRequest request, HttpServletResponse response) {
		String studentId = request.getParameter("studentId");
		StudentDTO student = new StudentDTO();
		student.setStudentId(studentId);
		int deleteStudent  = studentManager.deletestudent(student);
		int deleteUser = loginManager.deleteUser(studentId);
		if (deleteStudent > 0 & deleteUser > 0) {
			System.out.println("Delete Success");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/adminHome");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doSearchStudent(HttpServletRequest request, HttpServletResponse response) {
		String Id = (String) request.getParameter("studentId");
		System.out.println(Id);
		StudentDTO student = studentManager.findStudent(Id);
		String path = "";
		if (student.getStudentId() == null && student.getStudentId()!= Id) {
			path = "adminHome";
			request.setAttribute("errorMessage", "There is no record for this student ID");
		} else {
			request.setAttribute("studentId", student.getStudentId());
			request.setAttribute("studentName", student.getStudentName());
			request.setAttribute("studentEmail", student.getStudentEmail());
			request.setAttribute("studentAddress", student.getStudentAddress());
			request.setAttribute("studentPhoneNumber", student.getStudentPhoneNumber());
			request.setAttribute("enrollmentDate", student.getEnrollmentDate());
			path = "views/Student_Detail.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Lecturer Methods
	private void doGetLecturerLsit(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		ArrayList<LecturerDTO> lecturerList = lecturerManager.findAllLecturer((page - 1) * recordsPerPage,
				recordsPerPage);
		int noOfPages = (int) Math.ceil(LecturerDAOImpl.noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("lecturerList", lecturerList);
		request.setAttribute("lecturerList", lecturerList);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		RequestDispatcher rd = request.getRequestDispatcher("views/Lecturer_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditLecturer(HttpServletRequest request, HttpServletResponse response) {
		String lecturerId = (String) request.getParameter("lecturerId");
		String lecturerName = (String) request.getParameter("lecturerName");
		String lecturerEmail = (String) request.getParameter("lecturerEmail");
		String lecturerPhoneNumber = (String) request.getParameter("lecturerPhoneNumber");
		String lecturerAddress = (String) request.getParameter("lecturerAddress");
		Date joiningDate = new Date();
		LecturerDTO lecturerDTO = new LecturerDTO(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber,
				lecturerAddress, joiningDate);
		int update = lecturerManager.updateLecturer(lecturerDTO);
		if (update > 0) {
			System.out.println("Update Lecturer Success");
		} else {
			System.out.println("Fail Update Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/lecturerList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doInsertLecturer(HttpServletRequest request, HttpServletResponse response) {
		int totallecturercount = lecturerManager.getTotalLecturerCount();
		String lecturerId = null;
		if (totallecturercount == 0) {
			lecturerId = "l001";
		} else {
			String lastCourseId = lecturerManager.getLastLecturer();
			String lastNoString = lastCourseId.substring(1);
			int lastNo = Integer.parseInt(lastNoString) + 1;
			if (lastNo <= 9) {
				lecturerId = "l00" + lastNo;
			} else {
				lecturerId = "l0" + lastNo;
			}
		}
		String lecturerName = request.getParameter("lecturerName");
		String lecturerEmail = request.getParameter("lecturerEmail");
		String lecturerAddress = request.getParameter("lecturerAddress");
		String lecturerPhoneNumber = request.getParameter("lecturerPhoneNumber");
		Date joiningDate = new Date();
		LecturerDTO lecturer = new LecturerDTO(lecturerId, lecturerName, lecturerEmail, lecturerPhoneNumber,
				lecturerAddress, joiningDate);
		int insertLecturer = lecturerManager.insertLecturer(lecturer);
		int insertUser = loginManager.insertUser(lecturerId, lecturerId, "lecturer");
		if (insertLecturer > 0 & insertUser > 0) {
			System.out.println("Insert Lecturer successfully!");
		} else {
			System.out.println("Fail Insert Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/lecturerList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int doDeleteLecturer(HttpServletRequest request, HttpServletResponse response) {
		int del = 0;
		String lecturerId = request.getParameter("lecturerId");
		LecturerDTO lecturer = new LecturerDTO();
		lecturer.setLecturerId(lecturerId);
		del = lecturerManager.deletelecturer(lecturer);
		int deleteUser = loginManager.deleteUser(lecturerId);
		if (del > 0 & deleteUser > 0) {
			System.out.println("Delete Success");
		}else {
			System.out.println("Fail Delete Lecturer");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/lecturerList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return del;
	}

	public void doSearchLecturer(HttpServletRequest request, HttpServletResponse response) {
		String Id = (String) request.getParameter("lecturerId");
		System.out.println(Id);
		LecturerDTO lecturer = lecturerManager.findLecturer(Id);
		String path="";
		if(lecturer.getLecturerId() ==null && Id!=lecturer.getLecturerId())
		{
			path="lecturerList";
			request.setAttribute("errorLecturer", "There is no record for this LecturerId");
		}else{
		request.setAttribute("lecturerId", lecturer.getLecturerId());
		request.setAttribute("lecturerName", lecturer.getLecturerName());
		request.setAttribute("lecturerEmail", lecturer.getLecturerEmail());
		request.setAttribute("lecturerAddress", lecturer.getLecturerAddress());
		request.setAttribute("lecturerPhoneNumber", lecturer.getLecturerPhoneNumber());
		path="views/Lecturer_Detail.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Course Method
	private void doGetCourseLsit(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		ArrayList<CourseDTO> courseList = courseManager.findAllCourse((page - 1) * recordsPerPage, recordsPerPage);
		int noOfPages = (int) Math.ceil(CourseDAOImpl.noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("courseList", courseList);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		RequestDispatcher rd = request.getRequestDispatcher("views/Course_List.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doPrepareForNewCourse(HttpServletRequest request, HttpServletResponse response) {		
		ArrayList<LecturerDTO> lecturerList = lecturerManager.findAllLecturer();
		System.out.println("doPrepareForNewCourse " + lecturerList.size());
		if(lecturerList.size() > 0){
			request.setAttribute("lecturerList", lecturerList);
		}
		RequestDispatcher rd = request.getRequestDispatcher("views/Course_New.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void doPrepareForEditCourse(HttpServletRequest request, HttpServletResponse response) {
		String Id = (String) request.getParameter("courseId");
		System.out.println(Id);
		CourseDTO course = courseManager.findCourse(Id);
		String path="";
		if(course.getCourseId()==null && course.getCourseId() !=Id)
		{
			path="courseList";
			request.setAttribute("errorCourse", "There is no record for this CourseId");
		}else{
		request.setAttribute("courseId", course.getCourseId());
		request.setAttribute("courseName", course.getCourseName());
		request.setAttribute("courseDescription", course.getCourseDescription());
		request.setAttribute("courseType", course.getCourseType());
		request.setAttribute("courseDuration", course.getCourseDuration());
		request.setAttribute("courseStartDate", course.getCourseStartDate());
		request.setAttribute("courseSize", course.getCourseSize());
		ArrayList<LecturerDTO> lecturerList = lecturerManager.findAllLecturer();
		System.out.println("doPrepareForUpdateCourse " + lecturerList.size());
		if(lecturerList.size() > 0){
			request.setAttribute("lecturerList", lecturerList);
		}
		request.setAttribute("courseCredit", course.getCourseCredit());
		path="views/Course_Edit.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void doInsertCourse(HttpServletRequest request, HttpServletResponse response) {
		int totalCourseCount = courseManager.getTotalCourseCount();
		String courseId = "";
		if (totalCourseCount == 0) {
			courseId = "c001";
		} else {
			String lastCourseId = courseManager.getLastCourse();
			String lastNoString = lastCourseId.substring(1);
			int lastNo = Integer.parseInt(lastNoString) + 1;
			if (lastNo <= 9) {
				courseId = "c00" + lastNo;
			} else {
				courseId = "c0" + lastNo;
			}
		}
		String courseName = (String) request.getParameter("courseName");
		String lecturerId = (String) request.getParameter("lecturerId");
		LecturerDTO lecturer = lecturerManager.findLecturer(lecturerId);
		String courseDescription = (String) request.getParameter("courseDescription");
		String courseType = (String) request.getParameter("courseType");
		Double courseDuration = Double.parseDouble(request.getParameter("courseDuration"));
		String courseStartDateString = (String) request.getParameter("courseStartDate");
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		Date courseStartDate = null;
		try {
			courseStartDate = format.parse(courseStartDateString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int courseSize = Integer.parseInt(request.getParameter("courseSize"));
		float courseCredit = Float.parseFloat(request.getParameter("courseCredit"));
		Date createdDate = new Date();
		CourseDTO courseDTO = new CourseDTO(courseId, courseName, lecturer, courseDescription, courseType,
				courseDuration, courseStartDate, courseSize, courseCredit, createdDate);
		int insert = courseManager.insertCourse(courseDTO);
		if (insert > 0) {
			System.out.println("Insert Course Success");
		} else {
			System.out.println("Fail Course Insert");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditCourse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String courseId = (String) request.getParameter("courseId");
		String courseName = (String) request.getParameter("courseName");
		String lecturerId = (String) request.getParameter("lecturerId");
		LecturerDTO lecturer = lecturerManager.findLecturer(lecturerId);
		String courseDescription = (String) request.getParameter("courseDescription");
		String courseType = (String) request.getParameter("courseType");
		Double courseDuration = Double.parseDouble(request.getParameter("courseDuration"));
		String courseStartDateString = (String) request.getParameter("courseStartDate");
		DateFormat format = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);
		Date courseStartDate = null;
		try {
			courseStartDate = format.parse(courseStartDateString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int courseSize = Integer.parseInt(request.getParameter("courseSize"));
		float courseCredit = Float.parseFloat(request.getParameter("courseCredit"));
		Date createdDate = new Date();
		CourseDTO courseDTO = new CourseDTO(courseId, courseName, lecturer, courseDescription, courseType,
				courseDuration, courseStartDate, courseSize, courseCredit, createdDate);
		int update = courseManager.updateCourse(courseDTO);
		if (update > 0) {
			System.out.println("Update Course Success");
		} else {
			System.out.println("Fail Course Update");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doDeleteCourse(HttpServletRequest request, HttpServletResponse response) {
		String courseId = request.getParameter("courseId");
		CourseDTO course = new CourseDTO();
		course.setCourseId(courseId);
		int delete = courseManager.deletecourse(course);
		if (delete > 0) {
			System.out.println("Delete Course Success");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/courseList");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doSearchCourse(HttpServletRequest request, HttpServletResponse response) {
		String Id = (String) request.getParameter("courseId");
		System.out.println(Id);
		CourseDTO course = courseManager.findCourse(Id);
		String path="";
		if(course.getCourseId()==null && course.getCourseId() !=Id)
		{
			path="courseList";
			request.setAttribute("errorCourse", "There is no record for this CourseId");
		}else{
		request.setAttribute("courseId", course.getCourseId());
		request.setAttribute("courseName", course.getCourseName());
		request.setAttribute("courseDescription", course.getCourseDescription());
		request.setAttribute("courseType", course.getCourseType());
		request.setAttribute("courseDuration", course.getCourseDuration());
		request.setAttribute("courseStartDate", course.getCourseStartDate());
		request.setAttribute("courseSize", course.getCourseSize());
		request.setAttribute("lecturerName", course.getLecturer().getLecturerName());
		request.setAttribute("courseCredit", course.getCourseCredit());
		path="views/Course_Detail.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	// Enrollment

	private void doGetEnrollmentList(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		ArrayList<EnrollmentDTO> enrollmentList = enrollmentListManager.loadAllEnrollment((page - 1) * recordsPerPage,
				recordsPerPage);
		int noOfPages = (int) Math.ceil(EnrollmentDAOImpl.noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("enrollmentList", enrollmentList);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		request.setAttribute("TOTAL_RECORDS", EnrollmentDAOImpl.noOfRecords);
		RequestDispatcher rd = request.getRequestDispatcher("views/Admin_Enrollment.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doDeleteEnrollment(HttpServletRequest request, HttpServletResponse response) {
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		StudentDTO student = new StudentManager().findStudent(request.getParameter("studentID"));
		CourseDTO course = new CourseManager().findCourse(request.getParameter("courseID"));
		enrollmentListManager.deleteEnrollment(student, course);
		try {
			Email.generateAndSendEmail(student, course, "ADMIN_CANCEL_ENROLLMENT", "admin");
		} catch (MessagingException | IOException e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/adminEnrollment");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	private void doSearchEnrollment(HttpServletRequest request, HttpServletResponse response) {
		String path="";
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		ArrayList<EnrollmentDTO> enrollmentList = enrollmentListManager.loadStudentEnrollmentSearch(request.getParameter("studentId"), (page - 1) * recordsPerPage, recordsPerPage);		
		if(enrollmentList.size() >0)
		{
			int noOfPages = (int) Math.ceil(CourseDAOImpl.noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("enrollmentList", enrollmentList);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			request.setAttribute("TOTAL_RECORDS", EnrollmentDAOImpl.noOfRecords);
			path="views/Admin_Enrollment.jsp";
		}else
		{
			request.setAttribute("enrorEnroll", "There is no record for this ID");
			path="/adminEnrollment";
		}		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
