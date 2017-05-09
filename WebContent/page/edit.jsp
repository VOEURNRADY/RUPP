<%@page import="javax.websocket.SendResult"%>
<%@page import="dao.AttendenceDao"%>
<%@page import="dto.AttendenceDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		/* int id=Integer.parseInt(request.getParameter("ids"));
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String classes=request.getParameter("classes");
		String absence=request.getParameter("absence");
		String date=request.getParameter("date");
		String other=request.getParameter("other"); */
		
		int id=Integer.parseInt(request.getParameter("ids"));
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String classes=request.getParameter("classes");
		String absence=request.getParameter("absence");
		String dates=request.getParameter("date");
		String other=request.getParameter("other");
		
		out.print(id);
		out.print(name);
		out.print(sex);
		out.print(classes);
		out.print(absence);
		out.print(dates);
		out.print(other);
		
		
		/* 
		AttendenceDto dto=new AttendenceDto();
		dto.setStuId(id);
		dto.setStuName(name);
		dto.setStuSex(sex);
		dto.setClasses(classes);
		dto.setAbsence(absence);
		dto.setDate(date);
		dto.setOther(other);
		
		AttendenceDao dao=new AttendenceDao();
		dao.editStudent(dto);
		response.sendRedirect("editform.jsp"); */
	%>
</body>
</html>