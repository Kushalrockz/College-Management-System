<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String id=request.getParameter("id");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("delete from courses where course_id=?");

ps.setString(1,id);

ps.executeUpdate();

response.sendRedirect("ViewCourses.jsp");

}
catch(Exception e){

out.println(e);

}

%>

