<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.courselistJsp.title" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.courseListJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-md-6">
		<a href="${pageContext.request.contextPath}/prepareForNewCourse" class="btn btn-success"><fmt:message
					key="label.course.add" /></a></div>
					<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/courseSearch"
					method="post" class="form-search">
					<div class=" " style="padding-left: 0px;">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="<fmt:message key="label.table.search.courseid" />"
							name="courseId"> <span class="input-group-btn">
							<button class="btn btn-default" type="submit" title="SEARCH"><i class="glyphicon glyphicon-search" style="font-size: 15pt;"></i></button>
						</span>
					</div>
					<c:if test="${requestScope['errorCourse'] !=null}">
			    	    <div class="alert alert-danger" style="margin-bottom: 0px;"><span class="glyphicon glyphicon-exclamation-sign"></span> <%= request.getAttribute("errorCourse") %></div>
			    	    </c:if>
					</div>
				</form>
			</div>
		</div>
			<br/>
			<table class="table table-striped table-bordered">
				<tr class="info">
					<th class="text-center"><fmt:message key="label.table.No" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseId" /></th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseName" />
					</th>
					<th class="text-center"><fmt:message key="label.course.table.title.courseDuration" />
					</th>
					<th class="text-center"><fmt:message
							key="label.course.table.title.courseStartDate" /></th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + currentPage*10-9}</td>
						<td class="nowrap">${course.courseId}</td>
						<td class="nowrap">${course.courseName}</td>
						<td class="nowrap">${course.courseDuration} (days)</td>
						<td class="nowrap">${course.courseStartDate}</td>
						<td class="nowrap">
						<c:url var="detailurl" scope="page" value="/courseSearch">
								<c:param name="courseId" value="${course.courseId}" />
								<%-- <c:param name="courseName" value="${course.courseName}" />
								<c:param name="lecturerId" value="${course.lecturer.lecturerId}" />
								<c:param name="courseDescription" value="${course.courseDescription}" />
								<c:param name="courseType" value="${course.courseType}" />
								<c:param name="courseDuration" value="${course.courseDuration}" />
								<c:param name="courseStartDate"	value="${course.courseStartDate}" />
								<c:param name="courseSize" value="${course.courseSize}" />
								<c:param name="courseCredit" value="${course.courseCredit}" /> --%>
							</c:url> 
							<a href="${detailurl}" class="btn btn-info" role="button" title="DETAIL"><span class="glyphicon glyphicon-info-sign"></span></a>
						<c:url var="updurl" scope="page" value="/prepareForEditCourse">
								<c:param name="courseId" value="${course.courseId}" />
								<%-- <c:param name="courseName" value="${course.courseName}" />
								<c:param name="lecturerId" value="${course.lecturer.lecturerId}" />
								<c:param name="courseDescription" value="${course.courseDescription}" />
								<c:param name="courseType" value="${course.courseType}" />
								<c:param name="courseDuration" value="${course.courseDuration}" />
								<c:param name="courseStartDate"	value="${course.courseStartDate}" />
								<c:param name="courseSize" value="${course.courseSize}" />
								<c:param name="courseCredit" value="${course.courseCredit}" /> --%>
							</c:url> 
							<a href="${updurl}" class="btn btn-warning" role="button" title="EDIT"><span class="glyphicon glyphicon-floppy-open"></span></a> 
							<c:url var="delurl" scope="page" value="/courseDelete">
								<c:param name="courseId" value="${course.courseId}" />
							</c:url> 
							<a href="${delurl}" class="btn btn-danger" title="DELETE"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="row text-center">
<ul class="pagination">
<%-- Previous link  --%>
    <c:if test="${currentPage != 1}">
        <li><a href="${pageContext.request.contextPath}/courseList?page=${currentPage - 1}">Previous</a></li>
    </c:if>
<%--Page numbers.--%>
    <li class="text-center">
        <tr>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td><a style="font-size: 16px;"><strong>${i}</strong></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="${pageContext.request.contextPath}/courseList?page=${i}">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
    </li>
        <%-- Next link --%>
    <c:if test="${currentPage lt noOfPages}">
        <li><a href="${pageContext.request.contextPath}/courseList?page=${currentPage + 1}">Next</a></li>
    </c:if>
</ul>
</div>
		</div>
	</div>
</body>
</html>