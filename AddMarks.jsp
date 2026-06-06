<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Marks</title>

<style>
html, body{
height:100%;
}

body{
margin:0;
font-family:'Segoe UI', Arial;
background:linear-gradient(to right, #eef2f7, #d9e6f2);
display:flex;
flex-direction:column;
}

.header{
background:#00264d;
color:white;
padding:18px;
text-align:center;
font-size:22px;
}

.container{
width:420px;
margin:60px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
flex:1;
}

h2{
text-align:center;
color:#003366;
}

label{
font-weight:600;
display:block;
margin-top:15px;
}

select,input{
width:100%;
padding:10px;
margin-top:6px;
border:1px solid #ccc;
border-radius:6px;
}

button{
width:100%;
margin-top:20px;
padding:12px;
background:#0059b3;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
}

button:hover{
background:#003366;
}

.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
margin-top:auto;
}
</style>
</head>

<body>

<div class="header">Marks Management System</div>

<div class="container">

<h2>Add Marks</h2>

<form method="post" action="AddMarksProcess.jsp">

<!-- STUDENT -->
<label>Student</label>
<select name="student" required>
<option value="">Select Student</option>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

    ps = con.prepareStatement("SELECT student_id, name FROM students");
    rs = ps.executeQuery();

    while(rs.next()){
%>
<option value="<%=rs.getString("student_id")%>">
    <%=rs.getString("name")%>
</option>
<%
    }
}catch(Exception e){
    out.println("<option>Error loading students</option>");
}
%>

</select>

<!-- COURSE -->
<label>Course</label>
<select name="course" required>
<option value="">Select Course</option>

<%
PreparedStatement ps2=null;
ResultSet rs2=null;

try{
    ps2 = con.prepareStatement("SELECT course_id, course_name FROM courses");
    rs2 = ps2.executeQuery();

    while(rs2.next()){
%>
<option value="<%=rs2.getString("course_id")%>">
    <%=rs2.getString("course_name")%>
</option>
<%
    }
}catch(Exception e){
    out.println("<option>Error loading courses</option>");
}finally{
    try{
        if(rs!=null) rs.close();
        if(rs2!=null) rs2.close();
        if(ps!=null) ps.close();
        if(ps2!=null) ps2.close();
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>

</select>

<!-- MARKS -->
<label>Marks</label>
<input type="number" name="marks" min="0" max="100" required>

<!-- EXAM -->
<label>Exam Type</label>
<input type="text" name="exam_type" placeholder="CIE / SEE / Internal / External" required>

<button type="submit">Add Marks</button>

</form>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>