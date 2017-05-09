package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AttendenceDao;
import dto.AttendenceDto;


@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String classes=request.getParameter("classes");
		String absence=request.getParameter("absence");
		String date=request.getParameter("date");
		String other=request.getParameter("other");
		
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
		
		RequestDispatcher rd=request.getRequestDispatcher("page/Thanks.jsp");
		rd.forward(request,response);
		
		out.close();
	}

}
