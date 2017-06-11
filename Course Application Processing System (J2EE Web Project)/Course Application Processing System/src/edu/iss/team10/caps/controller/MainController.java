package edu.iss.team10.caps.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.team10.caps.model.LecturerDTO;
import edu.iss.team10.caps.model.LoginDTO;
import edu.iss.team10.caps.model.StudentDTO;
import edu.iss.team10.caps.service.LecturerManager;
import edu.iss.team10.caps.service.LoginManager;
import edu.iss.team10.caps.service.StudentManager;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentManager studentManager = new StudentManager();
	private LecturerManager lecturerManager = new LecturerManager();
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logOut(request, response);
		request.setAttribute("logInError", "");
		RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void authenticateUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		LoginDTO user = null;
		String path = "";
		if (session != null) {
			user = (LoginDTO) session.getAttribute("user");
		}
		if (user == null) {
			String userId = request.getParameter("id");
			String password = request.getParameter("password");
			LoginManager loginManager = new LoginManager();
			user = loginManager.findUser(userId, password);
		}
		if (user != null) {
			if(user.getRole().equals("student")){
				StudentDTO student = studentManager.findStudent(user.getUserId());
				session.setAttribute("userName", student.getStudentName());
			}else if(user.getRole().equals("lecturer")){
				LecturerDTO lecturer = lecturerManager.findLecturer(user.getUserId());
				session.setAttribute("userName", lecturer.getLecturerName());
			}else {
				session.setAttribute("userName", "Admin");
			}
			session.setAttribute("user", user);
			switch (user.getRole()) {
			case "admin":
				path = "/adminHome";
				break;

			case "lecturer":
				path = "/lecturerHome";
				break;
			default:
				path = "/studentHome";
				break;
			}
		} else {
			request.setAttribute("logInError", "Oops! Please Try Again!");
			path = "/login.jsp";
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
		authenticateUser(request, response);
	}

	private void logOut(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
	}
}
