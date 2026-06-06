<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String id=request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("select * from courses where course_id=?");

ps.setString(1,id);

ResultSet rs=ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>
<html>
<head>

<title>Edit Course</title>

<style>

body{
margin:0;
font-family:Arial;
background:#f4f6f9;
}

.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
}

.container{
width:420px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 6px 20px rgba(0,0,0,0.2);
}

h2{
text-align:center;
color:#004080;
margin-bottom:20px;
}

label{
font-weight:bold;
}

input{
width:100%;
padding:10px;
margin-top:5px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:5px;
}

button{
width:100%;
padding:12px;
background:#004080;
color:white;
border:none;
font-size:16px;
border-radius:5px;
cursor:pointer;
}

button:hover{
background:#00264d;
}

</style>

</head>

<body>

<div class="header">
<h1>Edit Course</h1>
</div>

<div class="container">

<h2>Update Course Details</h2>

<form action="UpdateCourse.jsp" method="post">

<label>Course ID</label>
<input type="text" name="course_id"
value="<%=rs.getString("course_id")%>" readonly>

<label>Course Name</label>
<input type="text" name="course_name"
value="<%=rs.getString("course_name")%>">

<label>Duration</label>
<input type="text" name="course_duration"
value="<%=rs.getString("course_duration")%>">

<label>Fee</label>
<input type="text" name="course_fee"
value="<%=rs.getString("course_fee")%>">

<label>Department</label>
<input type="text" name="department"
value="<%=rs.getString("department")%>">

<button type="submit">Update Course</button>

</form>

</div>

</body>
</html>

