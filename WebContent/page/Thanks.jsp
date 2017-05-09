<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="dto.AttendenceDto" %>
    <%@page import="dao.AttendenceDao" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RUPP</title>
<link rel="stylesheet" type="text/css" href="page/css/style.css"/>
</head>
<body>
	<%
		String name=request.getParameter("teacherName");
		String classes=request.getParameter("classes");
		String shift=request.getParameter("shiftStudy");
		String year=request.getParameter("year");	
		String now=request.getParameter("dates");
	%>
	<%
		AttendenceDao dao=new AttendenceDao();
		ArrayList<AttendenceDto> list=dao.getAttendenceList(classes, now);
		int n=1;
	%>
	<c:set var="now" value="<%=new Date() %>"></c:set>
	<div class="logout">
		<a href="./index.jsp" style="float:right; margin-right: 20px; text-decoration: none; font-weight: bold;">Log out</a>
	</div>
	<center>
		<img alt="Logo RUPP" src="imgs/rupp_logo.png">
		<div class="wrapper">
			<h1>Royal University of Phnom Penh</h1>
			<h2>Computer Science Department</h2>
			<hr/>			
			<h4>List Absences and Presence of Students of Semester 2</h4>
			<form action="" method="post">	
				<table class="tbHeader">
					<tr>
						<th class="thHeader">Teacher Name: <%= session.getAttribute("name1")%><input type="hidden" name="teacherName" value="<%= session.getAttribute("name1")%>"/></th>
						<th class="thHeader">Year: <%= year %><input type="hidden" name="year" value="<%= year %>"/></th>
						<th class="thHeader">Class: <%= classes %><input type="hidden" name="classes" value="<%= classes %>" /></th>
						<th class="thHeader">Shift Study: <%= shift %><input type="hidden" name="shiftStudy" value="<%= shift %>"/></th>
						<th class="thHeader">Date: <fmt:formatDate type="date" pattern="YYYY-MM-dd" value="${now }"/><input id="dat" type="hidden" name="dates" value="<fmt:formatDate type="date" pattern="YYYY-MM-dd" value="${now }"/>"/></th>							
					</tr>
				</table><br/><br/>
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

				<%for(AttendenceDto dto: list) {%>
					<tr>						
						<td><%= n++ %><input name="stuID" type="hidden" value="<%= dto.getStuId() %>" /><br> </td>
						<td><%= dto.getStuName() %><input name="stuName" type="hidden" value="<%= dto.getStuName() %>" /><br> </td>
						<td><%= dto.getStuSex() %><input name="stuSex" type="hidden" value="<%= dto.getStuSex() %>" /><br> </td>
						<td><%= dto.getClasses() %><input name="stuClass" type="hidden" value="<%= dto.getClasses() %>" /><br> </td>
						<td><%= dto.getAbsence() %><input name="stuAbsence" type="hidden" value="<%= dto.getAbsence()%>"/><br> </td>
						<td><%= dto.getDate() %><input name="Date" type="hidden" value="<%= dto.getDate()%>"/><br> </td>
						<td><%= dto.getOther() %><input name="Other" type="hidden" value="<%= dto.getOther()%>"/><br> </td>
					</tr> 
				<% } %>
			</table><br/>
			</form>
		</div>
	</center>
</body>
</html>