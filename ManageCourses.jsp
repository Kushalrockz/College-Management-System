<!DOCTYPE html>
<html>
<head>
<title>Manage Courses</title>

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

/* ✅ MAIN CONTENT EXPANDS */
.container{
padding:40px;
text-align:center;
flex:1;   /* 🔥 IMPORTANT */
}

/* PANEL */
.panel{
display:flex;
justify-content:center;
flex-wrap:wrap;
gap:30px;
}

/* CARD */
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
color:#555;
font-size:14px;
}

/* ✅ FOOTER ALWAYS AT BOTTOM */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
}

</style>
</head>

<body>

<div class="header">
<h1>Course Management</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Course Control Panel</h2>

<div class="panel">

<a href="AddCourse.jsp" style="text-decoration:none;">
<div class="box">
<h3>Add Course</h3>
<p>Create a new course</p>
</div>
</a>

<a href="ViewCourses.jsp" style="text-decoration:none;">
<div class="box">
<h3>View Courses</h3>
<p>Display all courses</p>
</div>
</a>

</div>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>