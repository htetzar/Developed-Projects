<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<fmt:setBundle basename="messages" />
<style type="text/css">
table th {
	align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ViewStudentPerformance</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.viewStudentPerformanceJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th class="text-center">No.</th>
					<th class="text-center">Student ID</th>
					<th class="text-center">Student Name</th>
					<th class="text-center">Course Name</th>
					<th class="text-center">Grade</th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>
				<c:forEach var="list" items="${studentPerformanceList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${list.studentDTO.studentId}</td>
						<td class="nowrap">${list.studentDTO.studentName}</td>
						<td class="nowrap">${list.courseDTO.courseName}</td>
						<td class="nowrap">${list.grade}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="/individualStudentPerformance">
								<c:param name="userId" value="${list.studentDTO.studentId}" />
							</c:url> <a href="${updurl}" class="btn btn-primary" title="VIEW"><span class="glyphicon glyphicon-eye-open"></span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>