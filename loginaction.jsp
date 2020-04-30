<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login?!</title>
</head>
<body>
<%
String s=request.getParameter("mailid");
String pswd=request.getParameter("pwd");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
	PreparedStatement ps=con.prepareStatement("Select * from userlog where mailid='"+s+"' and pwd='"+pswd+"'");
	System.out.print("Database is connected !");
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		session.setAttribute("key",s);
		response.sendRedirect("mmdetails.html");
		
	}
	else{
		response.sendRedirect("index.html");
	}
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</body>
</html>
