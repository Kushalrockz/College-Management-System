<!DOCTYPE html>
<html>
<head>
<title>Admin Reports</title>

<style>

body{
margin:0;
font-family:Arial;
background:#f4f6f9;
}

.header{
background:#003366;
color:white;
padding:20px;
text-align:center;
}

.header h1{
margin:0;
}

.navbar{
background:#0059b3;
padding:12px;
text-align:center;
}

.navbar a{
color:white;
text-decoration:none;
margin:15px;
font-weight:bold;
}

.navbar a:hover{
text-decoration:underline;
}

.container{
padding:40px;
text-align:center;
}

.card{
background:white;
width:250px;
display:inline-block;
margin:20px;
padding:30px;
border-radius:8px;
box-shadow:0 2px 8px rgba(0,0,0,0.2);
}

.card h3{
margin-bottom:20px;
}

.card a{
background:#0059b3;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:5px;
}

.card a:hover{
background:#003366;
}

</style>
</head>

<body>

<div class="header">
<h1>Admin Reports</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageCourse.jsp">Manage Course</a>
<a href="ManageFaculty.jsp">Faculty</a>
<a href="Attendance.jsp">Attendance</a>
<a href="Marks.jsp">Marks</a>
<a href="Reports.jsp">Reports</a>
<a href="Logout.jsp">Logout</a>
</div>

<div class="container">

<div class="card">
<h3>Course Report</h3>
<a href="CourseReport.jsp">View Report</a>
</div>

<div class="card">
<h3>Faculty Report</h3>
<a href="FacultyReport.jsp">View Report</a>
</div>

<div class="card">
<h3>Student Report</h3>
<a href="StudentReport.jsp">View Report</a>
</div>

<div class="card">
<h3>Attendance Report</h3>
<a href="AttendanceReport.jsp">View Report</a>
</div>

<div class="card">
<h3>Marks Report</h3>
<a href="MarksReport.jsp">View Report</a>
</div>

</div>

</body>
</html>

