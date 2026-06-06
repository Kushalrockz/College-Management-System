<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Courses</title>

<style>

/* FULL PAGE */
html, body{
height:100%;
}

/* BODY */
body{
font-family:Arial;
margin:0;
background:#f4f6f9;

/* FOOTER FIX */
display:flex;
flex-direction:column;
}

/* HEADER */
.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
box-shadow:0 2px 8px rgba(0,0,0,0.2);
}

.header h1{
margin:0;
font-size:30px;
letter-spacing:1px;
}

/* NAVBAR */
.navbar{
background:#004080;
padding:14px;
text-align:center;
}

.navbar a{
color:white;
margin:0 15px;
text-decoration:none;
font-weight:bold;
font-size:15px;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTAINER */
.container{
padding:40px;
text-align:center;
flex:1;
}

.container h2{
color:#003366;
margin-bottom:30px;
font-size:28px;
}

/* COURSE CARDS */
.course-box{
display:flex;
justify-content:center;
gap:25px;
flex-wrap:wrap;
}

.course{
background:white;
width:230px;
padding:25px;
border-radius:12px;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
transition:0.3s;
}

.course:hover{
transform:translateY(-8px);
box-shadow:0 10px 25px rgba(0,0,0,0.25);
}

.course h3{
color:#004080;
margin-bottom:10px;
}

.course p{
color:#555;
font-size:14px;
margin:5px 0;
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
margin-top:auto;
font-size:14px;
box-shadow:0 -2px 8px rgba(0,0,0,0.2);
}

</style>
</head>

<body>

<div class="header">
<h1>Student Courses</h1>
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

<h2>My Courses</h2>

<div class="course-box">

<div class="course">
<h3>Java Programming</h3>
<p><strong>Code:</strong> CS601</p>
</div>

<div class="course">
<h3>Database Systems</h3>
<p><strong>Code:</strong> CS602</p>
</div>

<div class="course">
<h3>Software Engineering</h3>
<p><strong>Code:</strong> CS603</p>
</div>

<div class="course">
<h3>Computer Networks</h3>
<p><strong>Code:</strong> CS604</p>
</div>

</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | All Rights Reserved
</div>

</body>
</html>