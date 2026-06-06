<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Staff Reports</title>

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

h2{
color:#003366;
margin-top:30px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:15px;
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

tr:hover{
background:#f1f1f1;
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
<h1>Staff Reports</h1>
</div>

<div class="container">

<h2>Student Marks Report</h2>

<table>

<tr>
<th>Student ID</th>
<th>Course</th>
<th>Internal</th>
<th>External</th>
<th>Total</th>
</tr>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

st=con.createStatement();

String query = "SELECT m.student_id, c.course_name, m.marks, m.exam_type " +
               "FROM marks m " +
               "JOIN courses c ON m.course_id = c.course_id";

rs=st.executeQuery(query);

while(rs.next()){
%>

<tr>
<td><%=rs.getString("student_id")%></td>
<td><%=rs.getString("course_name")%></td>
<td><%=rs.getString("marks")%></td>
<td>-</td>
<td>-</td>
</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>


<h2>Student Attendance Report</h2>

<table>

<tr>
<th>Student ID</th>
<th>Status</th>
<th>Date</th>
</tr>

<%
try{

Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from attendance");

while(rs2.next()){
%>

<tr>
<td><%=rs2.getString("student_id")%></td>
<td><%=rs2.getString("status")%></td>
<td><%=rs2.getString("date")%></td>
</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>

<div class="back-btn">
<a href="StaffDashboard.jsp">Back to Dashboard</a>
</div>

</div>

<!-- ✅ FOOTER AT VERY BOTTOM -->
<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>