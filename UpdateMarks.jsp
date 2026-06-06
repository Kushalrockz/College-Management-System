<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
String id = request.getParameter("id");

if(id == null || id.trim().equals("")){
%>
<script>
alert("Invalid Request!");
window.location="ViewMarks.jsp";
</script>
<%
return;
}

Connection con = null;
PreparedStatement ps = null;
PreparedStatement ps2 = null;
ResultSet rs = null;

String marksVal = "";
String examVal = "";

try{

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

/* ✅ UPDATE FIRST (clean flow) */
if(request.getParameter("update") != null){

    String marks = request.getParameter("marks");
    String exam = request.getParameter("exam");

    if(marks==null || marks.trim().equals("") ||
       exam==null || exam.trim().equals("")){
%>
<script>
alert("All fields required!");
</script>
<%
    } else {

        int marksInt = 0;
        try{
            marksInt = Integer.parseInt(marks);
        }catch(Exception ex){
%>
<script>
alert("Invalid marks value!");
</script>
<%
            return;
        }

        ps2 = con.prepareStatement(
        "UPDATE marks SET marks=?, exam_type=? WHERE id=?"
        );

        ps2.setInt(1, marksInt);
        ps2.setString(2, exam);
        ps2.setInt(3, Integer.parseInt(id));

        int i = ps2.executeUpdate();

        if(i > 0){
            response.sendRedirect("ViewMarks.jsp");
            return;
        } else {
%>
<script>
alert("Update failed!");
</script>
<%
        }
    }
}

/* ✅ FETCH DATA */
ps = con.prepareStatement("SELECT * FROM marks WHERE id=?");
ps.setInt(1, Integer.parseInt(id));

rs = ps.executeQuery();

if(rs.next()){
    marksVal = rs.getString("marks");
    examVal = rs.getString("exam_type");
}else{
%>
<script>
alert("Record not found!");
window.location="ViewMarks.jsp";
</script>
<%
return;
}

}catch(Exception e){
%>
<script>
alert("Error: <%=e.getMessage()%>");
</script>
<%
}finally{
try{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(ps2!=null) ps2.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Marks</title>

<style>
body{
margin:0;
font-family:'Segoe UI';
background:#eef2f7;
display:flex;
flex-direction:column;
height:100vh;
}

.header{
background:#00264d;
color:white;
padding:18px;
text-align:center;
font-size:22px;
}

.container{
width:400px;
margin:60px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.2);
flex:1;
}

h2{
text-align:center;
color:#003366;
}

input{
width:100%;
padding:10px;
margin-top:10px;
border:1px solid #ccc;
border-radius:5px;
}

button{
margin-top:20px;
width:100%;
padding:10px;
background:#0059b3;
color:white;
border:none;
border-radius:5px;
cursor:pointer;
}

button:hover{
background:#003366;
}

.footer{
background:#00264d;
color:white;
text-align:center;
padding:10px;
}
</style>

</head>

<body>

<div class="header">Update Marks</div>

<div class="container">

<h2>Edit Marks</h2>

<form method="post">

<label>Marks</label>
<input type="number" name="marks" value="<%=marksVal%>" required>

<label>Exam Type</label>
<input type="text" name="exam" value="<%=examVal%>" required>

<button type="submit" name="update">Update</button>

</form>

</div>

<div class="footer">
© 2026 KHKIE College Management System
</div>

</body>
</html>