<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Departments - College Management System</title>

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
margin-top:5px;
font-size:15px;
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
text-align:center;
}

.container h2{
color:#00264d;
margin-bottom:30px;
}


.dept-container{
display:flex;
flex-wrap:wrap;
justify-content:center;
gap:30px;
}

.dept-card{
background:white;
width:260px;
border-radius:8px;
box-shadow:0 4px 12px rgba(0,0,0,0.2);
overflow:hidden;
transition:0.3s;
}

.dept-card:hover{
transform:translateY(-8px);
}

.dept-card img{
width:100%;
height:160px;
object-fit:cover;
}

.dept-content{
padding:20px;
}

.dept-content h3{
color:#004080;
margin-bottom:10px;
}

.dept-content p{
font-size:14px;
color:#555;
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

<h2>Our Departments</h2>

<div class="dept-container">

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1518770660439-4636190af475">
<div class="dept-content">
<h3>Computer Science Engineering</h3>
<p>Focuses on software development, programming, AI, and modern computing technologies.</p>
</div>
</div>

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1581091870627-3a4b3b1b89c3">
<div class="dept-content">
<h3>Mechanical Engineering</h3>
<p>Deals with design, manufacturing, and maintenance of mechanical systems.</p>
</div>
</div>

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1555617117-08fda3d31c70">
<div class="dept-content">
<h3>Electronics Engineering</h3>
<p>Studies electronic circuits, communication systems and embedded systems used in modern electronic devices.</p>
</div>
</div>

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1581092580497-e0d23cbdf1dc">
<div class="dept-content">
<h3>Electronics & Communication Engineering</h3>
<p>Focuses on communication technologies, signal processing, networking systems and modern wireless technologies.</p>
</div>
</div>

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1507679799987-c73779587ccf">
<div class="dept-content">
<h3>Commercial Practice</h3>
<p>Provides knowledge in business communication, office management, accounting and modern administrative practices.</p>
</div>
</div>

<div class="dept-card">
<img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70">
<div class="dept-content">
<h3>Automobile Engineering</h3>
<p>Focuses on design, development and maintenance of automobiles including engines, vehicles and transportation technology.</p>
</div>
</div>
</div>

</div>

</div>

<div class="footer">
<p>&copy; 2026 KHKIE College Management System | K.H. Kabbur Institute of Engineering</p>
</div>

</body>
</html>

