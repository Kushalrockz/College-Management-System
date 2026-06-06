<!DOCTYPE html>
<html>
<head>
<title>Student Profile</title>

<style>

/* FULL PAGE */
body{
font-family:'Segoe UI', Arial;
margin:0;
background:linear-gradient(to right, #eef2f7, #d9e6f2);
}

/* HEADER */
.header{
background:#00264d;
color:white;
padding:22px;
text-align:center;
font-size:22px;
letter-spacing:1px;
}

/* NAVBAR */
.navbar{
background:#004080;
padding:12px;
text-align:center;
}

.navbar a{
color:white;
text-decoration:none;
margin:0 18px;
font-weight:bold;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTAINER */
.container{
display:flex;
justify-content:center;
align-items:center;
padding:50px;
}

/* PROFILE CARD */
.profile-card{
background:white;
width:420px;
padding:35px;
border-radius:15px;
box-shadow:0 12px 30px rgba(0,0,0,0.2);
animation:fadeIn 0.6s ease;
}

/* TITLE */
.profile-card h2{
text-align:center;
color:#003366;
margin-bottom:25px;
}

/* PROFILE ROW */
.profile-row{
display:flex;
justify-content:space-between;
padding:10px 0;
border-bottom:1px solid #eee;
}

.profile-row:last-child{
border-bottom:none;
}

.label{
font-weight:bold;
color:#333;
}

.value{
color:#555;
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
margin-top:40px;
}

/* ANIMATION */
@keyframes fadeIn{
from{opacity:0; transform:translateY(20px);}
to{opacity:1; transform:translateY(0);}
}

</style>
</head>

<body>

<div class="header">
<h1>College Management System</h1>
<p>Student Profile</p>
</div>

<div class="navbar">
<a href="StudentDashboard.jsp">Dashboard</a>
<a href="Profile.jsp">Profile</a>
<a href="Attendance.jsp">Attendance</a>
<a href="Marks.jsp">Marks</a>
<a href="Courses.jsp">Courses</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<div class="profile-card">

<%@page import="java.sql.*" %>
<%
Connection con;
Statement stmt;

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");
stmt = con.createStatement();

String user = session.getAttribute("user").toString();

ResultSet rs = stmt.executeQuery(
"select * from userregistration WHERE email='"+user+"' "
);

while(rs.next()){
%>

<h2>My Profile</h2>

<div class="profile-row">
<span class="label">Name:</span>
<span class="value"><%=rs.getString(1)%></span>
</div>

<div class="profile-row">
<span class="label">Email:</span>
<span class="value"><%=rs.getString(2)%></span>
</div>

<div class="profile-row">
<span class="label">Department:</span>
<span class="value">Computer Science</span>
</div>

<div class="profile-row">
<span class="label">Semester:</span>
<span class="value">6th</span>
</div>

<div class="profile-row">
<span class="label">Contact:</span>
<span class="value"><%=rs.getString(4)%></span>
</div>

<% } %>

</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | All Rights Reserved
</div>

</body>
</html>