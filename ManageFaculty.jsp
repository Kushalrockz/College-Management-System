<!DOCTYPE html>
<html>
<head>
<title>Manage Faculty</title>

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
width:230px;
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

.box p{
color:#555;
font-size:14px;
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
<h1>Faculty Management</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Faculty Control Panel</h2>

<div class="panel">

<a href="AddFaculty.jsp" style="text-decoration:none;">
<div class="box">
<h3>Add Faculty</h3>
<p>Insert new faculty details</p>
</div>
</a>

<a href="ViewFaculty.jsp" style="text-decoration:none;">
<div class="box">
<h3>View Faculty</h3>
<p>Display all faculty records</p>
</div>
</a>

</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>