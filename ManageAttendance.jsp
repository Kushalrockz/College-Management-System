<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Attendance Management</title>

<style>

*{
box-sizing:border-box;
}

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

/* CONTAINER */
.container{
padding:40px;
text-align:center;

/* ✅ PUSH FOOTER DOWN */
flex:1;
}

/* PANEL */
.panel{
display:flex;
justify-content:center;
flex-wrap:wrap;
gap:30px;
}

/* BOX */
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
margin-bottom:10px;
}

.box p{
font-size:14px;
color:#555;
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
<h1>Attendance Management</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Attendance Control Panel</h2>

<div class="panel">

<a href="MarkAttendance.jsp" style="text-decoration:none;">
<div class="box">
<h3>Mark Attendance</h3>
<p>Record student attendance</p>
</div>
</a>

<a href="ViewAttendance.jsp" style="text-decoration:none;">
<div class="box">
<h3>View Attendance</h3>
<p>Display attendance records</p>
</div>
</a>

<a href="UpdateAttendance.jsp" style="text-decoration:none;">
<div class="box">
<h3>Update Attendance</h3>
<p>Edit attendance details</p>
</div>
</a>

</div>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>