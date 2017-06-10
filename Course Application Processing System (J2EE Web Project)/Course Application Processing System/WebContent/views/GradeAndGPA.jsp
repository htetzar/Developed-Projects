<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.Student.Manage.GradeAndGPA" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.Student.Manage.GradeAndGPA" />
			</h3>
		</div>
		<div class="panel-body">
		<table class="table table-bordered table-striped">
				<tr class="info">
				<th class="text-center"><fmt:message key="label.table.No" /></th>
				<th class="text-center"><fmt:message
							key="label.course.table.title.courseid" /></th>
					<th class="text-center"><fmt:message
							key="label.course.table.title.coursename" /></th>
					<th class="text-center"><fmt:message
							key="label.course.tabel.title.coursecredit" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.table.title.grade" /></th>
				</tr>
				<c:forEach var="enrollment" items="${courseList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${enrollment.courseDTO.courseId}</td>
						<td class="nowrap">${enrollment.courseDTO.courseName}</td>
						<td class="nowrap">${enrollment.courseDTO.courseCredit}</td>
						<td class="nowrap">${enrollment.grade}</td>
						</c:forEach>
				</table>
				<c:if test="${not empty courseList}">
				
				<div class="form-group text-left">
			    	  	    <label for="studentName" style="font-size: 14pt;"><fmt:message key="label.student.table.title.GPA" /></label>
			    	  	   
			    		    <label  name="id" type="text" class="label label-danger" style="font-size: 14pt;">${GPAStr}</label>
			    </div>
				</c:if>
				</div>
				</div>
		
</body>
</html>
