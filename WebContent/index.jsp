<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*"%> 
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome!</title>
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<link href="resultsTable.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@ include file="header.jsp"%>

<div class="middleSection">    
	<div class= "middleSect">
		<form action="advancedSearch.jsp">
		<button type="submit">Advanced Search</button>
		</form>
		<br>
		<br>
		<form action='ControllerServlet?operation=search' class='registerForm' method='POST'>
			Title: <input type="text" name="title">
			<input type="submit" value="Search">
			<br>
		</form>
		<br>
		<br>
		<c:forEach var="i" items="${random}">
		<a href="ControllerServlet?operation=advancedSearch&title=${i.title}&type=${i.pubType}&link=true">${i.title}</a>
		<br>
		</c:forEach>
	</div>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
