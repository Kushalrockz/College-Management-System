<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String course=request.getParameter("course");
String semester=request.getParameter("semester");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("update students set name=?,contact=?,course=?,semester=? where email=?");

ps.setString(1,name);
ps.setString(2,contact);
ps.setString(3,course);
ps.setString(4,semester);
ps.setString(5,email);

ps.executeUpdate();

response.sendRedirect("ViewStudents.jsp");

}

catch(Exception e){
out.println(e);
}

%>

