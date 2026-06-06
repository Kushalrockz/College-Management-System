```jsp
<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String id=request.getParameter("faculty_id");
String name=request.getParameter("faculty_name");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String dept=request.getParameter("department");
String designation=request.getParameter("designation");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps=con.prepareStatement("UPDATE faculty SET faculty_name=?,email=?,contact=?,department=?,designation=? WHERE faculty_id=?");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,contact);
ps.setString(4,dept);
ps.setString(5,designation);
ps.setString(6,id);

ps.executeUpdate();

con.close();

%>

<script>

alert("Faculty Updated Successfully!");
window.location="ViewFaculty.jsp";

</script>

<%

}
catch(Exception e){
out.println(e);
}

%>
```


