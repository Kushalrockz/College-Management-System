<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Staff Dashboard</title>

<style>
html, body{
height:100%;
}

body{
margin:0;
font-family:Arial;
background:#f4f6f9;
display:flex;
flex-direction:column;
}

.header{
background:#003366;
color:white;
padding:20px;
text-align:center;
}

.header h1{
margin:0;
font-size:26px;
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
font-size:15px;
}

.navbar a:hover{
text-decoration:underline;
}

.container{
padding:40px;
flex:1;
}

.grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:25px;
}

.card{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 12px rgba(0,0,0,0.1);
text-align:center;
transition:0.3s;
}

.card:hover{
transform:translateY(-5px);
box-shadow:0 6px 18px rgba(0,0,0,0.2);
}

.card h3{
margin:10px 0;
color:#003366;
}

.card p{
font-size:14px;
color:#666;
margin-bottom:20px;
}

.card a{
background:#0059b3;
color:white;
padding:10px 18px;
text-decoration:none;
border-radius:6px;
font-size:14px;
}

.card a:hover{
background:#003366;
}

.stats{
display:flex;
justify-content:space-around;
margin-bottom:40px;
flex-wrap:wrap;
}

.stat-box{
background:white;
padding:20px 30px;
border-radius:8px;
box-shadow:0 2px 8px rgba(0,0,0,0.1);
text-align:center;
margin:10px;
min-width:180px;
}

.stat-box h2{
margin:0;
color:#0059b3;
font-size:30px;
}

.stat-box p{
margin:5px 0 0;
color:#666;
}

.footer{
background:#00264d;
color:white;
text-align:center;
padding:12px;
}
</style>
</head>

<body>

<%
String staffEmail = (String)session.getAttribute("user");

if(staffEmail == null){
    response.sendRedirect("Login.html");
    return;
}

int myCourses = 0;
int totalStudents = 0;
int attendancePercent = 0;
String staffDept = "";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

    ps = con.prepareStatement("SELECT department FROM faculty WHERE email=? LIMIT 1");
    ps.setString(1, staffEmail);
    rs = ps.executeQuery();

    if(rs.next()){
        staffDept = rs.getString("department");
    }

    if(rs != null) rs.close();
    if(ps != null) ps.close();

    ps = con.prepareStatement("SELECT COUNT(*) FROM courses WHERE LOWER(department)=LOWER(?)");
    ps.setString(1, staffDept);
    rs = ps.executeQuery();

    if(rs.next()){
        myCourses = rs.getInt(1);
    }

    if(rs != null) rs.close();
    if(ps != null) ps.close();

    ps = con.prepareStatement("SELECT COUNT(*) FROM students WHERE LOWER(course)=LOWER(?)");
    ps.setString(1, staffDept);
    rs = ps.executeQuery();

    if(rs.next()){
        totalStudents = rs.getInt(1);
    }

    if(rs != null) rs.close();
    if(ps != null) ps.close();

    ps = con.prepareStatement(
        "SELECT COUNT(*) AS total, " +
        "SUM(CASE WHEN status='Present' THEN 1 ELSE 0 END) AS presentCount " +
        "FROM attendance"
    );

    rs = ps.executeQuery();

    if(rs.next()){
        int total = rs.getInt("total");
        int present = rs.getInt("presentCount");

        if(total > 0){
            attendancePercent = (present * 100) / total;
        }
    }

}catch(Exception e){
    out.println("<p style='color:red;text-align:center;'>Dashboard Error: "+e.getMessage()+"</p>");
}finally{
    try{
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    }catch(Exception e){}
}
%>

<div class="header">
<h1>Staff Dashboard</h1>
</div>

<div class="navbar">
<a href="StaffDashboard.jsp">Dashboard</a>
<a href="StaffCourses.jsp">Courses</a>
<a href="StaffAttendance.jsp">Attendance</a>
<a href="AddMarks.jsp">Marks</a>
<a href="StaffReports.jsp">Reports</a>
<a href="Logout.jsp">Logout</a>
</div>

<div class="container">

<div class="stats">

<div class="stat-box">
<h2><%=myCourses%></h2>
<p>My Courses</p>
</div>

<div class="stat-box">
<h2><%=totalStudents%></h2>
<p>Total Students</p>
</div>

<div class="stat-box">
<h2><%=attendancePercent%>%</h2>
<p>Attendance Present</p>
</div>

</div>

<div class="grid">

<div class="card">
<h3>My Profile</h3>
<p>View your staff profile details</p>
<a href="StaffProfile.jsp">Open</a>
</div>

<div class="card">
<h3>My Courses</h3>
<p>View courses assigned to your department</p>
<a href="StaffCourses.jsp">Open</a>
</div>

<div class="card">
<h3>Attendance</h3>
<p>Mark and manage student attendance</p>
<a href="StaffAttendance.jsp">Open</a>
</div>

<div class="card">
<h3>Enter Marks</h3>
<p>Add or update student marks</p>
<a href="AddMarks.jsp">Open</a>
</div>

<div class="card">
<h3>Reports</h3>
<p>Generate attendance and marks reports</p>
<a href="StaffReports.jsp">Open</a>
</div>

</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>