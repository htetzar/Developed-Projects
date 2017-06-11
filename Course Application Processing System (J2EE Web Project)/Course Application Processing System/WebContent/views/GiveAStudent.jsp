<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title>GradeAStudent</title>
</head>
<body>
	<br />
	<c:set var="courseName" scope="session" value="${courseName}" />
	<div class="container">
				<div class="panel panel-default">
				<div class="panel-heading">
					<h3>
						<fmt:message key="label.gradeAStudentJsp.title" />
					</h3>
					</div>
					<div class="panel-body"><div class="col-md-4">
						<form action="${pageContext.request.contextPath}/gradeSudent_Save"
							method="post" "UTF-8" role="form">
							<fieldset>
								<div class="form-group">
									<label for="studentName"><fmt:message
											key="label.student.table.title.studentName" /></label> <input
										class="form-control" placeholder="ID" name="id"
										value='<%=request.getSession().getAttribute("studentName")%>'
										type="text" readonly>
								</div>
								<div class="form-group">
									<label for="Grade"><fmt:message
											key="label.enrollment.table.title.grade" /></label> <input
										class="form-control" placeholder="Grade" name="grade"
										type="number" min="0" max="5" step="0.1" value="" required="true">
								</div>
								<input class="btn btn-lg btn-success btn-block" type="submit"
									value="Save">
							</fieldset>
						</form></div>
					</div>
				</div>
			</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="views/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>