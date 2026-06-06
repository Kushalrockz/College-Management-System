<%@page import="java.sql.*"%>`n<%@ include file="/WEB-INF/dbconfig.jsp" %>

<%

String name,email,password,contact,city,address;
String role="Student";

name=request.getParameter("name");
email=request.getParameter("email");
password=request.getParameter("password");
contact=request.getParameter("contact");
city=request.getParameter("city");
address=request.getParameter("address");

Connection con=null;
PreparedStatement ps=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","");

ps=con.prepareStatement("insert into userregistration values(?,?,?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,password);
ps.setString(4,contact);
ps.setString(5,city);
ps.setString(6,address);
ps.setString(7,role);

ps.executeUpdate();

con.close();

%>

<!DOCTYPE html>
<html>
<head>
<title>Registration Success</title>

<style>
body{
margin:0;
font-family:'Segoe UI';
background:#eef2f7;
}

/* TOP BAR */
.toast{
position:fixed;
top:20px;
left:50%;
transform:translateX(-50%);
background:#28a745;
color:white;
padding:15px 25px;
border-radius:8px;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
font-size:16px;
display:flex;
align-items:center;
gap:15px;
animation:slideDown 0.5s ease;
}

/* BUTTON */
.toast button{
background:white;
color:#28a745;
border:none;
padding:6px 12px;
border-radius:5px;
cursor:pointer;
font-weight:bold;
}

.toast button:hover{
background:#e6e6e6;
}

@keyframes slideDown{
from{opacity:0; transform:translate(-50%,-20px);}
to{opacity:1; transform:translate(-50%,0);}
}
</style>
</head>

<body>

<div class="toast">
User Registered Successfully!
<button onclick="goLogin()">OK</button>
</div>

<script>
function goLogin(){
window.location="login.html";
}
</script>

</body>
</html>

<script>
alert("User Registered Successfully!");
document.location="/CMS/Login.html";

setTimeout(()=>{
document.location="/CMS/Login.html";
},3000);
</script>

<%

}catch(Exception e){
out.println(e);
}

%>

