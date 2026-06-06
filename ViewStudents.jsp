<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>View Students</title>

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

.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
}

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

/* ✅ MAIN CONTENT */
.container{
width:90%;
margin:40px auto;
flex:1;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
}

th,td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
}

th{
background:#004080;
color:white;
}

tr:hover{
background:#f1f1f1;
}

.btn-edit{
background:#28a745;
color:white;
padding:6px 12px;
text-decoration:none;
border-radius:4px;
}

.btn-delete{
background:#dc3545;
color:white;
padding:6px 12px;
text-decoration:none;
border-radius:4px;
}

/* ✅ FIXED FOOTER */
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
<h1>View Students</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageStudents.jsp">Manage Students</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<table>

<tr>
<th>Name</th>
<th>Email</th>
<th>Contact</th>
<th>Course</th>
<th>Semester</th>
<th>Action</th>
</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

Statement stmt=con.createStatement();

ResultSet rs=stmt.executeQuery("select * from students");

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("contact")%></td>
<td><%=rs.getString("course")%></td>
<td><%=rs.getString("semester")%></td>

<td>

<a class="btn-edit" href="EditStudent.jsp?email=<%=rs.getString("email")%>">
Edit
</a>

<a class="btn-delete"
onclick="return confirm('Delete this student?')"
href="DeleteStudent.jsp?email=<%=rs.getString("email")%>">

Delete

</a>

</td>

</tr>

<%

}

}
catch(Exception e){
out.println(e);
}

%>

</table>

</div>

<!-- ✅ FOOTER ALWAYS AT BOTTOM -->
<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>