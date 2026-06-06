<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact - KHKIE</title>

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
}


.contact-container{
display:flex;
gap:30px;
flex-wrap:wrap;
justify-content:center;
margin-bottom:40px;
}

.contact-card{
background:white;
padding:25px;
width:260px;
text-align:center;
border-radius:8px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
transition:0.3s;
}

.contact-card:hover{
transform:translateY(-6px);
}

.contact-card h3{
color:#004080;
margin-bottom:10px;
}

.form-container{
background:white;
padding:30px;
border-radius:8px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
width:60%;
margin:auto;
}

.form-container h2{
color:#00264d;
margin-bottom:20px;
text-align:center;
}

input, textarea{
width:100%;
padding:10px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:5px;
font-size:14px;
}

button{
background:#004080;
color:white;
padding:10px 20px;
border:none;
border-radius:5px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#00264d;
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

<div class="navbar">
<a href="index.jsp">Home</a>
<a href="departments.jsp">Departments</a>
</div>

<div class="container">

<h2 style="text-align:center; margin-bottom:30px; color:#00264d;">Contact Information</h2>

<div class="contact-container">

<div class="contact-card">
<h3>Email</h3>
<p>khkie202@yahoo.com</p>
</div>

<div class="contact-card">
<h3>Phone</h3>
<p>+91 8362468654</p>
</div>

<div class="contact-card">
<h3>Address</h3>
<p>C2R9+P8R, 1st Cross Rd, Daneshwari Nagar, Vidyagiri, Dharwad, Karnataka 580001, India</p>
</div>

</div>

<div class="form-container">

<h2>Send Us a Message</h2>

<form>

<input type="text" placeholder="Your Name" required>

<input type="email" placeholder="Your Email" required>

<textarea rows="5" placeholder="Your Message"></textarea>

<button type="submit">Send Message</button>

</form>

</div>

</div>


<div class="footer">
<p>&copy; 2026 KHKIE College Management System | K.H. Kabbur Institute of Engineering</p>
</div>

</body>
</html>

