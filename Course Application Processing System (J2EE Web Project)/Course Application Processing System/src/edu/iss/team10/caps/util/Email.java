package edu.iss.team10.caps.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import edu.iss.team10.caps.model.CourseDTO;
import edu.iss.team10.caps.model.StudentDTO;

public class Email {

	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;

	public static void generateAndSendEmail(StudentDTO student, CourseDTO course, String status, String role)
			throws AddressException, MessagingException, IOException {

		System.out.println("Start");

		Properties prop = new Properties();
		InputStream input = null;

		String filename = "email.properties";
		input = Email.class.getClassLoader().getResourceAsStream(filename);
		if (input == null) {
			System.out.println("Sorry, unable to find " + filename);

		} else {
			prop.load(input);
		}
		// load a properties file from class path, inside static method

		final String username = prop.getProperty("user.email");
		final String password = prop.getProperty("user.password");

		Properties props = new Properties();
		props.put("mail.smtp.auth", prop.getProperty("mail.smtp.auth"));
		props.put("mail.smtp.host", prop.getProperty("mail.smtp.host"));
		props.put("mail.smtp.port", prop.getProperty("mail.smtp.port"));
		props.put("mail.transport.protocol", prop.getProperty("mail.transport.protocol"));
		props.put("mail.smtp.starttls.enable", prop.getProperty("mail.smtp.starttls.enable"));
		props.put("mail.smtp.starttls.enable", prop.getProperty("mail.smtp.starttls.enable"));
		props.put("mail.smtp.socketFactory.class", prop.getProperty("mail.smtp.socketFactory.class"));

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Transport transport = session.getTransport();
			Message message = new MimeMessage(session);

			if (role == "admin" & status == "CONFIRM_COURSE_ENROLLED") {
				message.setFrom(new InternetAddress(prop.getProperty("admin.email")));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(student.getStudentEmail()));
				message.setSubject(prop.getProperty("student.enrollCourse.subject") + " " + course.getCourseId() + " "
						+ course.getCourseName());
				message.setText(prop.getProperty("student.enrollCourse.body1") + "\n" + "Course ID : " + course.getCourseId() + "\n"
						+ "Course Name: " + course.getCourseName() + "\n" 
						+ "Course Start Date: " + course.getCourseStartDate() + "\n\n"
						+ "Sent From \n"
						+ prop.getProperty("admin.email")
						+ "\n\n\n"
						+ prop.getProperty("student.enrollCourse.disclaimer"));

				transport.connect();
				Transport.send(message, InternetAddress.parse(student.getStudentEmail()));
				System.out.println("Done");

			} else if (role == "admin" & status == "ADMIN_CANCEL_ENROLLMENT") {
				message.setFrom(new InternetAddress(prop.getProperty("admin.email")));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(student.getStudentEmail()));
				message.setSubject(prop.getProperty("admin.cancelEnrollment.subject1") + " " + course.getCourseId()
						+ " " + course.getCourseName());
				message.setText(prop.getProperty("admin.cancelEnrollment.body1") + "\n\n" 
						+ "Course ID: " + course.getCourseId() + "\n"
						+ "Course Name: " + course.getCourseName() + "\n" 
						+ "Course Start Date: " + course.getCourseStartDate() + "\n\n" 
						+ prop.getProperty("admin.cancelEnrollment.body2") + "\n\n"
						+ "Sent From \n"
						+ prop.getProperty("admin.email")
						+ "\n\n\n" + prop.getProperty("admin.cancelEnrollment.disclaimer"));
				transport.connect();
				Transport.send(message, InternetAddress.parse(student.getStudentEmail()));
				System.out.println("Done");
			} else if (role == "student" & status == "STUDENT_CANCEL_ENROLLMENT") {
				message.setFrom(new InternetAddress(student.getStudentEmail()));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(prop.getProperty("admin.email")));
				message.setSubject(prop.getProperty("student.cancelEnrollment.subject1") + " " + course.getCourseId()
						+ " " + course.getCourseName());
				message.setText(student.getStudentName() + " " + prop.getProperty("student.cancelEnrollment.body1") + "\n"
						+ "Course ID: " + course.getCourseId() + "\n"
						+ "Course Name: " + course.getCourseName() + "\n" 
						+ "Course Start Date: " + course.getCourseStartDate() + "\n\n"
						+ "Sent From \n"
						+ student.getStudentEmail());
				transport.connect();
				Transport.send(message, InternetAddress.parse(prop.getProperty("admin.email")));
				System.out.println("Done");
			}

		} catch (MessagingException e) {
			System.out.println("e=" + e);
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	/*public static void main(String[] args) {
		StudentDTO student = new StudentDTO();
		student.setStudentEmail("htetzar1@gmail.com");
		student.setStudentName("Htet Zar Chi Aung");

		CourseDTO course = new CourseDTO();
		course.setCourseId("c001");
		course.setCourseName("JAVA");
		course.setCourseStartDate(new Date());

		try {

			// generateAndSendEmail(student, course, "CONFIRM_COURSE_ENROLLED", "admin"); 
			// Message to student (student triggered information on successful course enrollment )
			
			// generateAndSendEmail(student, course, "ADMIN_CANCEL_ENROLLMENT", "admin"); 
			// Message to student (admin triggered cancellation of course enrollment)
			
			generateAndSendEmail(student, course, "STUDENT_CANCEL_ENROLLMENT", "student");
			// Message to admin (student triggered cancellation of course enrollment)
			
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
		}
	}*/

}
