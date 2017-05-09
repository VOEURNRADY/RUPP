<%@page import="java.util.ArrayList"%>
<%@page import="dto.AttendenceDto"%>
<%@page import="dao.AttendenceDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<a href="searchStudent.jsp" style="float:right; margin-right: 20px; text-decoration: none; font-weight: bold;">Log out</a>
<center>
	<img alt="Logo RUPP" src="../imgs/rupp_logo.png">
	<div class="wrapper">
		<h1>Royal University of Phnom Penh</h1>
		<h2>Computer Science Department</h2><hr/>
		<br/><br/>
		
		<%
			int stuID=Integer.parseInt(request.getParameter("studentID"));
			String classes=request.getParameter("classStudy");
			
			AttendenceDao dao=new AttendenceDao();
			ArrayList<AttendenceDto> list=dao.showAttendanceList(stuID, classes);
		%>
		<table>
			<tr>
				<th>N<sup>o</sup></th>
				<th>NAME</th>
				<th>SEX</th>
				<th>CLASS</th>
				<th>ABSENCE</th>
				<th>DATE</th>
				<th>OTHER</th>
			</tr>
			<%int n=0; %>
			<%for(AttendenceDto dto: list) {%>
				<tr>
					<td><%=dto.getStuId() %></td>
					<td><%=dto.getStuName() %></td>
					<td><%=dto.getStuSex() %></td>
					<td><%=dto.getClasses() %></td>
					<td><%=dto.getAbsence() %></td>
					<td><%=dto.getDate() %></td>
					<td><%=dto.getOther() %></td>
				</tr>			 
			<%} %>
		</table>
	</div>
</center>
</body>
</html>