<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Marks Management</title>

<style>

/* ✅ FULL HEIGHT FIX */
html, body{
height:100%;
margin:0;
font-family:Arial;
}

/* ✅ FLEX LAYOUT FOR STICKY FOOTER */
body{
display:flex;
flex-direction:column;
background:#f4f6f9;
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
padding:40px;
text-align:center;
flex:1; /* ✅ pushes footer down */
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
font-size:14px;
color:#555;
}

/* ✅ IMPROVED FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
font-size:14px;
letter-spacing:0.5px;
}

</style>

</head>

<body>

<div class="header">
<h1>Marks Management</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Marks Control Panel</h2>

<div class="panel">

<a href="AddMarks.jsp" style="text-decoration:none;">
<div class="box">
<h3>Add Marks</h3>
<p>Enter student marks</p>
</div>
</a>

<a href="ViewMarks.jsp" style="text-decoration:none;">
<div class="box">
<h3>View Marks</h3>
<p>Display student marks</p>
</div>
</a>

<!-- ❌ REMOVED Update Marks card -->

</div>

</div>

<div class="footer">
© 2026 KHKIE College Management System | Admin Panel
</div>

</body>
</html>