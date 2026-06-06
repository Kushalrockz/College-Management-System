<!DOCTYPE html>
<html>
<head>

<title>Add Course</title>

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

.container{
width:420px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 6px 18px rgba(0,0,0,0.2);
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

.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
margin-top:40px;
}

</style>

</head>

<body>

<div class="header">
<h1>Add Course</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageCourses.jsp">Manage Course</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Insert Course Details</h2>

<form action="AddCourseProcess.jsp" method="post">

<label>Course ID</label>
<input type="text" name="course_id" required>

<label>Course Name</label>
<input type="text" name="course_name" required>

<label>Course Duration</label>
<input type="text" name="course_duration" placeholder="Example: 4 Years" required>

<label>Course Fee</label>
<input type="text" name="course_fee" required>

<label>Department</label>
<input type="text" name="department" required>

<button type="submit">Add Course</button>

</form>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>

