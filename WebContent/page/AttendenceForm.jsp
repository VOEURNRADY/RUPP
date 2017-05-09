<%@page import="java.util.Date"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="java.util.ArrayList"%>
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
<title>Attendance</title>
<link rel="stylesheet" type="text/css" href="page/css/style.css"/>
</head>
<body>
	<img alt="Logo RUPP" src="imgs/rupp_logo.png">
	<center>
	<div class="wrapper">
		
		<h1>Royal University of Phnom Penh</h1>
		<h2>Computer Science Department</h2>
		<hr/>
		<h4>List Absences and Presence of Students of Semester 2</h4>
		
		<%
			String classes=request.getParameter("classes");
			String shift=request.getParameter("shifts");
			String year=request.getParameter("years");	
		%>
		<c:set var="now" value="<%=new Date() %>"></c:set>
		
		<form action="./SubmitServlet" method="post">
			<table class="tbHeader">
				<tr>
					<th class="thHeader">Teacher Name: <%= session.getAttribute("name1")%><input type="hidden" name="teacherName" value="<%= session.getAttribute("name1")%>"/></th>
					<th class="thHeader">Year: <%= year %><input type="hidden" name="year" value="<%= year %>"/></th>
					<th class="thHeader">Class: <%= classes %><input type="hidden" name="classes" value="<%= classes %>" /></th>
					<th class="thHeader">Shift Study: <%= shift %><input type="hidden" name="shiftStudy" value="<%= shift %>"/></th>
					<th class="thHeader">Date: <fmt:formatDate type="date" pattern="YYYY-MM-dd" value="${now }"/><input id="dat" type="hidden" name="dates" value="<fmt:formatDate type="date" pattern="YYYY-MM-dd" value="${now }"/>"/></th>
				</tr>
			</table>			
			<table>
				<tr>
					<th rowspan="2">ID</th>
					<th rowspan="2">NAME</th>
					<th rowspan="2">SEX</th>
					<th colspan="3">ABSENCE</th>
					<th rowspan="2">OTHER</th>
				</tr>
				<tr>
					<th style="width: 50px;">A</th>
					<th style="width: 50px;">P</th>	
					<th style="width: 50px;">WA</th>
				</tr><br/><br/>
				<%
					AttendenceDao dao=new AttendenceDao();
					ArrayList<AttendenceDto> list=dao.getAttendenceList(classes, shift, year);
				%>
				<% int n=0; int m=1; %>
				<%for(AttendenceDto dto: list) {%>
					<input type="hidden" name="number" vlaue=<%=n++ %>"/>
					<tr>						
						<td class="WidthInput"><%= m++ %><input name="stuID" type="hidden" value="<%= dto.getStuId() %>" /><br></td>
						<td class="WidthInput"><%= dto.getStuName() %><input name="stuName" type="hidden" value="<%= dto.getStuName() %>" /><br></td>
						<td class="WidthInput"><%= dto.getStuSex() %><input name="stuSex" type="hidden" value="<%= dto.getStuSex() %>" /><br></td>
						<td><input class="checkBox" type="checkbox" name="absence" value="A" /><br></td>
						<td><input class="checkBox" type="checkbox" name="absence" value="P" /><br></td>
						<td><input class="checkBox" type="checkbox" name="absence" value="WA" /><br></td>
						<td class="WidthInput"><input type="text" name="other"/></td>
					</tr> 
				<% } %>
			</table><br/>
			<input type="submit" value="Submit"/>
			<input type="hidden" name="countNumber" value="<%=n %>"/>
		</form>		
	</div>
	</center>	
</body>
</html>