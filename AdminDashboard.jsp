<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
*{
    box-sizing:border-box;
}

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
    min-height:100vh;
    display:flex;
    flex-direction:column;
}

.header{
    background:#00264d;
    color:white;
    padding:20px;
    text-align:center;
}

.header h1{
    margin:0;
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
    font-size:15px;
}

.navbar a:hover{
    color:#ffd700;
}

.page{
    flex:1;
    display:flex;
    flex-direction:column;
}

.container{
    padding:40px;
    text-align:center;
    flex:1;
}

.container h2{
    color:#00264d;
    margin-bottom:30px;
}

.dashboard{
    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:30px;
}

.card{
    background:white;
    width:230px;
    padding:25px;
    border-radius:10px;
    box-shadow:0 6px 18px rgba(0,0,0,0.2);
    transition:0.3s;
    cursor:pointer;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

.card h3{
    color:#004080;
    margin-bottom:10px;
}

.card p{
    font-size:14px;
    color:#555;
}

.footer{
    background:#00264d;
    color:white;
    text-align:center;
    padding:12px;
    margin-top:auto;
}
</style>

</head>

<body>

<div class="page">

    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>

    <div class="navbar">
        <a href="AdminDashboard.jsp">Dashboard</a>
        <a href="Login.html">Logout</a>
    </div>

    <div class="container">
        <h2>Admin Control Panel</h2>

        <div class="dashboard">

            <a href="ManageStudents.jsp" style="text-decoration:none;">
                <div class="card">
                    <h3>Manage Students</h3>
                    <p>Add, edit and view student records.</p>
                </div>
            </a>

            <a href="ManageCourses.jsp" style="text-decoration:none;">
                <div class="card">
                    <h3>Manage Courses</h3>
                    <p>Create and manage course details.</p>
                </div>
            </a>

            <a href="ManageFaculty.jsp" style="text-decoration:none;">
                <div class="card">
                    <h3>Manage Faculty</h3>
                    <p>Add and manage faculty members.</p>
                </div>
            </a>

            <a href="ManageAttendance.jsp" style="text-decoration:none;">
                <div class="card">
                    <h3>Attendance</h3>
                    <p>Track and update student attendance.</p>
                </div>
            </a>

            <a href="ManageMarks.jsp" style="text-decoration:none;">
                <div class="card">
                    <h3>Marks Management</h3>
                    <p>Enter and update student marks.</p>
                </div>
            </a>

        </div>
    </div>

    <div class="footer">
        &copy; 2026 KHKIE College Management System
    </div>

</div>

</body>
</html>