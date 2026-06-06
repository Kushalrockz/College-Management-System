<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Saving Marks...</title>

<style>
body{
font-family:Arial;
background:#f4f6f9;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.box{
background:white;
padding:30px 40px;
border-radius:10px;
box-shadow:0 4px 15px rgba(0,0,0,0.2);
text-align:center;
width:350px;
}

.success{
color:green;
font-size:18px;
font-weight:bold;
}

.error{
color:red;
font-size:16px;
}

.btn{
margin-top:20px;
display:inline-block;
padding:10px 20px;
background:#0059b3;
color:white;
text-decoration:none;
border-radius:5px;
}
</style>

</head>
<body>

<div class="box">

<%

// ✅ RUN ONLY AFTER FORM SUBMIT
if(request.getParameter("student") != null){

Connection con=null;
PreparedStatement ps=null;

String student = request.getParameter("student");
String course  = request.getParameter("course");
String marks   = request.getParameter("marks");
String exam    = request.getParameter("exam_type");

try{

// ✅ VALIDATION
if(student.equals("") || course.equals("") || marks.equals("") || exam.equals("")){
%>

<div class="error">All fields are required!</div>
<a class="btn" href="AddMarks.jsp">Go Back</a>

<%
}else{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps = con.prepareStatement(
"INSERT INTO marks(student_id, course_id, marks, exam_type) VALUES(?,?,?,?)"
);

ps.setString(1, student);
ps.setString(2, course);
ps.setInt(3, Integer.parseInt(marks));
ps.setString(4, exam);

int rows = ps.executeUpdate();

if(rows>0){
%>

<div class="success">Marks Saved Successfully!</div>

<script>
setTimeout(function(){
window.location="ViewMarks.jsp";
},2000);
</script>

<%
}else{
%>

<div class="error">Failed to Save Marks</div>
<a class="btn" href="AddMarks.jsp">Try Again</a>

<%
}
}

}catch(Exception e){
%>

<div class="error">Error: <%=e.getMessage()%></div>
<a class="btn" href="AddMarks.jsp">Go Back</a>

<%
}finally{
try{
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}

} else {
%>

<!-- ✅ IF OPENED DIRECTLY -->
<div class="error">Invalid Access</div>
<a class="btn" href="AddMarks.jsp">Go to Add Marks</a>

<%
}
%>

</div>

</body>
</html>