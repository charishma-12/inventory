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
String nam = request.getParameter("pname");
int no = Integer.parseInt(request.getParameter("sno"));
int q = Integer.parseInt(request.getParameter("quant"));
String price = request.getParameter("cost");
String vendor = request.getParameter("vname");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
	PreparedStatement p=con.prepareStatement("Select * from product where serialNo='"+no+"'");
	ResultSet rs=p.executeQuery();
	if(rs.next()){
		int val=rs.getInt("quantity");
		val=val+q;
		PreparedStatement u=con.prepareStatement("update product set quantity='"+val+"'");
		int i=u.executeUpdate();
		if(i>0){
			response.sendRedirect("mmdetails.html");
		}
	}
	else{
		PreparedStatement ps = con.prepareStatement("insert into product values('"+nam+"','"+no+"','"+q+"','"+price+"','"+vendor+"')");
		int i = ps.executeUpdate();
		if (i>0){
			response.sendRedirect("mmdetails.html");
		}
	}
}
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}	


%>

</body>
</html>