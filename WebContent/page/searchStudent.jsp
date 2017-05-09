<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Student</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<center>
	<img alt="Logo RUPP" src="../imgs/rupp_logo.png">
	<div class="wrapper">
	<h1>Royal University of Phnom Penh</h1>
	<h2>Computer Science Department</h2><hr/>
	
	<form action="showAttendance.jsp" method="post"><br/>			
		<table class="tableStyle">
			<tr class="trStyle">
				<td class="trStyle">Student's Name: </td>
				<td class="trStyle"><input type="text" name="studentID" class="widthInput"/><br/></td>
			</tr>
			<tr class="trStyle">
				<td class="trStyle">Year Study: </td>
				<td class="trStyle">
					<select name="years" class="widthCombobox">
						<option value="Year I">Year I</option>
						<option value="Year II">Year II</option>
						<option value="Year III">Year III</option>
						<option value="Year IV">Year IV</option>
					</select>
				</td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle">Class Study: </td>
				<td class="tdStyle"><input type="text" name="classStudy" class="widthInput"/></td>
			</tr>
			<tr class="trStyle">
				<td class="tdStyle"></td>
				<td class="tdStyle"><input id="search" type="submit" value="Search"/></td>
			</tr>
		</table>
</form>
</div>
</center>
</body>
</html>