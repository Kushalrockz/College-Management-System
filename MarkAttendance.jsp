<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconfig.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Mark Attendance</title>

<style>

*{
box-sizing:border-box;
}

body{
margin:0;
font-family:Arial, sans-serif;
background:#eef2f7;
}

/* HEADER */

.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
font-size:24px;
font-weight:bold;
}

/* NAVBAR */

.navbar{
background:#004080;
padding:12px;
text-align:center;
}

.navbar a{
color:white;
margin:0 18px;
text-decoration:none;
font-weight:bold;
}

.navbar a:hover{
color:#ffd700;
}

/* FORM CARD */

.container{
width:420px;
margin:50px auto;
background:white;
padding:35px;
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

h2{
text-align:center;
color:#004080;
margin-bottom:25px;
}

/* LABEL */

label{
font-weight:bold;
font-size:14px;
color:#333;
}

/* INPUT */

select,input{
width:100%;
padding:10px;
margin-top:6px;
margin-bottom:16px;
border:1px solid #ccc;
border-radius:6px;
}

/* RADIO */

.radio-group{
margin-bottom:15px;
}

.radio-group input{
width:auto;
margin-right:5px;
}

/* BUTTON */

button{
width:100%;
padding:12px;
background:#004080;
color:white;
border:none;
border-radius:6px;
font-size:16px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#00264d;
}

/* FOOTER */

.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
margin-top:40px;
font-size:13px;
}

</style>
</head>

<body>

<div class="header">
College Management System
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageAttendance.jsp">Attendance</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Mark Attendance</h2>

<form action="SaveAttendance.jsp" method="post">

<label>Select Student</label>
<select name="student_id" required>

<option value="">-- Select Student --</option>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from students");

while(rs1.next()){
%>

<option value="<%=rs1.getString(1)%>">
<%=rs1.getString(2)%>
</option>

<%
}
%>
</select>

<label>Select Course</label>
<select name="course_id" required>

<option value="">-- Select Course --</option>

<%
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from courses");

while(rs2.next()){
%>

<option value="<%=rs2.getString("course_id")%>">
<%=rs2.getString("course_name")%>
</option>

<%
}
%>

</select>

<label>Date</label>
<input type="date" name="date" required>

<label>Status</label>
<div class="radio-group">
<input type="radio" name="status" value="Present" required> Present
<input type="radio" name="status" value="Absent"> Absent
</div>

<button type="submit">Submit Attendance</button>

</form>

</div>

<div class="footer">
© 2026 College Management System
</div>

</body>
</html>


