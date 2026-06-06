<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Attendance</title>

<style>

*{
box-sizing:border-box;
}

body{
margin:0;
font-family:'Segoe UI', Arial, sans-serif;
background:#eef2f7;

display:flex;
flex-direction:column;
min-height:100vh;
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

/* CONTAINER */
.container{
width:420px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 8px 25px rgba(0,0,0,0.15);

flex:1;
}

h2{
text-align:center;
color:#003366;
margin-bottom:20px;
}

/* FORM */
label{
font-weight:600;
display:block;
margin-top:12px;
}

select,
input[type="date"]{
width:100%;
padding:10px;
margin-top:6px;
border:1px solid #ccc;
border-radius:6px;
}

/* RADIO */
.radio-group{
display:flex;
gap:30px;
margin-top:10px;
align-items:center;
}

.radio-group label{
display:flex;
align-items:center;
gap:6px;
font-weight:500;
}

/* BUTTON */
button{
width:100%;
margin-top:20px;
padding:12px;
background:#004080;
color:white;
border:none;
border-radius:6px;
font-size:15px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#00264d;
}

/* MESSAGE */
.success{
color:green;
text-align:center;
margin-bottom:10px;
font-weight:bold;
}

.error{
color:red;
text-align:center;
margin-bottom:10px;
font-weight:bold;
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
font-size:13px;
margin-top:auto;
}

</style>
</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<h2>Update Attendance</h2>

<%
Connection con=null;
PreparedStatement ps=null;

String message="";

/* UPDATE */
if(request.getParameter("update")!=null){

String student=request.getParameter("studentid");
String course=request.getParameter("courseid");
String date=request.getParameter("date");
String status=request.getParameter("status");

String oldSid=request.getParameter("oldSid");
String oldCid=request.getParameter("oldCid");
String oldDate=request.getParameter("oldDate");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/cms",
"root",
""
);

ps=con.prepareStatement(
"UPDATE attendance SET student_id=?, course_id=?, date=?, status=? " +
"WHERE student_id=? AND course_id=? AND date=?"
);

ps.setString(1,student);
ps.setString(2,course);
ps.setString(3,date);
ps.setString(4,status);

ps.setString(5,oldSid);
ps.setString(6,oldCid);
ps.setString(7,oldDate);

int rows=ps.executeUpdate();

if(rows>0){
message="<div class='success'>Attendance Updated Successfully</div>";
}else{
message="<div class='error'>No Record Updated</div>";
}

}catch(Exception e){
message="<div class='error'>"+e.getMessage()+"</div>";
}
}

/* LOAD RECORD */
String sid=request.getParameter("sid");
String cid=request.getParameter("cid");
String dt=request.getParameter("dt");

String studentId="";
String courseId="";
String date="";
String status="";

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/cms",
"root",
""
);

PreparedStatement ps2=con.prepareStatement(
"SELECT * FROM attendance WHERE student_id=? AND course_id=? AND date=?"
);

ps2.setString(1,sid);
ps2.setString(2,cid);
ps2.setString(3,dt);

ResultSet rs=ps2.executeQuery();

if(rs.next()){

studentId=rs.getString("student_id");
courseId=rs.getString("course_id");
date=rs.getString("date");
status=rs.getString("status");

}

rs.close();
ps2.close();

}catch(Exception e){
out.println(e);
}
%>

<%=message%>

<form method="post">

<input type="hidden" name="oldSid" value="<%=studentId%>">
<input type="hidden" name="oldCid" value="<%=courseId%>">
<input type="hidden" name="oldDate" value="<%=date%>">

<label>Select Student</label>

<select name="studentid">

<%
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("SELECT * FROM students");

while(rs1.next()){

String id=rs1.getString("student_id");
%>

<option value="<%=id%>"
<%=id.equals(studentId)?"selected":""%>>
<%=rs1.getString("name")%>
</option>

<%
}
%>

</select>

<label>Select Course</label>

<select name="courseid">

<%
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("SELECT * FROM courses");

while(rs2.next()){

String id=rs2.getString("course_id");
%>

<option value="<%=id%>"
<%=id.equals(courseId)?"selected":""%>>
<%=rs2.getString("course_name")%>
</option>

<%
}
%>

</select>

<label>Date</label>

<input type="date"
name="date"
value="<%=date%>"
required>

<label>Status</label>

<div class="radio-group">

<label>
<input type="radio"
name="status"
value="Present"
<%=status.equals("Present")?"checked":""%>>
Present
</label>

<label>
<input type="radio"
name="status"
value="Absent"
<%=status.equals("Absent")?"checked":""%>>
Absent
</label>

</div>

<button type="submit" name="update">
Update Attendance
</button>

</form>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | Attendance Management
</div>

</body>
</html>