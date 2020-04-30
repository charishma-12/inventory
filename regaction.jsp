<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registered</title>
</head>
<body>
<%
String nam = request.getParameter("name");
String mail = request.getParameter("mailid");
String pas = request.getParameter("pwd");
String repas = request.getParameter("repwd");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
	if(repas.equals(pas)){
	PreparedStatement p=con.prepareStatement("Select * from userlog where name='"+nam+"'");
	ResultSet rs=p.executeQuery();
	if(!rs.next()){
		PreparedStatement ps = con.prepareStatement("insert into userlog values('"+nam+"','"+mail+"','"+pas+"')");
		int i = ps.executeUpdate();
		if (i>0){
			response.sendRedirect("index.html");
		}
	}
	}
	else{
		response.sendRedirect("mmreg.html");
	}
}
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}	

%>

</body>
</html>