<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
if(session.getAttribute("user") == null){
    response.sendRedirect("Login.html");
    return;
}

String student = request.getParameter("student");
String course  = request.getParameter("course");
String marks   = request.getParameter("marks");
String exam    = request.getParameter("exam_type");

Connection con=null;
PreparedStatement ps=null;

try{

// ✅ VALIDATION
if(student==null || student.trim().equals("") ||
   course==null  || course.trim().equals("")  ||
   marks==null   || marks.trim().equals("")   ||
   exam==null    || exam.trim().equals("")){

%>
<script>
alert("Please fill all fields!");
window.location="AddMarks.jsp";
</script>
<%
return;
}

// ✅ SAFE PARSE
int marksValue = 0;
try{
    marksValue = Integer.parseInt(marks);
}catch(Exception ex){
%>
<script>
alert("Invalid marks value!");
window.location="AddMarks.jsp";
</script>
<%
return;
}

// ✅ DB CONNECTION
Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// ✅ INSERT
ps = con.prepareStatement(
"INSERT INTO marks(student_id, course_id, marks, exam_type) VALUES(?,?,?,?)"
);

ps.setString(1, student);
ps.setString(2, course);
ps.setInt(3, marksValue);
ps.setString(4, exam);

int i = ps.executeUpdate();

if(i>0){
%>
<script>
alert("Marks Added Successfully!");
window.location="ViewMarks.jsp";
</script>
<%
}else{
%>
<script>
alert("Failed to save marks!");
window.location="AddMarks.jsp";
</script>
<%
}

}catch(Exception e){
e.printStackTrace();
%>

<script>
alert("Error: <%=e.getMessage()%>");
window.location="AddMarks.jsp";
</script>

<%
}finally{
try{
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>