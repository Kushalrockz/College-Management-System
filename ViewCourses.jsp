<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>View Courses - Admin Panel</title>

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

.header h1{
margin:0;
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
margin:0 15px;
font-weight:bold;
}

.navbar a:hover{
color:#ffd700;
}

/* ✅ MAIN CONTENT EXPANDS */
.container{
width:92%;
margin:40px auto;
flex:1;   /* 🔥 IMPORTANT */
}

/* TABLE */
table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 6px 20px rgba(0,0,0,0.15);
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
border-bottom:1px solid #ddd;
text-align:center;
}

tr:hover{
background:#f1f1f1;
}

/* BUTTONS */
.edit-btn{
background:#28a745;
color:white;
padding:6px 12px;
border-radius:5px;
text-decoration:none;
}

.delete-btn{
background:#dc3545;
color:white;
padding:6px 12px;
border-radius:5px;
text-decoration:none;
}

/* ✅ FOOTER */
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
<p>View All Courses</p>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageCourse.jsp">Manage Course</a>
<a href="AddCourse.jsp">Add Course</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2 style="color:#00264d;margin-bottom:20px;">Available Courses</h2>

<table>

<tr>
<th>Course ID</th>
<th>Course Name</th>
<th>Duration</th>
<th>Fee</th>
<th>Department</th>
<th>Action</th>
</tr>

<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

stmt = con.createStatement();
rs = stmt.executeQuery("select * from courses");

while(rs.next()){
%>

<tr>

<td><%=rs.getString("course_id")%></td>
<td><%=rs.getString("course_name")%></td>
<td><%=rs.getString("course_duration")%></td>
<td><%=rs.getString("course_fee")%></td>
<td><%=rs.getString("department")%></td>

<td>
<a class="edit-btn" href="EditCourse.jsp?id=<%=rs.getString("course_id")%>">Edit</a>

<a class="delete-btn"
onclick="return confirm('Are you sure to delete this course?')"
href="DeleteCourse.jsp?id=<%=rs.getString("course_id")%>">
Delete
</a>
</td>

</tr>

<%
}

}catch(Exception e){
out.println("<p style='color:red;text-align:center;'>"+e.getMessage()+"</p>");
}finally{
try{
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

</table>

</div>

<div class="footer">
<p>&copy; 2026 KHKIE College Management System</p>
</div>

</body>
</html>