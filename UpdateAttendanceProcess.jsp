<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Updating Attendance</title>

<style>
body{
margin:0;
font-family:'Segoe UI';
background:linear-gradient(to right,#eef2f7,#d6e4f0);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.card{
background:white;
padding:40px;
border-radius:12px;
box-shadow:0 10px 30px rgba(0,0,0,0.2);
text-align:center;
width:350px;
}

.success{
color:green;
font-size:20px;
font-weight:bold;
margin-bottom:15px;
}

.error{
color:red;
font-size:18px;
margin-bottom:15px;
}

button{
padding:10px 20px;
background:#004080;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
}

button:hover{
background:#00264d;
}
</style>
</head>

<body>

<div class="card">

<%
String id = request.getParameter("id");   // 🔥 IMPORTANT (PRIMARY KEY)
String student = request.getParameter("studentid");
String course = request.getParameter("courseid");
String date = request.getParameter("date");
String status = request.getParameter("status");

Connection con = null;
PreparedStatement ps = null;

try{

// ✅ VALIDATION
if(id==null || student==null || course==null || date==null || status==null ||
   id.isEmpty() || student.isEmpty() || course.isEmpty() || date.isEmpty() || status.isEmpty()){
%>
<div class="error">⚠️ All fields are required</div>
<%
return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

// ✅ FIXED QUERY (USING ID)
ps = con.prepareStatement(
"UPDATE attendance SET student_id=?, course_id=?, date=?, status=? WHERE id=?"
);

ps.setString(1, student);
ps.setString(2, course);
ps.setString(3, date);
ps.setString(4, status);
ps.setString(5, id);

int rows = ps.executeUpdate();

if(rows > 0){
%>

<div class="success">✅ Attendance Updated Successfully</div>

<%
}else{
%>

<div class="error">⚠️ No record found with this ID</div>

<%
}

}catch(Exception e){
%>

<div class="error">❌ Error: <%=e.getMessage()%></div>

<%
}finally{
try{
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

<br>

<button onclick="window.location='ViewAttendance.jsp'">
Back to Attendance
</button>

</div>

</body>
</html>