<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

if(session.getAttribute("user") == null) {
    response.sendRedirect("Login.html");
    return;
}

if(!"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("AccessDenied.jsp");
    return;
}

String email=request.getParameter("email");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("select * from students where email=?");

ps.setString(1,email);

ResultSet rs=ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>
<html>
<head>

<title>Edit Student</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
}

.container{
width:400px;
margin:60px auto;
background:white;
padding:30px;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
border-radius:10px;
}

input{
width:100%;
padding:10px;
margin:10px 0;
}

button{
width:100%;
padding:12px;
background:#004080;
color:white;
border:none;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Student</h2>

<form action="UpdateStudent.jsp" method="post">

<input type="hidden" name="email" value="<%=rs.getString("email")%>">

Name
<input type="text" name="name" value="<%=rs.getString("name")%>">

Contact
<input type="text" name="contact" value="<%=rs.getString("contact")%>">

Course
<input type="text" name="course" value="<%=rs.getString("course")%>">

Semester
<input type="text" name="semester" value="<%=rs.getString("semester")%>">

<button type="submit">Update Student</button>

</form>

</div>

</body>
</html>

