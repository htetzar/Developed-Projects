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
<title>ViewCourseTaught</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.viewCourseTaughtJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th class="text-center"><fmt:message key="label.table.No" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseId" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseName" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseSize" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseStartDate" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseDuration" /></th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>
				<c:forEach var="course" items="${lecturerCourseList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${course.courseId}</td>
						<td class="nowrap">${course.courseName}</td>
						<td class="nowrap">${course.courseSize}</td>
						<td class="nowrap">${course.courseStartDate}</td>
						<td class="nowrap">${course.courseDuration}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="/gradeStudent">
								<c:param name="courseId" value="${course.courseId}" />
							</c:url> <a href="${updurl}" class="btn btn-primary" title="<fmt:message
									key="label.viewCourseTaught.table.title.grade"/>"><span class="glyphicon glyphicon-pencil"></span></a>
							<c:url var="updurl" scope="page"
								value="/studentPerformance">
								<c:param name="courseId" value="${course.courseId}" />
								<c:param name="courseName" value="${course.courseName}" />
							</c:url> <a href="${updurl}" class="btn btn-warning" title="<fmt:message key="label.viewCourseTaught.table.title.Performance"></fmt:message>"><span class="glyphicon glyphicon-star-empty"></span></a>
							<c:url var="updurl" scope="page"
								value="/viewEnrolledStudents">
								<c:param name="courseId" value="${course.courseId}" />
							</c:url> <a href="${updurl}" class="btn btn-success" title="<fmt:message
									key="label.viewCourseTaught.table.title.ViewEnrolledStudent"></fmt:message>">
									<span class="glyphicon glyphicon-eye-open"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>