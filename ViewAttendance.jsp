<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>View Attendance</title>

<style>

*{ box-sizing:border-box; }

/* FULL HEIGHT */
html, body{
height:100%;
}

/* FLEX */
body{
margin:0;
font-family:Arial, sans-serif;
background:#eef2f7;

display:flex;
flex-direction:column;
}

/* HEADER */
.header{
background:#00264d;
color:white;
padding:18px;
text-align:center;
font-size:22px;
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
margin:0 15px;
text-decoration:none;
font-weight:bold;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTAINER */
.container{
width:95%;
margin:30px auto;
flex:1; /* push footer */
}

/* TABLE */
table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 6px 18px rgba(0,0,0,0.15);
border-radius:8px;
overflow:hidden;
}

th{
background:#004080;
color:white;
padding:14px;
}

td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f1f7ff;
}

/* STATUS */
.present{
color:green;
font-weight:bold;
}

.absent{
color:red;
font-weight:bold;
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
College Management System - Attendance Records
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="MarkAttendance.jsp">Mark Attendance</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<table>

<tr>
<th>Student ID</th>
<th>Course ID</th>
<th>Date</th>
<th>Status</th>
</tr>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

st = con.createStatement();

/* ✅ FIX: Latest records first */
rs = st.executeQuery("SELECT * FROM attendance ORDER BY date DESC");

boolean found=false;

while(rs.next()){
found=true;
String status = rs.getString("status");
%>

<tr>
<td><%=rs.getString("student_id")%></td>
<td><%=rs.getString("course_id")%></td>
<td><%=rs.getString("date")%></td>
<td class="<%=status.equals("Present") ? "present" : "absent"%>">
<%=status%>
</td>
</tr>

<%
}

if(!found){
%>
<tr>
<td colspan="4" style="color:red;">No attendance records found</td>
</tr>
<%
}

}catch(Exception e){
%>
<tr>
<td colspan="4" style="color:red;">Error: <%=e.getMessage()%></td>
</tr>
<%
}finally{
try{
if(rs!=null) rs.close();
if(st!=null) st.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

</table>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>