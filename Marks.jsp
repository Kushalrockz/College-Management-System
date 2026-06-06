<!DOCTYPE html>
<html>
<head>
<title>Student Marks</title>

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

/* FLEX FOR FOOTER */
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

/* TABLE */
table{
width:75%;
margin:auto;
border-collapse:collapse;
background:white;
border-radius:10px;
overflow:hidden;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
}

th,td{
padding:14px;
border-bottom:1px solid #ddd;
text-align:center;
}

th{
background:#004080;
color:white;
font-size:15px;
text-transform:uppercase;
}

td{
font-size:15px;
color:#333;
}

tr:hover{
background:#f1f7ff;
transition:0.3s;
}

/* TOTAL MARKS COLORS */
.excellent{
color:green;
font-weight:bold;
}

.good{
color:#e67e22;
font-weight:bold;
}

.average{
color:red;
font-weight:bold;
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
<h1>Student Marks</h1>
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

<h2>Marks Details</h2>

<table>

<tr>
<th>Subject</th>
<th>Internal</th>
<th>External</th>
<th>Total</th>
</tr>

<tr>
<td>Java</td>
<td>25</td>
<td>60</td>
<td class="excellent">85</td>
</tr>

<tr>
<td>Database</td>
<td>24</td>
<td>58</td>
<td class="good">82</td>
</tr>

<tr>
<td>Software Engineering</td>
<td>26</td>
<td>61</td>
<td class="excellent">87</td>
</tr>

</table>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | All Rights Reserved
</div>

</body>
</html>