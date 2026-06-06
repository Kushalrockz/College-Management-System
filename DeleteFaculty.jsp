<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String id = request.getParameter("id");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

PreparedStatement ps = con.prepareStatement("DELETE FROM faculty WHERE faculty_id=?");

ps.setString(1,id);

int i = ps.executeUpdate();

con.close();

if(i > 0){
%>

<script>
alert("Faculty Deleted Successfully!");
window.location="ViewFaculty.jsp";
</script>

<%
}else{
%>

<script>
alert("Failed to Delete Faculty!");
window.location="ViewFaculty.jsp";
</script>

<%
}

}
catch(Exception e){
out.println(e);
}

%>
```


