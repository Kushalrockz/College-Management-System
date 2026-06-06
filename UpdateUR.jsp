<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String city=request.getParameter("city");
String address=request.getParameter("address");
String role=request.getParameter("role");

Connection con=null;
PreparedStatement ps=null;

try
{
Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

String query="update user_registration set name=?,contact=?,city=?,address=?,role=? where email=?";

ps=con.prepareStatement(query);

ps.setString(1,name);
ps.setString(2,contact);
ps.setString(3,city);
ps.setString(4,address);
ps.setString(5,role);
ps.setString(6,email);

int k=ps.executeUpdate();

if(k>0)
{
%>

<script>
alert("User Updated Successfully");
window.location="ShowUR.jsp";
</script>

<%
}
else
{
%>

<script>
alert("User Not Found");
window.location="ShowUR.jsp";
</script>

<%
}

}
catch(Exception e)
{
%>

<script>
alert("Error Occurred!");
window.location="ShowUR.jsp";
</script>

<%
}
%>

