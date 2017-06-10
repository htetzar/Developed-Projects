package edu.iss.team10.caps.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

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
import edu.iss.team10.caps.service.CourseManager;
import edu.iss.team10.caps.service.LecturerManager;

/**
 * Servlet implementation class LecturerHome
 */
@WebServlet({ "/lecturerHome", "/gradeStudent", "/giveGrade", "/gradeSudent_Save", "/studentPerformance",
		"/individualStudentPerformance", "/viewEnrolledStudents" })
public class LecturerHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseManager courseManager = new CourseManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LecturerHome() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	private void doGetStudentsToGrade(HttpServletRequest request, HttpServletResponse response) {
		String courseId = (String) request.getParameter("courseId");
		LecturerManager lecturerCourseManager = new LecturerManager();
		ArrayList<EnrollmentDTO> studentList = lecturerCourseManager.gradeStudent(courseId);
		request.setAttribute("gradeStudentList", studentList);

		if (studentList.size() > 0) {
			request.setAttribute("C_Name", studentList.get(0).getCourseDTO().getCourseName());
			request.setAttribute("C_Credit", studentList.get(0).getCourseDTO().getCourseCredit());
		}
		RequestDispatcher rd = request.getRequestDispatcher("views/GradeACourse.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doGetStudentToGrade(HttpServletRequest request, HttpServletResponse response) {
		String studentId = (String) request.getParameter("studentId");
		String studentName = (String) request.getParameter("studentName");
		String courseName = (String) request.getSession().getAttribute("courseName");
		RequestDispatcher rd = request.getRequestDispatcher("views/GiveAStudent.jsp");
		request.getSession().setAttribute("studentId", studentId);
		request.getSession().setAttribute("studentName", studentName);
		request.getSession().setAttribute("courseName", courseName);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doGetCoursesTaught(HttpServletRequest request, HttpServletResponse response) {
		LecturerManager lecturerCourseManager = new LecturerManager();
		HttpSession session = request.getSession(false);
		LoginDTO user = (LoginDTO) session.getAttribute("user");
		String lecturerId = user.getUserId();
		ArrayList<CourseDTO> lecturerCourseList = lecturerCourseManager.findCoursesByLecturer(lecturerId);
		request.setAttribute("lecturerCourseList", lecturerCourseList);
		RequestDispatcher rd = request.getRequestDispatcher("views/ViewCourseTaught.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("LecturerHome Servlet: URL : " + path);

		switch (path) {
		case "/lecturerHome":
			doGetCoursesTaught(request, response);
			break;
		case "/gradeStudent":
			doGetStudentsToGrade(request, response);
			break;
		case "/giveGrade":
			doGetStudentToGrade(request, response);
			break;
		case "/gradeSudent_Save":
			doPostStudentGrade_Save(request, response);
			break;
		case "/studentPerformance":
			viewStudentPerformance(request, response);
			break;
		case "/individualStudentPerformance":
			doGetGPAList(request, response);
			break;
		case "/viewEnrolledStudents":
			viewEnrolledStudents(request, response);
			break;
		default:
			break;
		}
	}

	private void viewEnrolledStudents(HttpServletRequest request, HttpServletResponse response) {
		String courseId = (String) request.getParameter("courseId");
		LecturerManager lecturerCourseManager = new LecturerManager();
		ArrayList<EnrollmentDTO> enrolledStudentList = lecturerCourseManager.viewEnrolledStudents(courseId);
		request.setAttribute("enrolledStudentList", enrolledStudentList);
		String courseName = enrolledStudentList.get(0).getCourseDTO().getCourseName();
		if (enrolledStudentList.size() > 0) {
			request.setAttribute("C_Name", enrolledStudentList.get(0).getCourseDTO().getCourseName());
		}
		RequestDispatcher rd = request.getRequestDispatcher("views/ViewCourseEnrollment.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void viewStudentPerformance(HttpServletRequest request, HttpServletResponse response) {
		String courseId = (String) request.getParameter("courseId");
		LecturerManager lecturerCourseManager = new LecturerManager();
		ArrayList<EnrollmentDTO> studentPerformanceList = lecturerCourseManager.viewStudentPerformance(courseId);
		request.setAttribute("studentPerformanceList", studentPerformanceList);
		RequestDispatcher rd = request.getRequestDispatcher("views/ViewStudentPerformance.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doPostStudentGrade_Save(HttpServletRequest request, HttpServletResponse response) {
		String studentId = (String) request.getSession().getAttribute("studentId");
		String courseName = (String) request.getSession().getAttribute("courseName");
		Float grade = Float.parseFloat(request.getParameter("grade"));
		LecturerManager lecturerCourseManager = new LecturerManager();
		String courseId = lecturerCourseManager.saveStudentGrade(studentId, courseName, grade);
		RequestDispatcher rd = request.getRequestDispatcher("/gradeStudent?courseId=" + courseId);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doGetGPAList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		double GPA = 0.0;
		double totalGrade = 0.0;
		String GPAStr = null;
		String userId = (String) request.getParameter("userId");
		ArrayList<EnrollmentDTO> courseList = courseManager.listByStudentID(userId);
		for (EnrollmentDTO c : courseList) {
			GPA += (c.getCourseDTO().getCourseCredit() * c.getGrade());
			totalGrade += c.getCourseDTO().getCourseCredit();
		}
		double GPAValue = GPA / totalGrade;
		GPAStr = new DecimalFormat("##.##").format(GPAValue);
		request.setAttribute("GPAStr", GPAStr);
		request.setAttribute("courseList", courseList);
		String path = "views/GradeAndGPA.jsp";
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
