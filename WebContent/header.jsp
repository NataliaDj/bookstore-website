<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<header>
<h1>Big red letters</h1>
</header>
<div id="topNav">
	<ul>
		<li><a href="ControllerServlet?operation=home">Home</a></li>
		
			<c:if test="${user.hasBuyerDTO() == true}">
				<li><a href="ControllerServlet?operation=cart">Cart</a></li>
			</c:if>
			<c:if test="${user.hasSellerDTO() == true}">
				<li><a href="ControllerServlet?operation=manage">Manage Listing</a></li>
				<li><a href="ControllerServlet?operation=sell">New Listing</a></li>
			</c:if>
			<c:if test="${adminAccount == 'yes'}">
				<li><a href="ControllerServlet?operation=searchUsers">Search Users</a></li>
			</c:if>
				<c:if test="${adminAccount != 'yes' }">
					<c:choose>
						<c:when test="${user.hasBuyerDTO() == true || user.hasSellerDTO() == true}">
							<li><a href="ControllerServlet?operation=register">Profile</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="ControllerServlet?operation=login">Login</a></li>
							<li><a href="ControllerServlet?operation=register">Register</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
		<c:if test="${user.hasBuyerDTO() == true || user.hasSellerDTO() == true || adminAccount =='yes'}">
			<li><a href="ControllerServlet?operation=logout">Logout</a></li>
		</c:if>
	</ul>
	</div>
</html>
