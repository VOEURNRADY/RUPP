<%@page import="com.sun.xml.internal.ws.client.Stub"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.AttendenceDto"%>
<%@page import="dao.AttendenceDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Data</title>
<style type="text/css">
	.wrapper{
		width: 60%;
	}
</style>
</head>
<body>
	<center>
	<div class="wrapper">
			<h1>Royal University of Phnom Penh</h1>
			<h2>Computer Science Department</h2>
			<hr/>			
		<form action="edit.jsp" method="post">
		<%		
			int ids=Integer.parseInt(request.getParameter("id"));	
			AttendenceDao dao=new AttendenceDao();	
			AttendenceDto dto=dao.getStudent(ids);		
		%>
			<input type="hidden" name="ids" value="<%= dto.getStuId() %> " />
				<table>
					<tr>
						<td>Student Name: </td>
						<td><input type="text" name="name" value="<%= dto.getStuName() %>" /></td>
					</tr>
					<tr>
						<td>Sex: </td>
						<td><input type="text" name="sex" value="<%= dto.getStuSex() %>" /></td>
					</tr>
					<tr>
						<td>Class Room: </td>
						<td><input type="text" name="classes" value="<%= dto.getClasses() %>" /></td>
					</tr>
					<tr>
						<td>Absence: </td>
						<td><input type="text" name="absence" value="<%= dto.getAbsence() %>" /></td>
					</tr>
					<tr>
						<td>Date: </td>
						<td><input type="text" name="date" value="<%= dto.getDate() %>" /></td>
					</tr>
					<tr>
						<td>Other: </td>
						<td><input type="text" name="other" value="<%= dto.getOther() %>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Edit" /></td>
					</tr>					
				</table>
		</form>
	</div>
	</center>
</body>
</html>