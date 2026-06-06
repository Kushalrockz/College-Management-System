<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>View Faculty</title>

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
font-family:Arial, sans-serif;
background:#eef2f7;

display:flex;
flex-direction:column;
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
font-size:15px;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTAINER */
.container{
width:95%;
max-width:1100px;
margin:40px auto;

/* ✅ PUSH FOOTER DOWN */
flex:1;
}

/* TABLE */
table{
width:100%;
border-collapse:collapse;
background:white;
border-radius:8px;
overflow:hidden;
box-shadow:0 6px 18px rgba(0,0,0,0.15);
}

th{
background:#004080;
color:white;
padding:14px;
font-size:14px;
text-transform:uppercase;
}

td{
padding:12px;
text-align:center;
border-bottom:1px solid #eee;
font-size:14px;
color:#333;
}

tr:hover{
background:#f5f9ff;
}

/* BUTTONS */
.btn-edit{
background:#28a745;
color:white;
padding:6px 12px;
border-radius:4px;
text-decoration:none;
font-size:13px;
}

.btn-edit:hover{
background:#1e7e34;
}

.btn-delete{
background:#dc3545;
color:white;
padding:6px 12px;
border-radius:4px;
text-decoration:none;
font-size:13px;
}

.btn-delete:hover{
background:#a71d2a;
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
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
<a href="AddFaculty.jsp">Add Faculty</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Contact</th>
<th>Department</th>
<th>Designation</th>
<th>Action</th>
</tr>

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

stmt = con.createStatement();
rs = stmt.executeQuery("SELECT * FROM faculty");

boolean hasData = false;

while(rs.next()){
hasData = true;
%>

<tr>
<td><%=rs.getString("faculty_id")%></td>
<td><%=rs.getString("faculty_name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("contact")%></td>
<td><%=rs.getString("department")%></td>
<td><%=rs.getString("designation")%></td>

<td>
<a class="btn-edit"
href="EditFaculty.jsp?id=<%=rs.getString("faculty_id")%>">Edit</a>

<a class="btn-delete"
href="DeleteFaculty.jsp?id=<%=rs.getString("faculty_id")%>"
onclick="return confirm('Are you sure you want to delete this faculty?');">
Delete
</a>
</td>
</tr>

<%
}

if(!hasData){
%>
<tr>
<td colspan="7" style="color:red;">No faculty records found</td>
</tr>
<%
}

}catch(Exception e){
%>
<tr>
<td colspan="7" style="color:red;">
Error: <%=e.getMessage()%>
</td>
</tr>
<%
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
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>