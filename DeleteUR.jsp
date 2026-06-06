<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String email=request.getParameter("email");

Connection con;
PreparedStatement ps;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps=con.prepareStatement("delete from userregistration where email=?");

ps.setString(1,email);

int k=ps.executeUpdate();

if(k>0)
{
%>

<script>
alert("User Deleted Successfully");
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
alert("Error Occurred");
window.location="ShowUR.jsp";
</script>

<%
}

%>

