<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
/* ✅ SESSION CHECK */
if(session.getAttribute("user") == null){
    response.sendRedirect("Login.html");
    return;
}

/* ✅ FORM LOGIC */
String message = "";

if(request.getParameter("addstudent") != null){

    String student_id = request.getParameter("student_id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String contact = request.getParameter("contact");
    String course = request.getParameter("course");
    String semester = request.getParameter("semester");

    if(student_id==null || student_id.trim().isEmpty() ||
       name==null || name.trim().isEmpty() ||
       email==null || email.trim().isEmpty() ||
       password==null || password.trim().isEmpty() ||
       contact==null || contact.trim().isEmpty() ||
       course==null || course.trim().isEmpty() ||
       semester==null || semester.trim().isEmpty()){

        message = "<p style='color:red;text-align:center;'>All fields are required!</p>";
    }
    else{

        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

            PreparedStatement ps = con.prepareStatement(
            "INSERT INTO students(student_id,name,email,password,contact,course,semester) VALUES (?,?,?,?,?,?,?)");

            ps.setString(1, student_id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, contact);
            ps.setString(6, course);
            ps.setString(7, semester);

            int i = ps.executeUpdate();

            if(i > 0){
                message = "<script>alert('Student Added Successfully');window.location='AddStudent.jsp';</script>";
            }else{
                message = "<p style='color:red;text-align:center;'>Failed to add student</p>";
            }

            ps.close();
            con.close();

        }catch(Exception e){
            message = "<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>";
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Student - Admin Panel</title>

<style>

html,body{
height:100%;
margin:0;
font-family:Arial;
background:#f4f6f9;
display:flex;
flex-direction:column;
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
text-decoration:none;
margin:0 20px;
font-weight:bold;
}

.navbar a:hover{
color:#ffd700;
}

.container{
flex:1;
display:flex;
justify-content:center;
align-items:center;
}

.form-box{
background:white;
padding:35px;
width:450px;
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

.form-box h2{
text-align:center;
margin-bottom:20px;
color:#00264d;
}

label{
font-weight:bold;
}

input, select{
width:100%;
padding:10px;
margin:10px 0;
border:1px solid #ccc;
border-radius:5px;
}

button{
width:100%;
padding:12px;
background:#004080;
color:white;
border:none;
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
padding:15px;
}

</style>
</head>

<body>

<div class="header">
<h1>Admin Panel - College Management System</h1>
</div>

<div class="navbar">
<a href="AdminDashboard.jsp">Dashboard</a>
<a href="ManageStudents.jsp">Manage Students</a>
<a href="Login.html">Logout</a>
</div>

<div class="container">
<div class="form-box">

<h2>Add Student</h2>

<%=message%>

<form method="post">

<label>Student ID</label>
<input type="text" name="student_id" required>

<label>Student Name</label>
<input type="text" name="name" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Password</label>
<input type="password" name="password" required>

<label>Contact</label>
<input type="text" name="contact" required>

<label>Course</label>
<input type="text" name="course" required>

<label>Semester</label>
<select name="semester" required>
<option value="">Select Semester</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
</select>

<button type="submit" name="addstudent">Add Student</button>

</form>

</div>
</div>

<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>