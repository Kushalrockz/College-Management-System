<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    if(email == null || email.trim().equals("") ||
       password == null || password.trim().equals("")) {
%>
<script>
alert("Email and Password are required!");
window.location="Login.html";
</script>
<%
        return;
    }

    email = email.trim().toLowerCase();
    password = password.trim();

    if(!email.matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
%>
<script>
alert("Invalid email format. Please enter correct Gmail address.");
window.location="Login.html";
</script>
<%
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

    ps = con.prepareStatement("SELECT * FROM userregistration WHERE email=?");
    ps.setString(1, email);

    rs = ps.executeQuery();

    if(rs.next()) {

        String dbPassword = rs.getString("password");
        String role = rs.getString("role");

        if(!dbPassword.equals(password)) {
%>
<script>
alert("Wrong password!");
window.location="Login.html";
</script>
<%
            return;
        }

        session.setAttribute("user", email);
        session.setAttribute("role", role);

        if(role.equalsIgnoreCase("admin")) {
            response.sendRedirect("AdminDashboard.jsp");
        }
        else if(role.equalsIgnoreCase("staff") || role.equalsIgnoreCase("faculty")) {
            response.sendRedirect("StaffDashboard.jsp");
        }
        else {
            response.sendRedirect("StudentDashboard.jsp");
        }

        return;
    }
    else {
%>
<script>
alert("Email not registered. Please register first.");
window.location="UserRegistration.html";
</script>
<%
        return;
    }

} catch(Exception e) {
%>
<script>
alert("Error: <%=e.getMessage()%>");
window.location="Login.html";
</script>
<%
} finally {
    try {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    } catch(Exception ex){}
}
%>