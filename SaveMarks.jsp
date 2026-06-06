<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
Connection con=null;
PreparedStatement ps=null;

String student = request.getParameter("student_id");
String course  = request.getParameter("course_id");
String status  = request.getParameter("status");

try{

// ✅ VALIDATION
if(student==null || course==null || status==null ||
   student.equals("") || course.equals("") || status.equals("")){
%>

<script>
alert("All fields are required!");
window.location="Attendance.jsp";
</script>

<%
}else{

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

// ✅ INSERT QUERY
ps = con.prepareStatement(
"INSERT INTO attendance(student_id, course_id, date, status) VALUES(?,?,CURDATE(),?)"
);

ps.setString(1, student);
ps.setString(2, course);
ps.setString(3, status);

int rows = ps.executeUpdate();

if(rows>0){
%>

<script>
alert("Attendance Saved Successfully!");
window.location="Attendance.jsp";
</script>

<%
}else{
%>

<script>
alert("Failed to Save Attendance!");
window.location="Attendance.jsp";
</script>

<%
}
}

}catch(Exception e){
%>

<script>
alert("Error: <%=e.getMessage()%>");
window.location="Attendance.jsp";
</script>

<%
}finally{
try{
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>

