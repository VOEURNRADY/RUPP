package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import util.MyConnection;

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String n=request.getParameter("username");  
		String p=request.getParameter("userpass"); 
		
		HttpSession session = request.getSession(false);		
		
		if(session.getAttribute("username")!=null)		
			session.setAttribute("name", n);
		
		String sql="SELECT teacherName FROM tbteachers WHERE teacherID="+n;
		
		if(LoginDao.validate(n, p)){ 	
			try{
				Connection con = MyConnection.getConnection();
				java.sql.Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					String aaa=rs.getString(1);
					session.setAttribute("name1", aaa);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			RequestDispatcher rd=request.getRequestDispatcher("page/searchForm.jsp");  
			rd.forward(request,response);  
		}  
		else{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.include(request,response);  
		}  

		out.close();  
	}  
}  