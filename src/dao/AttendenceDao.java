package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import dto.AttendenceDto;
import util.MyConnection;

public class AttendenceDao {
	
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;
	
	public static ArrayList<AttendenceDto> getClass(String shift){
		ArrayList<AttendenceDto> list=new ArrayList<AttendenceDto>();
		String sql="SELECT DISTINCT stuShift, stuClass FROM tbstudents where stuShift=?";
		try{
			con=MyConnection.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, shift);
			rs=pst.executeQuery();
			while(rs.next()){
				AttendenceDto dto=new AttendenceDto();
				dto.setShift(rs.getString(1));
				dto.setClasses(rs.getString(2));
				list.add(dto);
			}
		}catch(Exception e){}
		return list;
	}
	
	public static boolean validate(String name, String pass) {		
		boolean status = false;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "rupp";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "rupp";
		String password = "12345";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, password);

			pst = conn.prepareStatement("select * from tbteachers where teacherID=? and teacherPassword=?");
			pst.setString(1, name);
			pst.setString(2, pass);

			rs = pst.executeQuery();
			status = rs.next();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;
	}
	public AttendenceDto getStudent(int id){
		String sql="SELECT * FROM tbabsences WHERE stuID=?";
		AttendenceDto dto=null;
		try(
			Connection con=MyConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
		){
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				dto=new AttendenceDto(); 
				dto.setStuId(rs.getInt(1));
				dto.setStuName(rs.getString(2));
				dto.setStuSex(rs.getString(3));
				dto.setClasses(rs.getString(4));
				dto.setAbsence(rs.getString(5));
				dto.setDate(rs.getString(6));
				dto.setOther(rs.getString(7));
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}	
		return dto;		
	}
	public static ArrayList<AttendenceDto> getAttendenceList(String classes,String shift,String year){
		ArrayList<AttendenceDto> list=new ArrayList<AttendenceDto>();
		String sql="SELECT stuID, stuName, stuSex FROM tbstudents WHERE stuClass=? AND stuShift=? AND stuYear=? ORDER BY stuName ASC";
		try{
			con=MyConnection.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, classes);
			pst.setString(2, shift);
			pst.setString(3, year);
			
			rs = pst.executeQuery();			
			while(rs.next()){
				AttendenceDto dto=new AttendenceDto();
				dto.setStuId(rs.getInt(1));
				dto.setStuName(rs.getString(2));
				dto.setStuSex(rs.getString(3));
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			try {
				con.close();
				pst.close();
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	public static ArrayList<AttendenceDto> getAttendenceList(String classes,String date){
		ArrayList<AttendenceDto> list=new ArrayList<AttendenceDto>();
		String sql="SELECT * FROM tbabsences WHERE stuClass=? AND date=? ORDER BY stuName ASC";
		try{
			con=MyConnection.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, classes);			
			pst.setString(2, date);
			
			rs = pst.executeQuery();			
			while(rs.next()){
				AttendenceDto dto=new AttendenceDto();
				dto.setStuId(rs.getInt(1));
				dto.setStuName(rs.getString(2));
				dto.setStuSex(rs.getString(3));
				dto.setClasses(rs.getString(4));
				dto.setAbsence(rs.getString(5));
				dto.setDate(rs.getString(6));
				dto.setOther(rs.getString(7));
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			try {
				con.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public static ArrayList<AttendenceDto> showAttendanceList(int stuID,String stuClass){
		ArrayList<AttendenceDto> list=new ArrayList<AttendenceDto>();
		String sql="SELECT * FROM tbabsences WHERE stuID=? AND stuClass=? ORDER BY stuAbsence ASC";
		try {
			con=MyConnection.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, stuID);
			pst.setString(2, stuClass);
			rs=pst.executeQuery();
			while(rs.next()){
				AttendenceDto dto=new AttendenceDto();
				dto.setStuId(rs.getInt(1));
				dto.setStuName(rs.getString(2));
				dto.setStuSex(rs.getString(3));
				dto.setClasses(rs.getString(4));
				dto.setAbsence(rs.getString(5));
				dto.setDate(rs.getString(6));
				dto.setOther(rs.getString(7));
				list.add(dto);
			}
			
		} catch (Exception e) {	}
		return list;
	}
	public void editStudent(AttendenceDto dto){
		String sql="UPDATE tbabsence SET stuName=?,stuSex=?,stuClass=?,stuAbsence=?,date=?,other=? WHERE stuID=?";
		try(
			Connection con=MyConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
		){
			ps.setString(1, dto.getStuName());
			ps.setString(2, dto.getStuSex());
			ps.setString(3, dto.getClasses());
			ps.setString(4, dto.getAbsence());
			ps.setString(5, dto.getDate());
			ps.setString(6, dto.getOther());
			ps.setInt(7, dto.getStuId());
			ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
