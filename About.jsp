<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>About - KHKIE</title>

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


.header{
background:#00264d;
color:white;
text-align:center;
padding:25px;
}

.header h1{
font-size:30px;
}

.header p{
font-size:16px;
margin-top:5px;
}


.navbar{
background:#004080;
padding:14px;
text-align:center;
}

.navbar a{
color:white;
text-decoration:none;
margin:0 20px;
font-weight:bold;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}


.container{
width:85%;
margin:auto;
margin-top:40px;
}


.section{
background:white;
padding:30px;
margin-bottom:30px;
border-radius:8px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
}

.section h2{
color:#00264d;
margin-bottom:15px;
}

.section p{
font-size:16px;
line-height:1.6;
color:#333;
}


.vm-container{
display:flex;
gap:30px;
flex-wrap:wrap;
}

.vm-box{
flex:1;
background:white;
padding:25px;
border-radius:8px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
}


.dept-container{
display:flex;
gap:25px;
flex-wrap:wrap;
margin-top:20px;
}

.dept{
background:white;
padding:20px;
width:200px;
text-align:center;
border-radius:8px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
transition:0.3s;
}

.dept:hover{
transform:translateY(-5px);
}

.dept h3{
color:#004080;
}


.footer{
background:#00264d;
color:white;
text-align:center;
padding:15px;
margin-top:40px;
}

</style>
</head>

<body>

<div class="header">
<h1>College Management System</h1>
<p>K.H. Kabbur Institute of Engineering</p>
</div>

<div class="container">

<div class="section">
<h2>About the Institution</h2>
<p>
K.H. Kabbur Institute of Engineering is one of the leading technical institutions
committed to excellence in engineering education. The institute focuses on
providing quality education, promoting research activities and developing
innovative skills among students.
</p>

<p>
The College Management System is a digital platform developed to simplify
academic management such as student records, faculty management, attendance
tracking and course management. This system helps improve efficiency,
transparency and accessibility of information within the institution.
</p>
</div>

<div class="vm-container">

<div class="vm-box">
<h2>Our Vision</h2>
<p>
To become a center of excellence in technical education by producing
competent engineers with strong ethical values and innovative thinking
to contribute to society.
</p>
</div>

<div class="vm-box">
<h2>Our Mission</h2>
<p>
• Provide high quality engineering education. <br>
• Encourage research and innovation. <br>
• Develop leadership and problem-solving skills. <br>
• Prepare students for global technological challenges.
</p>
</div>

</div>

<div class="section">
<h2>Departments</h2>

<div class="dept-container">

<div class="dept">
<h3>Computer Science Engineering</h3>
</div>

<div class="dept">
<h3>Mechatronics Engineering</h3>
</div>

<div class="dept">
<h3>Civil Engineering</h3>
</div>

<div class="dept">
<h3>Electrical & Electronics Engineering</h3>
</div>

<div class="dept">
<h3>Electronics & Communication Engineering</h3>
</div>

<div class="dept">
<h3>Automobiles Engineering</h3>
</div>

<div class="dept">
<h3>Commercial Practice</h3>
</div>

</div>

</div>

</div>

<div class="footer">
<p>&copy; 2026 KHKIE College Management System | K.H. Kabbur Institute of Engineering</p>
</div>

</body>
</html>

