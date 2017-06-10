<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.iss.team10.caps.model.LoginDTO"%>
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Course Application Processing System (CAPS)</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown ">
		
		<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-expanded="false"> 			
			<c:if test="${sessionScope['user'].userId!=null}">
					<span class="glyphicon glyphicon-user"></span>
					<%
						LoginDTO user = (LoginDTO) session.getAttribute("user");
					%>
					<%-- <%=user.getUserId()%> --%>
					<%=(String) session.getAttribute("userName")%>
				</c:if> <span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li class="divider"></li>
				<li><a href="${pageContext.request.contextPath}/main"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
			</ul></li>
	</ul>
</div>
