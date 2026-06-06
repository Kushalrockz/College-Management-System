```jsp
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

String name="";
String email="";
String contact="";
String dept="";
String designation="";

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM faculty WHERE faculty_id=?");

ps.setString(1,id);

ResultSet rs = ps.executeQuery();

if(rs.next()){
name = rs.getString("faculty_name");
email = rs.getString("email");
contact = rs.getString("contact");
dept = rs.getString("department");
designation = rs.getString("designation");
}

con.close();

}
catch(Exception e){
out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Faculty</title>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#1e3c72,#2a5298);
}

/* HEADER */

.header{
background:#00264d;
color:white;
padding:18px;
text-align:center;
font-size:24px;
font-weight:bold;
}

/* NAVBAR */

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

/* FORM CARD */

.container{
width:420px;
margin:60px auto;
background:white;
padding:35px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
animation:fadeIn 0.5s ease;
}

h2{
text-align:center;
color:#004080;
margin-bottom:25px;
}

label{
font-weight:bold;
font-size:14px;
color:#333;
}

input{
width:100%;
padding:11px;
margin-top:5px;
margin-bottom:15px;
border-radius:6px;
border:1px solid #ccc;
font-size:14px;
transition:0.3s;
}

input:focus{
border-color:#004080;
outline:none;
box-shadow:0 0 6px rgba(0,64,128,0.5);
}

/* BUTTON */

button{
width:100%;
padding:12px;
background:linear-gradient(90deg,#004080,#0066cc);
color:white;
border:none;
border-radius:6px;
font-size:16px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:linear-gradient(90deg,#00264d,#004080);
transform:scale(1.03);
}

/* FOOTER */

.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
margin-top:40px;
}

/* ANIMATION */

@keyframes fadeIn{
from{
opacity:0;
transform:translateY(20px);
}
to{
opacity:1;
transform:translateY(0);
}
}

</style>
</head>

<body>

<div class="header">
College Management System
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">🏠 Dashboard</a>
<a href="ViewFaculty.jsp">👨‍🏫 Faculty</a>
<a href="Login.html">🔐 Logout</a>
</div>

<div class="container">

<h2>✏ Edit Faculty</h2>

<form action="UpdateFaculty.jsp" method="post">

<label>Faculty ID</label>
<input type="text" name="faculty_id" value="<%=id%>" readonly>

<label>Faculty Name</label>
<input type="text" name="faculty_name" value="<%=name%>" required>

<label>Email</label>
<input type="email" name="email" value="<%=email%>" required>

<label>Contact</label>
<input type="text" name="contact" value="<%=contact%>" required>

<label>Department</label>
<input type="text" name="department" value="<%=dept%>" required>

<label>Designation</label>
<input type="text" name="designation" value="<%=designation%>" required>

<button type="submit">Update Faculty</button>

</form>

</div>

<div class="footer">
© 2026 College Management System
</div>

</body>
</html>
```


