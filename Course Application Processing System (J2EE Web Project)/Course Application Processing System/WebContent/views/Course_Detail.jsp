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
<title><fmt:message key="label.courseDetailJsp.title" /></title>
<title><fmt:message key="label.button.submit" /></title>
</head>
<body>
		<form action="${pageContext.request.contextPath}/courseDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.courseDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cID"><fmt:message key="label.course.table.title.courseId" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cID" size=15 name="courseId" type="text" value="${courseId}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cName"><fmt:message key="label.course.table.title.courseName" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cName" name="courseName" type="text" value="${courseName}" maxlength=20 readonly="readonly" >
							    <input type="hidden" name="ins" value="true" />
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lID"><fmt:message key="label.course.table.title.lecturerName" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lID" name="lecturerName" type="text" value="${lecturerName}" maxlength=20 readonly="readonly" >
					
					</div>
				</div><br/>
				<div class="form-group" style="padding-bottom: 115px;">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cDesc"><fmt:message key="label.course.table.title.courseDescription" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<textarea class="form-control input-md" id="cDesc" name="courseDescription" type="text" rows="6" maxlength=20 readonly="readonly" style="resize: none;">${courseDescription}</textarea>
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cType"><fmt:message key="label.course.table.title.courseType" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cType" name="courseType" type="text" value="${courseType}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cDur"><fmt:message key="label.course.table.title.courseDuration" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cDur" name="courseDuration" type="text" value="${courseDuration} (days)" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cSDate"><fmt:message key="label.course.table.title.courseStartDate" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cSDate" name="courseStartDate" type="text" value="${courseStartDate}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cSize"><fmt:message key="label.course.table.title.courseSize" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cSize" name="courseSize" type="text" value="${courseSize}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="cCredit"><fmt:message key="label.course.table.title.courseCredit" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="cCredit" name="courseCredit" type="text" value="${courseCredit}" maxlength=20 readonly="readonly" >
					</div>
				</div><br/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>