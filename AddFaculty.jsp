<!DOCTYPE html>
<html>
<head>
<title>Add Faculty</title>

<style>

*{
box-sizing:border-box;
}

html, body{
height:100%;
}

/* ✅ FLEX LAYOUT */
body{
margin:0;
font-family:Arial, sans-serif;
background:#eef2f7;

display:flex;
flex-direction:column;
}

/* HEADER */
.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
font-size:24px;
font-weight:bold;
letter-spacing:1px;
}

/* NAVBAR */
.navbar{
background:#004080;
padding:12px;
text-align:center;
}

.navbar a{
color:white;
margin:0 18px;
text-decoration:none;
font-weight:bold;
font-size:15px;
transition:0.3s;
}

.navbar a:hover{
color:#ffd700;
}

/* CONTAINER */
.container{
width:420px;
margin:50px auto;
background:white;
padding:35px;
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.15);

/* ✅ PUSH FOOTER DOWN */
flex:1;
}

/* TITLE */
h2{
text-align:center;
color:#004080;
margin-bottom:25px;
}

/* LABELS */
label{
font-weight:bold;
font-size:14px;
color:#333;
}

/* INPUT */
input{
width:100%;
padding:11px;
margin-top:6px;
margin-bottom:16px;
border:1px solid #ccc;
border-radius:6px;
font-size:14px;
transition:0.3s;
}

input:focus{
border-color:#004080;
outline:none;
box-shadow:0 0 5px rgba(0,64,128,0.4);
}

/* BUTTON */
button{
width:100%;
padding:12px;
background:#004080;
color:white;
border:none;
border-radius:6px;
font-size:16px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#00264d;
transform:scale(1.02);
}

/* FOOTER */
.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
font-size:13px;
}

</style>

</head>

<body>

<div class="header">
College Management System
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ViewFaculty.jsp">Faculty</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">

<h2>Add Faculty</h2>

<form action="AddFacultyProcess.jsp" method="post">

<label>Faculty ID</label>
<input type="text" name="faculty_id" required>

<label>Faculty Name</label>
<input type="text" name="faculty_name" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Contact</label>
<input type="text" name="contact" required>

<label>Department</label>
<input type="text" name="department" required>

<label>Designation</label>
<input type="text" name="designation" required>

<button type="submit">Add Faculty</button>

</form>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System | Admin Panel
</div>

</body>
</html>