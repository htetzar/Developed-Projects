<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="label.Admin.Manage.Enrollment" /></title>
<fmt:setBundle basename="messages" />
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.enrollment.list" />
			</h3>
		</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-md-6">
				<span class="label label-success" style="font-size: 12pt; line-height: normal;"> <fmt:message
						key="label.enrollment.total" /> <font style="color: red;">${TOTAL_RECORDS}</font></span>
			</div>
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/searchEnroll"
					method="post" class="form-search">
					<div class=" " style="padding-left: 0px;">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="<fmt:message key="label.table.search.studentid"/>"
								name="studentId" value="${param['studentId']}"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit" title="SEARCH">
									<i class="glyphicon glyphicon-search" style="font-size: 15pt;"></i>
								</button>
							</span>
						</div>
						<c:if test="${requestScope['enrorEnroll'] !=null}">
							<div class="alert alert-danger" style="margin-bottom: 0px;">
								<span class="glyphicon glyphicon-exclamation-sign"></span>
								<%=request.getAttribute("enrorEnroll")%></div>
						</c:if>
					</div>
				</form>
			</div>
		</div> <br />
			<table class="table table-bordered table-striped">

				<tr class="info">
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentId" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentName" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.courseId" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.courseName" /></th>
					<th class="text-center"><fmt:message
							key="label.course.table.title.courseStartDate" /></th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>

				<tbody>
					<c:forEach var="enrollment" items="${enrollmentList}">
						<tr class="text-center">
							<td class="nowrap">${enrollment.studentDTO.studentId}</td>
							<td class="nowrap">${enrollment.studentDTO.studentName}</td>
							<td class="nowrap">${enrollment.courseDTO.courseId}</td>
							<td class="nowrap">${enrollment.courseDTO.courseName}</td>
							<td class="nowrap">${enrollment.courseDTO.courseStartDate}</td>
							<td class="nowrap"><c:url var="delurl" scope="page"
									value="/deleteEnrollment">
									<c:param name="studentID"
										value="${enrollment.studentDTO.studentId}" />
									<c:param name="courseID"
										value="${enrollment.courseDTO.courseId}" />
								</c:url> <c:choose>
									<c:when test="${enrollment.allowDelete==true}">
										<a href="${delurl}" class="btn btn-danger" type="button"
											title="Delete"> <span class="glyphicon glyphicon-trash">
										</span>
										</a>
									</c:when>
									<c:otherwise>
										<button type="button" disabled="disabled"
											title="The entry cannot be deleted" class="btn btn-danger">
											<span class="glyphicon glyphicon-trash"> </span>
										</button>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row text-center">
				<ul class="pagination">
					<!-- Previous link  -->
					<c:if test="${currentPage != 1}">
						<li><a
							href="${pageContext.request.contextPath}/adminEnrollment?page=${currentPage - 1}">Previous</a></li>
					</c:if>
					<!-- Page numbers. -->
					<li class="text-center">
						<tr>
							<c:forEach begin="1" end="${noOfPages}" var="i">
								<c:choose>
									<c:when test="${currentPage eq i}">
										<td><a style="font-size: 16px;"><strong>${i}</strong></a></td>
									</c:when>
									<c:otherwise>
										<td><a
											href="${pageContext.request.contextPath}/adminEnrollment?page=${i}">${i}</a></td>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</li>
					<!--         Next link -->
					<c:if test="${currentPage lt noOfPages}">
						<li><a
							href="${pageContext.request.contextPath}/adminEnrollment?page=${currentPage + 1}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>