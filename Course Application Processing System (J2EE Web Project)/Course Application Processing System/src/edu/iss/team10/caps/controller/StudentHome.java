package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.EnrollmentDTO;
import edu.iss.team10.caps.model.LoginDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.EnrollmentListManager;
import edu.iss.team10.caps.service.StudentManager;
import edu.iss.team10.caps.util.Email;

/**
 * Servlet implementation class StudentHome
 */
@WebServlet({ "/studentHome", "/studentEnrollCourseList", "/EnrolledCourses", "/studentDeleteEnroll",
		"/studentEnrollCourseSave","/courseSearchByStudent" })
public class StudentHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseManager courseManager = new CourseManager();
	private StudentManager studentManger = new StudentManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentHome() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("StudentHome Servlet: URL : " + path);

		switch (path) {
		case "/studentHome":
			doGetGPAList(request, response);
			break;
		case "/studentEnrollCourseList":
			doGetStudentEnrollCourseList(request, response);
			break;
		case "/EnrolledCourses":
			doGetViewEnrolledCourses(request, response);
			break;
		case "/studentDeleteEnroll":
			doDeleteEnrolledCourses(request, response);
			break;
		case "/studentEnrollCourseSave":
			doGetStudentEnrollCourseSave(request, response);
			break;
		case "/courseSearchByStudent":
			doSearchCourse(request, response);
			break;
		default:
			break;
		}
	}

	private void doDeleteEnrolledCourses(HttpServletRequest request, HttpServletResponse response) {
		EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
		StudentDTO student = new StudentManager().findStudent(request.getParameter("studentID"));
		CourseDTO course = new CourseManager().findCourse(request.getParameter("courseID"));
		enrollmentListManager.deleteEnrollment(student, course);
		try {
			Email.generateAndSendEmail(student, course, "STUDENT_CANCEL_ENROLLMENT", "student");
		} catch (MessagingException | IOException e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/EnrolledCourses");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void doGetViewEnrolledCourses(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String path = "";
		LoginDTO user = null;
		int page=1;
		int recordsPerPage =10;
		if(request.getParameter("page")!=null)
			page = Integer.parseInt(request.getParameter("page"));
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user != null) {
			EnrollmentListManager enrollmentListManager = new EnrollmentListManager();
			ArrayList<EnrollmentDTO> enrolledCoursesList = enrollmentListManager
					.loadStudentEnrollment(user.getUserId(), (page-1),recordsPerPage);
			request.setAttribute("enrolledCoursesList", enrolledCoursesList);
			path = "views/EnrolledCourses.jsp";
		} else {
			request.setAttribute("logInError", "LogIn Error! Please Log In Again!");
			path = "views/login.jsp";
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

	private void doGetStudentEnrollCourseList(HttpServletRequest request, HttpServletResponse response) {
		LoginDTO user = null;
		String path = "";
		HttpSession session = request.getSession(false);
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user == null) {
			path = "login.jsp";
		} else {
			ArrayList<CourseDTO> courseList = courseManager.listByCourse(user.getUserId());
			request.setAttribute("courseList", courseList);
			path = "views/StudentEnrollCourse.jsp";
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void doGetGPAList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		double GPA=0.0;
		double totalGrade = 0.0;
		String GPAStr = null;
		HttpSession session = request.getSession(false);
		LoginDTO user = null;
		String path = "";
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user == null) {
			path = "login.jsp";
		} else {

			ArrayList<EnrollmentDTO> courseList = courseManager.listByStudentID(user.getUserId());
			for (EnrollmentDTO c : courseList) {
				GPA += (c.getCourseDTO().getCourseCredit() * c.getGrade());
				totalGrade += c.getCourseDTO().getCourseCredit();
			}
			double GPAValue = GPA / totalGrade;
			GPAStr =new DecimalFormat("##.##").format(GPAValue);
			request.setAttribute("GPAStr", GPAStr);
			request.setAttribute("courseList", courseList);
			path = "views/GradeAndGPA.jsp";
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

	private void doGetStudentEnrollCourseSave(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		LoginDTO user = null;
		String path = "";
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user == null) {
			path = "login.jsp";
		} else {
			String courseId = (String) request.getParameter("courseId");
			CourseDTO newCourse = courseManager.findCourse(courseId);
			StudentDTO newStudent = studentManger.findStudent(user.getUserId());
			EnrollmentDTO enrollmentDTO = new EnrollmentDTO(newCourse, newStudent, new Date(), 0.0f, true);
			int insert = courseManager.insertEnroll(enrollmentDTO);
			try {
				Email.generateAndSendEmail(newStudent, newCourse, "CONFIRM_COURSE_ENROLLED", "admin");
			} catch (MessagingException | IOException e) {
				e.printStackTrace();
			} 
			if (insert > 0) {
				System.out.println("Success Insert enrollment");
			} else {
				System.out.println("Fail Insert enrollment");
			}
			path = "/studentEnrollCourseList";
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
	
	private void doSearchCourse(HttpServletRequest request, HttpServletResponse response) {
		String Id=(String) request.getParameter("courseId");
		System.out.println(Id);
		CourseDTO course=courseManager.findCourse(Id);	
		request.setAttribute("courseId", course.getCourseId());
		request.setAttribute("courseName", course.getCourseName());
		request.setAttribute("courseDescription", course.getCourseDescription());
		request.setAttribute("courseType",course.getCourseType());
		request.setAttribute("courseDuration", course.getCourseDuration());
		request.setAttribute("courseStartDate", course.getCourseStartDate());
		request.setAttribute("courseSize",course.getCourseSize());
		request.setAttribute("lecturerName", course.getLecturer().getLecturerName());
		request.setAttribute("courseCredit",course.getCourseCredit());
		RequestDispatcher rd=request.getRequestDispatcher("views/Course_Detail.jsp");
		  try{
	        	rd.forward(request, response);
	        }catch(ServletException e){
	        	e.printStackTrace();
	        }catch(IOException e){
	        	e.printStackTrace();
	        }
	}
}
