<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String id=request.getParameter("course_id");
String name=request.getParameter("course_name");
String duration=request.getParameter("course_duration");
String fee=request.getParameter("course_fee");
String dept=request.getParameter("department");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("update courses set course_name=?,course_duration=?,course_fee=?,department=? where course_id=?");

ps.setString(1,name);
ps.setString(2,duration);
ps.setString(3,fee);
ps.setString(4,dept);
ps.setString(5,id);

ps.executeUpdate();

con.close();

response.sendRedirect("ViewCourses.jsp");

}
catch(Exception e){

out.println(e);

}

%>

