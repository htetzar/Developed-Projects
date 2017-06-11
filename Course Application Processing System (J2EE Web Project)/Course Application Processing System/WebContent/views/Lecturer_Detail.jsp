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
<title><fmt:message key="label.lecturerDetailJsp.title" /></title>
</head>
<body>
		<form action="/lecturerDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.lecturerDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lID"><fmt:message key="label.lecturer.table.title.lecturerId" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lID" size=15 name="lecturerId" type="text" value="${lecturerId}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lName"><fmt:message key="label.lecturer.table.title.lecturerName" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lName" name="lecturerName" type="text" value="${lecturerName}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lEmail"><fmt:message key="label.lecturer.table.title.lecturerEmail" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lEmail" name="lecturerEmail" type="text" value="${lecturerEmail}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lPhonenumber"><fmt:message key="label.lecturer.table.title.lecturerPhoneNumber" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lPhonenumber" name="lecturerPhoneNumber" type="text" value="${lecturerPhoneNumber}" maxlength=20 readonly="readonly" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lAddress"><fmt:message key="label.lecturer.table.title.lecturerAddress" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lAddress" name="lecturerAddress" type="text" value="${lecturerAddress}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>