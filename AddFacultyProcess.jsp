<%@page import="java.sql.*"%>

<%

// ✅ SESSION CHECK
if(session.getAttribute("user") == null) {
    response.sendRedirect("Login.html");
    return;
}

// ✅ GET PARAMETERS
String id = request.getParameter("faculty_id");
String name = request.getParameter("faculty_name");
String email = request.getParameter("email");
String contact = request.getParameter("contact");
String dept = request.getParameter("department");
String des = request.getParameter("designation");

// ✅ VALIDATION
if(id==null || id.trim().isEmpty() ||
   name==null || name.trim().isEmpty() ||
   email==null || email.trim().isEmpty() ||
   contact==null || contact.trim().isEmpty() ||
   dept==null || dept.trim().isEmpty() ||
   des==null || des.trim().isEmpty()) {

    out.println("<h3 style='color:red;text-align:center;'>Please fill all fields</h3>");
    return;
}

Connection con=null;
PreparedStatement ps=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

// ✅ SIMPLE CONNECTION (REMOVE dbconfig.jsp completely)
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

// ✅ SAFE INSERT (COLUMN NAMES)
ps = con.prepareStatement(
"INSERT INTO faculty(faculty_id, faculty_name, email, contact, department, designation) VALUES(?,?,?,?,?,?)"
);

ps.setString(1, id);
ps.setString(2, name);
ps.setString(3, email);
ps.setString(4, contact);
ps.setString(5, dept);
ps.setString(6, des);

int i = ps.executeUpdate();

if(i > 0){
%>

<script>
alert("Faculty Added Successfully");
window.location="ManageFaculty.jsp";
</script>

<%
}else{
    out.println("<h3 style='color:red;text-align:center;'>Failed to add faculty</h3>");
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