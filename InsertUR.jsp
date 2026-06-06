<%@page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String contact = request.getParameter("contact");
String city = request.getParameter("city");
String address = request.getParameter("address");
String role = request.getParameter("role");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    if(name==null || name.trim().equals("") ||
       email==null || email.trim().equals("") ||
       password==null || password.trim().equals("") ||
       contact==null || contact.trim().equals("") ||
       city==null || city.trim().equals("") ||
       address==null || address.trim().equals("") ||
       role==null || role.trim().equals("")) {
%>
<script>
alert("All fields are required!");
history.back();
</script>
<%
        return;
    }

    email = email.trim().toLowerCase();

    if(!email.matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")){
%>
<script>
alert("Invalid email. Please use correct Gmail address like student@gmail.com");
history.back();
</script>
<%
        return;
    }

    if(!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%&!*?]).{8,}$")){
%>
<script>
alert("Weak password! Use 8+ characters with uppercase, lowercase, number and special character.");
history.back();
</script>
<%
        return;
    }

    if(!contact.matches("^[0-9]{10}$")){
%>
<script>
alert("Invalid contact number. Enter 10 digits only.");
history.back();
</script>
<%
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

    ps = con.prepareStatement("SELECT email FROM userregistration WHERE email=?");
    ps.setString(1, email);
    rs = ps.executeQuery();

    if(rs.next()){
%>
<script>
alert("Email already registered. Please login.");
window.location="Login.html";
</script>
<%
        return;
    }

    if(rs != null) rs.close();
    if(ps != null) ps.close();

    String query = "INSERT INTO userregistration(name,email,password,contact,city,address,role) VALUES (?,?,?,?,?,?,?)";

    ps = con.prepareStatement(query);

    ps.setString(1, name.trim());
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setString(4, contact.trim());
    ps.setString(5, city.trim());
    ps.setString(6, address.trim());
    ps.setString(7, role.trim());

    int k = ps.executeUpdate();

    if(k > 0) {
%>
<script>
alert("Registration Successful!");
window.location="Login.html";
</script>
<%
    } else {
%>
<script>
alert("Registration Failed!");
history.back();
</script>
<%
    }

} catch(Exception e) {
%>
<script>
alert("Error: <%=e.getMessage()%>");
history.back();
</script>
<%
} finally {
    try {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    } catch(Exception e) {}
}
%>