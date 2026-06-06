<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Mark Attendance</title>

<style>
*{
box-sizing:border-box;
}

html, body{
height:100%;
}

body{
margin:0;
font-family:'Segoe UI', Arial, sans-serif;
background:linear-gradient(to right,#eef2f7,#d9e6f2);
display:flex;
flex-direction:column;
}

.header{
background:#00264d;
color:white;
padding:22px;
text-align:center;
box-shadow:0 3px 10px rgba(0,0,0,0.2);
}

.header h1{
margin:0;
font-size:28px;
letter-spacing:1px;
}

.container{
width:92%;
margin:35px auto;
background:white;
padding:30px;
border-radius:14px;
box-shadow:0 10px 28px rgba(0,0,0,0.15);
flex:1;
}

h2{
text-align:center;
color:#003366;
margin-bottom:25px;
}

.form-row{
display:flex;
gap:20px;
margin-bottom:20px;
flex-wrap:wrap;
}

.form-group{
flex:1;
min-width:220px;
}

label{
font-weight:600;
color:#333;
display:block;
margin-bottom:6px;
}

input[type="date"],
input[type="text"]{
width:100%;
padding:11px;
border:1px solid #ccc;
border-radius:7px;
font-size:14px;
}

input:focus{
outline:none;
border-color:#0059b3;
box-shadow:0 0 5px rgba(0,89,179,0.3);
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
overflow:hidden;
border-radius:10px;
box-shadow:0 4px 14px rgba(0,0,0,0.08);
}

th{
background:#0059b3;
color:white;
padding:14px;
font-size:14px;
text-transform:uppercase;
}

td{
padding:13px;
border-bottom:1px solid #eee;
text-align:center;
font-size:14px;
}

tr:hover{
background:#f4f8ff;
}

.radio-group{
display:flex;
justify-content:center;
gap:20px;
}

.radio-group label{
font-weight:500;
margin:0;
display:flex;
align-items:center;
gap:6px;
}

.save-btn{
margin-top:25px;
text-align:center;
}

.save-btn input{
background:#0059b3;
color:white;
padding:12px 35px;
border:none;
border-radius:7px;
cursor:pointer;
font-size:15px;
font-weight:bold;
transition:0.3s;
}

.save-btn input:hover{
background:#003366;
transform:scale(1.03);
}

.back-btn{
text-align:center;
margin-top:20px;
}

.back-btn a{
background:#6c757d;
color:white;
padding:10px 22px;
text-decoration:none;
border-radius:6px;
font-weight:bold;
}

.back-btn a:hover{
background:#495057;
}

.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
font-size:14px;
}
</style>
</head>

<body>

<div class="header">
<h1>Mark Attendance</h1>
</div>

<div class="container">

<h2>Student Attendance</h2>

<form action="SaveAttendance.jsp" method="post">

<div class="form-row">
<div class="form-group">
<label>Date</label>
<input type="date" name="date" required>
</div>

<div class="form-group">
<label>Course ID</label>
<input type="text" name="course_id" placeholder="Enter Course ID" required>
</div>
</div>

<table>
<tr>
<th>Student ID</th>
<th>Student Name</th>
<th>Attendance</th>
</tr>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

st=con.createStatement();
rs=st.executeQuery("SELECT * FROM students WHERE student_id IS NOT NULL");

while(rs.next()){
String sid = rs.getString("student_id");
%>

<tr>
<td>
<%=sid%>
<input type="hidden" name="student_id[]" value="<%=sid%>">
</td>

<td><%=rs.getString("name")%></td>

<td>
<div class="radio-group">
<label>
<input type="radio" name="status_<%=sid%>" value="Present" required>
Present
</label>

<label>
<input type="radio" name="status_<%=sid%>" value="Absent" required>
Absent
</label>
</div>
</td>
</tr>

<%
}

}catch(Exception e){
out.println("<tr><td colspan='3' style='color:red;'>"+e.getMessage()+"</td></tr>");
}finally{
try{
if(rs!=null) rs.close();
if(st!=null) st.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

</table>

<div class="save-btn">
<input type="submit" value="Save Attendance">
</div>

</form>

<div class="back-btn">
<a href="StaffDashboard.jsp">Back to Dashboard</a>
</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | Attendance Management
</div>

</body>
</html>