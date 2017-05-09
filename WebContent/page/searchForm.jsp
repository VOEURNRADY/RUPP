<%@page import="dto.AttendenceDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AttendenceDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RUPP</title>
<link rel="stylesheet" type="text/css" href="page/css/style.css"/>
</head>
<body>
	<center>
	<img alt="Logo RUPP" src="imgs/rupp_logo.png">
	<div class="wrapper">
	<h1>Royal University of Phnom Penh</h1>
	<h2>Computer Science Department</h2><hr/>
	
	<form class="form-inline" action="./SearchServlet" method="post"><br/>
	<div class="widthTable">
		<%
			String shift="Morning";
			AttendenceDao dao=new AttendenceDao();
			ArrayList<AttendenceDto> list=dao.getClass(shift);			
		%>
			
		<table class="tableStyle">
			<tr class="trStyle">
				<td class="tdStyle">Teacher's Name: </td>
				<td class="tdStyle"><input type="text" name="teacherName" class="widthInput" value="<%= session.getAttribute("name1") %>" placeholder="Teacher's Name........."/><br/></td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle">Time Study: </td>
				<td class="tdStyle">
					<select name="hours" class="widthCombobox" type="combobox">
						<option value="t1">07:30 - 09:00</option>
						<option value="t2">09:15 - 10:45</option>
						<option value="t3">13:30 - 15:00</option>
						<option value="t4">15:15 - 17:15</option>
					</select>
				</td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle">Year Study: </td>
				<td class="tdStyle">
					<select name="years" class="widthCombobox" type="combobox">
						<option value="Year I">Year I</option>
						<option value="Year II">Year II</option>
						<option value="Year III">Year III</option>
						<option value="Year IV">Year IV</option>
					</select>
				</td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle">Shift Study: </td>
				<td class="tdStyle">
					<select name="shifts" type="combobox" class="widthCombobox" >
						<option value="Morning">Morning</option>
						<option value="Afternoon">Afternoon</option>
						<option value="Evening">Evening</option>
					</select>
				</td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle">Class Study: </td>
				<td class="tdStyle">
					<select name="classes" class="widthCombobox" type="combobox">
						<% for(AttendenceDto dto:list){%>			
							<option value="<%=dto.getClasses()%>"><%=dto.getClasses()%></option>
						<%}%>	
					</select>
				</td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle"></td>
				<td class="tdStyle"><input id="search" type="submit" value="Search"/></td>
			</tr>
		</table>
	</div>
</form>
</div>
	</center>
</body>
</html>