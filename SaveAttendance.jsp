<%@ page import="java.sql.*" %>

<%
Connection con = null;
PreparedStatement ps = null;

try {

    String date = request.getParameter("date");
    String course_id = request.getParameter("course_id");
    String[] studentIds = request.getParameterValues("student_id[]");

    // ✅ VALIDATION
    if(date == null || date.trim().equals("") ||
       course_id == null || course_id.trim().equals("") ||
       studentIds == null){

%>
<script>
alert("❌ Missing data. Please fill all fields!");
history.back();
</script>
<%
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/cms","root",""
    );

    // ✅ PREVENT DUPLICATES (optional but important)
    PreparedStatement checkPs = con.prepareStatement(
        "SELECT COUNT(*) FROM attendance WHERE student_id=? AND course_id=? AND date=?"
    );

    ps = con.prepareStatement(
        "INSERT INTO attendance(student_id, course_id, date, status) VALUES (?,?,?,?)"
    );

    int count = 0;

    for(String sid : studentIds){

        String status = request.getParameter("status_" + sid);

        if(status != null && !status.trim().equals("")){

            // 🔍 Check duplicate
            checkPs.setString(1, sid);
            checkPs.setString(2, course_id);
            checkPs.setString(3, date);

            ResultSet rs = checkPs.executeQuery();
            rs.next();

            if(rs.getInt(1) == 0){   // only insert if not exists

                ps.setString(1, sid);
                ps.setString(2, course_id);
                ps.setString(3, date);
                ps.setString(4, status);

                ps.executeUpdate();
                count++;
            }
        }
    }

    if(count > 0){
%>

<script>
alert("✅ Attendance saved for <%=count%> students!");
window.location="ViewAttendance.jsp";
</script>

<%
    } else {
%>

<script>
alert("⚠️ Attendance already exists or nothing selected");
history.back();
</script>

<%
    }

}catch(Exception e){
%>

<script>
alert("ERROR: <%=e.getMessage()%>");
history.back();
</script>

<%
} finally {
    try{
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>