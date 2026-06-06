<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>User List</title>

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#4facfe,#00f2fe);
    margin:0;
    padding:40px;
}

.container{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#4facfe;
    color:white;
    padding:12px;
}

td{
    padding:10px;
    text-align:center;
}

tr:nth-child(even){
    background:#f2f2f2;
}

tr:hover{
    background:#e6f2ff;
}

a{
    text-decoration:none;
    padding:6px 12px;
    border-radius:5px;
    color:white;
    font-size:13px;
}

.update{
    background:#28a745;
}

.update:hover{
    background:#1f7a34;
}

.delete{
    background:#dc3545;
}

.delete:hover{
    background:#a71d2a;
}

</style>

</head>

<body>

<div class="container">

<h2>User Registration List</h2>

<table>

<tr>
<th>Name</th>
<th>Email</th>
<th>Password</th>
<th>Contact</th>
<th>City</th>
<th>Address</th>
<th>Role</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%
Connection con;
Statement stmt;

try
{
Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

stmt=con.createStatement();

ResultSet rs=stmt.executeQuery("select * from userregistration");

while(rs.next())
{
%>

<tr>

<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("password")%></td>
<td><%=rs.getString("contact")%></td>
<td><%=rs.getString("city")%></td>
<td><%=rs.getString("address")%></td>
<td><%=rs.getString("role")%></td>

<td>
<a class="update" href="UpdateUserForm.jsp?email=<%=rs.getString("email")%>">Update</a>
</td>

<td>
<a class="delete" href="DeleteUR.jsp?email=<%=rs.getString("email")%>">Delete</a>
</td>

</tr>

<%
}
}
catch(Exception e)
{
out.println(e);
}
%>

</table>

</div>

</body>
</html>

