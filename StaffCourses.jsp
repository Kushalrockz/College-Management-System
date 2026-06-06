<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>My Courses</title>

<style>

/* ✅ FULL HEIGHT */
html, body{
height:100%;
}

/* ✅ FLEX FIX */
body{
margin:0;
font-family:Arial;
background:#f4f6f9;

display:flex;
flex-direction:column;
}

.header{
background:#003366;
color:white;
padding:20px;
text-align:center;
}

/* ✅ EXPAND CONTENT */
.container{
width:90%;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.1);

flex:1;
}

table{
width:100%;
border-collapse:collapse;
}

th,td{
padding:12px;
border-bottom:1px solid #ddd;
text-align:center;
}

th{
background:#0059b3;
color:white;
}

.back-btn{
text-align:center;
margin-top:25px;
}

.back-btn a{
background:#0059b3;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:5px;
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
<h1>My Courses</h1>
</div>

<div class="container">

<table>

<tr>
<th>Course Name</th>
<th>Department</th>
</tr>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{

String staffUser=(String)session.getAttribute("user");

if(staffUser==null){
response.sendRedirect("Login.html");
return;
}

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps = con.prepareStatement(
"SELECT c.course_name, c.department " +
"FROM staff_courses sc " +
"JOIN courses c ON sc.course_name = c.course_name " +
"WHERE sc.staff_email=?"
);

ps.setString(1, staffUser);

rs=ps.executeQuery();

boolean found = false;

while(rs.next()){
found = true;
%>

<tr>
<td><%=rs.getString("course_name")%></td>
<td><%=rs.getString("department")%></td>
</tr>

<%
}

if(!found){
out.println("<tr><td colspan='2' style='color:red;'>No courses assigned</td></tr>");
}

}catch(Exception e){
out.println("<tr><td colspan='2' style='color:red;'>"+e.getMessage()+"</td></tr>");
}
%>

</table>

<div class="back-btn">
<a href="StaffDashboard.jsp">Back to Dashboard</a>
</div>

</div>

<!-- ✅ FOOTER AT BOTTOM -->
<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>