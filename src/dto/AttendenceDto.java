package dto;

public class AttendenceDto {
	private int stuId;
	private String stuName;
	private String stuSex;
	private String Classes;
	private String Absence;
	private String Date;
	private String Other;
	private String Shift;
	
	public String getShift() {
		return Shift;
	}
	public void setShift(String shift) {
		Shift = shift;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getAbsence() {
		return Absence;
	}
	public void setAbsence(String absence) {
		Absence = absence;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getOther() {
		return Other;
	}
	public void setOther(String other) {
		Other = other;
	}
		
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	
	public String getClasses() {
		return Classes;
	}
	public void setClasses(String classes) {
		Classes = classes;
	}
	public String toString(){
		return "MyAttendenceDto [id "+stuId+" Name "+stuName+" Absence "+Absence+" Classes "+Classes+" Date " +Date+" Other "+Other+" ] ";
	}
}
