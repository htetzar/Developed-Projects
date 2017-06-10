<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<fmt:setBundle basename="messages"/>
<title><fmt:message key="label.studentDetailJsp.title" /></title>
</head>
<body>
		<form action="/studentDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.studentDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="sID"><fmt:message key="label.student.table.title.studentId" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="sID" size=15 name="studentId" type="text" value="${studentId}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="sName"><fmt:message key="label.student.table.title.studentName" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="sName" name="studentName" type="text" value="${studentName}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="sEmail"><fmt:message key="label.student.table.title.studentEmail" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="sEmail" name="studentEmail" type="text" value="${studentEmail}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="sPhonenumber"><fmt:message key="label.student.table.title.studentPhoneNumber" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="sPhonenumber" name="studentPhoneNumber" type="text" value="${studentPhoneNumber}" maxlength=20 readonly="readonly" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="sAddress"><fmt:message key="label.student.table.title.studentAddress" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="sAddress" name="studentAddress" type="text" value="${studentAddress}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="enrollDate"><fmt:message key="label.student.table.title.enrollmentDate" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="enrollDate" name="enrollmentDate" type="text" value="${enrollmentDate}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>