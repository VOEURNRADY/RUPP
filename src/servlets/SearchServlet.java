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

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		
		String Year=request.getParameter("years");
		String Class=request.getParameter("classes");
		String Shift=request.getParameter("shifts");		
		
		if(AttendenceDao.getAttendenceList(Class, Shift, Year) != null){
			RequestDispatcher rd=request.getRequestDispatcher("page/AttendenceForm.jsp");  
			rd.forward(request,response);
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("page/searchForm.jsp");  
			rd.forward(request,response);  
		} 
		out.close();  
	}

}
