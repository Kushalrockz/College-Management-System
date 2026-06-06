<%@page import="java.sql.*"%>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
String course_id = request.getParameter("course_id");
String cname = request.getParameter("course_name");
String duration = request.getParameter("course_duration");
String fee = request.getParameter("course_fee");
String dept = request.getParameter("department");

Connection con = null;
PreparedStatement ps = null;

try{

if(course_id==null || course_id.trim().equals("") ||
   cname==null || cname.trim().equals("") ||
   duration==null || duration.trim().equals("") ||
   fee==null || fee.trim().equals("") ||
   dept==null || dept.trim().equals("")){

    out.println("<h3 style='color:red;text-align:center;'>All fields required!</h3>");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

ps = con.prepareStatement(
"INSERT INTO courses(course_id, course_name, course_duration, course_fee, department) VALUES(?,?,?,?,?)"
);

ps.setString(1, course_id);
ps.setString(2, cname);
ps.setString(3, duration);
ps.setString(4, fee);
ps.setString(5, dept);

int i = ps.executeUpdate();

if(i > 0){
%>

<script>
alert("Course Added Successfully!");
window.location="ManageCourses.jsp";
</script>

<%
}else{
out.println("<h3 style='color:red;text-align:center;'>Failed to add course</h3>");
}

}catch(Exception e){
out.println("<h3 style='color:red;text-align:center;'>Error: "+e.getMessage()+"</h3>");
}finally{
try{
if(ps!=null) ps.close();
if(con!=null) con.close();
}catch(Exception e){}
}
%>