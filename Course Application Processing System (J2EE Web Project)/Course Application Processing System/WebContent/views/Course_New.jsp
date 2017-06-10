<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.course.add" /></title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/courseInsert"
		method="post">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.course.add" />
				</h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cID"><fmt:message
								key="label.course.table.title.courseName" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id="cID" size=15
								name="courseName" type="text" maxlength=20 required="true" /> <input
								type="hidden" name="courseId" value="true" />
						</div>
					</div><br/>
					<div class="form-group" >
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="lID"><fmt:message
								key="label.course.table.title.lecturerName" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<!-- <input class="form-control input-md" id="lID" name="lecturerId"
								type="text" maxlength=20 required="true"> -->
								<select	name="lecturerId" class="form-control input-md">
								<c:forEach items="${lecturerList}" var="lecturer">
									<%-- <c:if test="${lecturer.lecturerName != selected}">										
									</c:if> --%>
									<option value="${lecturer.lecturerId}">${lecturer.lecturerName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br/>
					<div class="form-group" style="padding-bottom: 115px;">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cDesc"><fmt:message
								key="label.course.table.title.courseDescription" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<textarea class="form-control input-md" id="cDesc" rows="6"
								name="courseDescription" type="text" style="resize: none;"
								required="true"></textarea>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cDesc"><fmt:message
								key="label.course.table.title.courseType" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id="cDesc" name="courseType"
								type="text" maxlength=20 required="true">
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cDur"><fmt:message
								key="label.course.table.title.courseDuration" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id="cDur"
								name="courseDuration" type="number" step="0.5" min="1" max="100"
								required="true"
								title="Duration must be less or equal to 100 days" />
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="enrollmentDate"><fmt:message
								key="label.course.table.title.courseStartDate" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id=enrollmentDate
								name="courseStartDate" type="text" maxlength=20 required="true">
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cSize"><fmt:message
								key="label.course.table.title.courseSize" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id="courseSize"
								name="courseSize" type="number" min="1" max="100"
								required="true"
								title="Maximum Student must less or equal to 100">
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
							for="cCredit"><fmt:message
								key="label.course.table.title.courseCredit" /></label>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<input class="form-control input-md" id="cCredit"
								name="courseCredit" type="number" min="4" max="12"
								required="true" title="Credit range : 4 - 12" />
						</div>
					</div>
					<br>
					<div class="">
						<div class="col-md-4 col-xs-6 col-sm-6 text-right">
							<button type="submit" class="btn btn-success"><fmt:message key="label.button.submit" /></button>
						</div>
						<div class="col-md-4 col-xs-6 col-sm-6 text-left">
							<button type="reset" class="btn btn-primary"><fmt:message key="label.button.reset" /></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>