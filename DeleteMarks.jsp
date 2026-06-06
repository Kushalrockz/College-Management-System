<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
Connection con=null;
PreparedStatement ps=null;

String message="";

// ✅ GET ID FROM URL
String id = request.getParameter("id");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

// ✅ DELETE QUERY
ps = con.prepareStatement("DELETE FROM marks WHERE id=?");
ps.setInt(1, Integer.parseInt(id));

int rows = ps.executeUpdate();

if(rows>0){
    message="Record Deleted Successfully";
}else{
    message="No record found";
}

// ✅ REDIRECT BACK TO VIEW PAGE
response.sendRedirect("ViewMarks.jsp");

}catch(Exception e){
out.println("Error: "+e.getMessage());
}
%>

