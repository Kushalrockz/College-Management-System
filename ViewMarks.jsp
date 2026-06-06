<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>View Marks</title>

<style>

body{
margin:0;
font-family:Arial;
background:#f4f6f9;
min-height:100vh;
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

/* ✅ EDIT BUTTON */
.edit-btn{
background:#ffc107;
color:black;
padding:6px 12px;
border-radius:5px;
text-decoration:none;
}

.edit-btn:hover{
background:#e0a800;
}

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
<h1>View Marks</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="AddMarks.jsp">Add Marks</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<table>

<tr>
<th>Student Name</th>
<th>Course</th>
<th>Marks</th>
<th>Exam Type</th>
<th>Action</th> <!-- ✅ NEW COLUMN -->
</tr>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

/* ✅ IMPORTANT: include m.id */
String query =
"SELECT m.id, s.name, c.course_name, m.marks, m.exam_type " +
"FROM marks m " +
"JOIN students s ON m.student_id = s.student_id " +
"JOIN courses c ON m.course_id = c.course_id";

ps = con.prepareStatement(query);
rs = ps.executeQuery();

boolean found=false;

while(rs.next()){
found=true;
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("course_name")%></td>
<td><%=rs.getString("marks")%></td>
<td><%=rs.getString("exam_type")%></td>

<td>
<a class="edit-btn" href="UpdateMarks.jsp?id=<%=rs.getInt("id")%>">
Edit
</a>
</td>

</tr>

<%
}

if(!found){
%>
<tr>
<td colspan="5" style="color:red;">No Marks Found</td>
</tr>
<%
}

}catch(Exception e){
out.println("<tr><td colspan='5' style='color:red;'>"+e.getMessage()+"</td></tr>");
}finally{
try{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
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