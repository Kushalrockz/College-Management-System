<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard - College Management System</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, Helvetica, sans-serif;
}

/* ✅ FULL HEIGHT FIX */
html, body{
height:100%;
}

/* ✅ FLEX LAYOUT */
body{
display:flex;
flex-direction:column;
background:#f4f6f9;
}

/* HEADER */
.header{
background:#00264d;
color:white;
text-align:center;
padding:25px;
}

.header h1{
font-size:28px;
}

.header p{
font-size:15px;
margin-top:5px;
}

/* NAVBAR */
.navbar{
background:#004080;
padding:14px;
text-align:center;
}

.navbar a{
color:white;
margin:0 20px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}

/* ✅ MAIN CONTENT EXPANDS */
.container{
flex:1;   /* IMPORTANT */
padding:40px;
text-align:center;
}

.container h2{
color:#00264d;
margin-bottom:30px;
}

/* CARDS */
.cards{
display:flex;
justify-content:center;
gap:30px;
flex-wrap:wrap;
}

.card{
background:white;
width:240px;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
transition:0.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card h3{
margin-bottom:10px;
color:#004080;
}

.card p{
font-size:14px;
color:#555;
}

.card a{
display:inline-block;
margin-top:15px;
background:#004080;
color:white;
padding:10px 18px;
border-radius:5px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.card a:hover{
background:#00264d;
}

/* ✅ FOOTER ALWAYS BOTTOM */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:15px;
}

</style>

</head>

<body>

<div class="header">
<h1>College Management System</h1>
<p>K.H. Kabbur Institute of Engineering</p>
</div>

<div class="navbar">
<a href="StudentDashboard.jsp">Dashboard</a>
<a href="Profile.jsp">Profile</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Student Dashboard</h2>

<div class="cards">

<div class="card">
<h3>My Profile</h3>
<p>View and update your personal details.</p>
<a href="Profile.jsp">Open</a>
</div>

<div class="card">
<h3>Attendance</h3>
<p>Check your subject wise attendance.</p>
<a href="Attendance.jsp">Check</a>
</div>

<div class="card">
<h3>Marks</h3>
<p>View your internal and semester marks.</p>
<a href="Marks.jsp">View Marks</a>
</div>

<div class="card">
<h3>Courses</h3>
<p>See the subjects assigned for your semester.</p>
<a href="Courses.jsp">View Courses</a>
</div>

</div>

</div>

<div class="footer">
<p>&copy; 2026 K.H. Kabbur Institute of Engineering | College Management System</p>
</div>

</body>
</html>