<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String email=request.getParameter("email");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("delete from students where email=?");

ps.setString(1,email);

ps.executeUpdate();

response.sendRedirect("ViewStudents.jsp");

}

catch(Exception e){
out.println(e);
}

%>

