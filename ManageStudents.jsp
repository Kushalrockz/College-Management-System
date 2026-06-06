<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Students</title>

<style>

/* ✅ FULL HEIGHT */
html, body{
height:100%;
}

/* ✅ FLEX LAYOUT */
body{
margin:0;
font-family:Arial;
background:#f4f6f9;

display:flex;
flex-direction:column;
}

/* HEADER */
.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
}

/* NAVBAR */
.navbar{
background:#004080;
padding:12px;
text-align:center;
}

.navbar a{
color:white;
margin:0 15px;
text-decoration:none;
font-weight:bold;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTENT AREA */
.container{
flex:1;   /* 🔥 IMPORTANT (pushes footer down) */
padding:40px;
text-align:center;
}

/* PANELS */
.panel{
display:flex;
justify-content:center;
gap:30px;
flex-wrap:wrap;
}

.box{
background:white;
width:220px;
padding:25px;
border-radius:10px;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
transition:0.3s;
cursor:pointer;
}

.box:hover{
transform:translateY(-6px);
}

.box h3{
color:#004080;
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
}

</style>
</head>

<body>

<div class="header">
<h1>Student Management</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Student Control Panel</h2>

<div class="panel">

<a href="AddStudent.jsp" style="text-decoration:none;">
<div class="box">
<h3>Add Student</h3>
<p>Insert new student details</p>
</div>
</a>

<a href="ViewStudents.jsp" style="text-decoration:none;">
<div class="box">
<h3>View Students</h3>
<p>Display all student records</p>
</div>
</a>

</div>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>