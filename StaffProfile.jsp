<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Staff Profile</title>

<style>
html, body{
height:100%;
}

body{
margin:0;
font-family:'Segoe UI';
background:linear-gradient(to right,#eef2f7,#d9e6f2);
display:flex;
flex-direction:column;
}

.header{
background:#00264d;
color:white;
padding:20px;
text-align:center;
font-size:24px;
font-weight:bold;
}

.container{
width:650px;
margin:40px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.15);
flex:1;
}

h2{
text-align:center;
color:#003366;
margin-bottom:20px;
}

.profile-row{
display:flex;
justify-content:space-between;
padding:12px 15px;
margin:10px 0;
background:#f7f9fc;
border-radius:8px;
}

.label{
font-weight:600;
color:#333;
}

.value{
color:#004080;
}

.back-btn{
text-align:center;
margin-top:25px;
}

.back-btn a{
background:#004080;
color:white;
padding:10px 25px;
text-decoration:none;
border-radius:6px;
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

<div class="header">Staff Profile</div>

<div class="container">

<h2>My Details</h2>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{

String staffUser=(String)session.getAttribute("user");

if(staffUser==null){
    response.sendRedirect("Login.html");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps=con.prepareStatement("SELECT * FROM faculty WHERE TRIM(email)=?");
ps.setString(1, staffUser.trim());

rs=ps.executeQuery();

if(rs.next()){
%>

<div class="profile-row">
<div class="label">Faculty Name</div>
<div class="value"><%=rs.getString("faculty_name")%></div>
</div>

<div class="profile-row">
<div class="label">Email</div>
<div class="value"><%=rs.getString("email")%></div>
</div>

<div class="profile-row">
<div class="label">Contact</div>
<div class="value"><%=rs.getString("contact")%></div>
</div>

<div class="profile-row">
<div class="label">Department</div>
<div class="value"><%=rs.getString("department")%></div>
</div>

<div class="profile-row">
<div class="label">Designation</div>
<div class="value"><%=rs.getString("designation")%></div>
</div>

<%
}else{
out.println("<p style='text-align:center;color:red;'>No profile found</p>");
}

}catch(Exception e){
out.println("<p style='color:red;text-align:center;'>"+e.getMessage()+"</p>");
}finally{
try{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

<div class="back-btn">
<a href="StaffDashboard.jsp">Back to Dashboard</a>
</div>

</div>

<div class="footer">
&copy; 2026 KHKIE College Management System
</div>

</body>
</html>