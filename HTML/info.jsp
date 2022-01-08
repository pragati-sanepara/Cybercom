<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Information</title>
</head>
<body>
<table border="2">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Date of Birth</th>
			<th>Gender</th>
			<th>Email</th>
			<th>Security Answer</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Zip Code</th>
			<th>Phone</th>
</tr>
	<tr>
	<td><%=request.getParameter("fname") %></td>
	<td><%=request.getParameter("lname") %></td>
	<td><%=request.getParameter("day") %><%="/"%><%=request.getParameter("year") %></td>
	<td><%=request.getParameter("gender") %></td>
	<td><%=request.getParameter("email") %></td>
	<td><%=request.getParameter("securityAnswer") %></td>
	<td><%=request.getParameter("address") %></td>
	<td><%=request.getParameter("city") %></td>
	<td><%=request.getParameter("state") %></td>
	<td><%=request.getParameter("zipCode") %></td>
	<td><%=request.getParameter("phone") %></td>
	</tr>
	</table>
	
</body>
</html>