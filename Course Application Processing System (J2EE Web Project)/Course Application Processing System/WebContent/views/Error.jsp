<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ERROR</title>
<meta name="keywords" content="404" />
<link href="${pageContext.request.contextPath}/bootstrap/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<div class="text-center">
		<div class="header">
			<div class="logo">
				<h1>
					Ohh
				</h1>
			</div>
		</div>
		<div class="content">
			<img src="${pageContext.request.contextPath}/img/error-img.png" title="error" />
			<p>
				<span><label>O</label>hh.....</span>You Requested the page that is
				no longer There.
			</p>
			<div class="copy-right">
				<p>&#169 All rights Reserved | Designed by TEAM 10</p>
			</div>
		</div>
	</div>
</body>
</html>