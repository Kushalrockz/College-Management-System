<!DOCTYPE html>
<html>
<head>
<title>College Management System</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, Helvetica, sans-serif;
}

body{
background:#f4f6f9;
}

/* HEADER */

.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
}

.header h1{
font-size:32px;
}

.header p{
margin-top:5px;
font-size:15px;
color:#d9e6ff;
}

/* NAVBAR */

.navbar{
background:linear-gradient(90deg,#00264d,#004080,#0059b3);
display:flex;
justify-content:space-between;
align-items:center;
padding:15px 70px;
position:sticky;
top:0;
z-index:1000;
box-shadow:0 4px 15px rgba(0,0,0,0.2);
}

/* LOGO */

.logo{
font-size:22px;
font-weight:bold;
color:white;
letter-spacing:1px;
}

/* NAV LINKS */

.nav-links{
display:flex;
align-items:center;
gap:35px;
}

.nav-links a{
text-decoration:none;
color:white;
font-weight:600;
position:relative;
transition:0.3s;
}

/* HOVER UNDERLINE */

.nav-links a::after{
content:"";
position:absolute;
width:0%;
height:2px;
background:#ffd700;
left:0;
bottom:-6px;
transition:0.3s;
}

.nav-links a:hover::after{
width:100%;
}

.nav-links a:hover{
color:#ffd700;
}

/* DROPDOWN */

.dropdown{
position:relative;
}

.dropdown-content{
display:none;
position:absolute;
top:35px;
background:white;
min-width:160px;
box-shadow:0 6px 15px rgba(0,0,0,0.2);
border-radius:6px;
overflow:hidden;
}

.dropdown-content a{
color:#333;
padding:12px 16px;
display:block;
text-decoration:none;
font-weight:500;
}

.dropdown-content a:hover{
background:#f2f2f2;
color:#004080;
}

.dropdown:hover .dropdown-content{
display:block;
}

/* HERO */

.hero{
height:520px;

background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),
url('https://dl.dropboxusercontent.com/s/ihndtlyyjcqe0ot/jss.k.h.kabbur%20institute%20of%20engineering,%20dharwad%20campus%20(DB).jpg');

background-size:cover;
background-position:center;
background-repeat:no-repeat;
background-attachment:fixed;

display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
text-align:center;

color:white;
padding:20px;
}

.hero h2{
font-size:42px;
margin-bottom:15px;
}

.hero p{
font-size:18px;
width:60%;
}

.hero a{
margin-top:25px;
padding:12px 28px;
background:#ffcc00;
color:black;
font-weight:bold;
text-decoration:none;
border-radius:5px;
transition:0.3s;
}

.hero a:hover{
background:white;
}

/* STATS */

.stats{
display:flex;
justify-content:center;
gap:40px;
padding:50px 20px;
background:white;
flex-wrap:wrap;
}

.stat-box{
background:#004080;
color:white;
padding:25px 40px;
border-radius:8px;
text-align:center;
box-shadow:0 6px 15px rgba(0,0,0,0.2);
transition:0.3s;
}

.stat-box:hover{
transform:translateY(-5px);
}

.stat-box h2{
font-size:36px;
margin-bottom:5px;
}

.stat-box p{
font-size:14px;
}

/* FEATURES */

.features{
padding:60px 20px;
text-align:center;
}

.features h2{
margin-bottom:15px;
font-size:30px;
color:#00264d;
}

.features p{
color:#666;
margin-bottom:40px;
}

.feature-container{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
gap:25px;
max-width:1100px;
margin:auto;
}

.feature{
padding:28px;
border-radius:10px;
color:#00264d;
box-shadow:0 8px 20px rgba(0,0,0,0.08);
transition:0.3s;
border-left:6px solid #004080;
}

.feature:hover{
transform:translateY(-8px);
}

/* MODULE COLORS */

.feature1{background:#e8f1ff;}
.feature2{background:#e6f7ff;}
.feature3{background:#eafaf1;}
.feature4{background:#fff4e6;}
.feature5{background:#f3e8ff;}
.feature6{background:#ffeaea;}

.feature h3{
margin-bottom:10px;
font-size:20px;
color:#00264d;
}

.feature p{
font-size:14px;
line-height:1.6;
color:#444;
}

/* FOOTER */

.footer{
background:#00264d;
color:white;
text-align:center;
padding:18px;
margin-top:40px;
font-size:14px;
}

</style>
</head>

<body>

<!-- HEADER -->

<div class="header">
<h1>College Management System</h1>
<p>Academic Management Portal</p>
</div>

<!-- NAVBAR -->
<div class="navbar">

<div class="logo">
KHKIE Portal
</div>

<div class="nav-links">

<a href="index.jsp">Home</a>

<div class="dropdown">
<a href="Login.html">Login</a>

<div class="dropdown-content">
<a href="StudentLogin.html">Student Login</a>
<a href="StaffLogin.html">Staff Login</a>
<a href="AdminLogin.html">Admin Login</a>
</div>

</div>

<a href="UserRegistration.html">Register</a>
<a href="About.jsp">About</a>
<a href="Contact.jsp">Contact</a>

</div>

</div>

<!-- HERO -->

<div class="hero">
<h2>Integrated Academic Management Platform</h2>
<p>
A centralized digital platform designed to streamline academic administration,
enhance faculty productivity and provide students with seamless access to
academic resources, attendance tracking and performance analytics.
</p>

<a href="Login.html">Login to Dashboard</a>
</div>

<div class="stats">

<div class="stat-box">
<h2>1200+</h2>
<p>Students Enrolled</p>
</div>

<div class="stat-box">
<h2>85+</h2>
<p>Faculty Members</p>
</div>

<div class="stat-box">
<h2>40+</h2>
<p>Academic Courses</p>
</div>

<div class="stat-box">
<h2>95%</h2>
<p>Attendance Tracking</p>
</div>

</div>


<div class="features">

<h2>Academic Management Platform</h2>

<p>
A centralized academic management platform designed to streamline 
administration, faculty activities and student learning processes.
</p>

<div class="feature-container">

<div class="feature feature1">
<h3>Academic Records</h3>
<p>
Maintain centralized student academic profiles including enrollment
details, semester performance and academic history.
</p>
</div>

<div class="feature feature2">
<h3>Faculty Workspace</h3>
<p>
Dedicated dashboard for faculty members to manage courses,
upload marks and track attendance.
</p>
</div>

<div class="feature feature3">
<h3>Attendance Intelligence</h3>
<p>
Digitally record attendance and generate automated reports
to analyze classroom engagement.
</p>
</div>

<div class="feature feature4">
<h3>Course & Curriculum</h3>
<p>
Organize academic programs, subjects and semesters
within a unified management system.
</p>
</div>

<div class="feature feature5">
<h3>Performance Analytics</h3>
<p>
Generate academic reports and insights to monitor
student performance and outcomes.
</p>
</div>

<div class="feature feature6">
<h3>Administrative Control</h3>
<p>
Comprehensive admin panel for managing students,
faculty and institutional records.
</p>
</div>

</div>

</div>


<div class="footer">
<p>&copy; 2026 KHKIE College Management System | Developed for Academic Project</p>
</div>

</body>
</html>

