<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title>GradeACourse</title>
</head>
<body>
	<c:set var="courseName" scope="session" value="${C_Name}" />
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.GradeACourseJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<label for="courseName"><font style="font-size: 14pt"><fmt:message
						key="label.course.table.title.coursename" />
						</font><font style="color: red; font-size: 13pt">${C_Name}</font></label>
				<label
					for="courseCredit"><font style="font-size: 14pt"><fmt:message
						key="label.course.tabel.title.coursecredit" /></font>
						<font style="color: red; font-size: 13pt">${C_Credit}</font></label>
			</div>
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th class="text-center"><fmt:message key="label.table.No" /></th>
					<th class="text-center"><fmt:message key="label.student.table.title.studentId" /></th>
					<th class="text-center"><fmt:message key="label.student.table.title.studentName" /></th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>
				<c:forEach var="gradeStudent" items="${gradeStudentList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${gradeStudent.getStudentDTO().studentId}</td>
						<td class="nowrap">${gradeStudent.getStudentDTO().studentName}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="/giveGrade">
								<c:param name="studentId"
									value="${gradeStudent.studentDTO.studentId}" />
								<c:param name="studentName"
									value="${gradeStudent.studentDTO.studentName}" />
								<c:param name="courseName"
									value="${gradeStudent.courseDTO.courseName}" />
							</c:url> <a href="${updurl}" class="btn btn-primary" title="GRADE"><span class="glyphicon glyphicon-pencil"></span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>