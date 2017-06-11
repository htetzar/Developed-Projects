<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.lecturerlistJsp.title" /></title>
</head>
<body>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.lecturerListJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
			<div class="row">
			<div class="col-md-6">
						<a href="views/Lecturer_New.jsp" class="btn btn-success"><fmt:message
						key="label.lecturer.add" /></a>
			</div>
				<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/lecturerSearch"
					method="post" class="form-search">
					<div class="" style="padding-left: 0px;">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="<fmt:message key="label.table.search.lecturerid" />"
							name="lecturerId"> <span class="input-group-btn">
							<button class="btn btn-default" type="submit" title="SEARCH"><i class="glyphicon glyphicon-search" style="font-size: 15pt;"></i></button>
						</span>
					</div>
					<c:if test="${requestScope['errorLecturer'] !=null}">
			    	    <div class="alert alert-danger" style="margin-bottom: 0px;"><span class="glyphicon glyphicon-exclamation-sign"></span> <%= request.getAttribute("errorLecturer") %></div>
			    	    </c:if>
					</div>
				</form>
			</div>
			</div><br/>		
				<form action="/lecturerList" method=post>
				<table class="table table-striped table-bordered">
					<tr class="info">
						<th class="text-center"><fmt:message key="label.table.No" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerId" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerName" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerEmail" /></th>
						<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
					</tr>
					<c:forEach var="lecturer" items="${lecturerList}"
						varStatus="status">
						<tr class="${status.index%2==0?'even':'odd'} text-center">
							<td class="nowrap">${status.index + currentPage*10-9}</td>
							<td class="nowrap">${lecturer.lecturerId}</td>
							<td class="nowrap">${lecturer.lecturerName}</td>
							<td class="nowrap">${lecturer.lecturerEmail}</td>
							<td class="nowrap"><c:url var="detailurl" scope="page"
									value="/lecturerSearch">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
									<c:param name="lecturerName" value="${lecturer.lecturerName}" />
									<c:param name="lecturerEmail" value="${lecturer.lecturerEmail}" />
									<c:param name="lecturerPhoneNumber"
										value="${lecturer.lecturerPhoneNumber}" />
									<c:param name="lecturerAddress"
										value="${lecturer.lecturerAddress}" />
								</c:url> <a href="${detailurl}" class="btn btn-info" role="button"
								title="DETAIL"><span class="glyphicon glyphicon-info-sign"></span></a>
								<c:url var="updurl" scope="page" value="views/Lecturer_Edit.jsp">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
									<c:param name="lecturerName" value="${lecturer.lecturerName}" />
									<c:param name="lecturerEmail" value="${lecturer.lecturerEmail}" />
									<c:param name="lecturerPhoneNumber"
										value="${lecturer.lecturerPhoneNumber}" />
									<c:param name="lecturerAddress"
										value="${lecturer.lecturerAddress}" />
								</c:url> <a href="${updurl}" class="btn btn-warning" role="button"
								title="EDIT"><span class="glyphicon glyphicon-floppy-open"></span></a>
								<c:url var="delurl" scope="page" value="/lecturerDelete">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
								</c:url> <a href="${delurl}" class="btn btn-danger" title="DELETE"><span
									class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</table>
				</form>
				<div class="row text-center">
					<ul class="pagination">
						<%-- Previous link  --%>
						<c:if test="${currentPage != 1}">
							<li><a
								href="${pageContext.request.contextPath}/lecturerList?page=${currentPage - 1}">Previous</a></li>
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
											<td><a
												href="${pageContext.request.contextPath}/lecturerList?page=${i}">${i}</a></td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</li>
						<%-- Next link --%>
						<c:if test="${currentPage lt noOfPages}">
							<li><a
								href="${pageContext.request.contextPath}/lecturerList?page=${currentPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>