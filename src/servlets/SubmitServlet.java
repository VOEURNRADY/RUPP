package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.MyConnection;

@WebServlet("/SubmitServlet")
public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String[] id=request.getParameterValues("stuID");
		String[] name=request.getParameterValues("stuName");
		String[] sex=request.getParameterValues("stuSex");
		String[] absence=request.getParameterValues("absence");
		String[] other=request.getParameterValues("other");
		
		String classes=request.getParameter("classes");
		String date=request.getParameter("dates");
		
		int n=Integer.parseInt(request.getParameter("countNumber"));
		int i=0;	
		
		String ids="";
		String names="";
		String sexes="";
		String absences="";
		String others="";

		try{
			Connection con=MyConnection.getConnection();
			java.sql.Statement st=con.createStatement();
			for(i=0;i<n;i++){
				ids=id[i];
				names=name[i];
				sexes=sex[i];
				absences=absence[i];
				others=other[i];
				
				String sql="INSERT INTO tbabsences(stuID,stuName,stuSex,stuClass,stuAbsence,date,other) VALUES('"+ids+"','"+names+"','"+sexes+"','"+classes+"','"+absences+"','"+date+"','"+others+"')";
				
				st.addBatch(sql);
			}
			st.executeBatch();
			
		}catch(Exception e){}	
				
		RequestDispatcher rd=request.getRequestDispatcher("./page/Thanks.jsp");
		rd.include(request, response);
	
		out.close();
	}

}







/*
String sql="INSERT INTO tbabsences(stuID,stuName,stuSex,stuClass,stuAbsence,date,other) VALUES(?,?,?,?,?,?,?)";
try(
		
		Connection con=MyConnection.getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(sql);
){
	for(i=0;i<n;i++){
		ids=id[i];
		names=name[i];
		sexes=sex[i];
		absences=absence[i];
		others=other[i];
		
		ps.setString(1, ids);
		ps.setString(2, names);
		ps.setString(3, sexes);
		ps.setString(4, classes);
		ps.setString(5, absences);
		ps.setString(6, date);
		ps.setString(7, others);
		ps.addBatch();				
	}			
	ps.executeBatch();
}catch(Exception e){
	out.println(e);
}
*/