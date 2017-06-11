<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title>ViewCourseEnrollment</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.viewCourseEnrollmentJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<label for="courseName"><font style="font-size: 14pt"><fmt:message
						key="label.course.table.title.coursename" /></font>
						<font style="color: red; font-size: 13pt">${C_Name}</font></label>
			</div>
			<table class="table table-bordered table-striped">
				<tr class="info">
					<th class="text-center"><fmt:message key="label.table.No" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentId" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentName" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentEmail" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.enrollmentDate" /></th>
				</tr>
				<c:forEach var="studentList" items="${enrolledStudentList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${studentList.studentDTO.studentId}</td>
						<td class="nowrap">${studentList.studentDTO.studentName}</td>
						<td class="nowrap">${studentList.studentDTO.studentEmail}</td>
						<td class="nowrap">${studentList.courseEnrollmentDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>