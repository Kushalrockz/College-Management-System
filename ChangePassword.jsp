<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String email=request.getParameter("email");
String oldpass=request.getParameter("oldpass");
String newpass=request.getParameter("newpass");

Connection con;
PreparedStatement ps;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps=con.prepareStatement("update userregistration set password=? where email=? and password=?");

ps.setString(1,newpass);
ps.setString(2,email);
ps.setString(3,oldpass);

int i=ps.executeUpdate();

if(i>0)
{
%>

<script>
alert("Password Updated Successfully");
window.location="Login.html";
</script>

<%

}
else
{
%>

<script>
alert("Invalid Email or Password");
window.location="ChangePassword.html";
</script>

<%
}

}
catch(Exception e){
out.println(e);
}

%>

