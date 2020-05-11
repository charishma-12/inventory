<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Products List</title>
	<link rel="stylesheet" type="text/css" href="tableView.css">
</head>

<body>
<div>
<h1>Product List</h1>
</div>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
	PreparedStatement ps=con.prepareStatement(" select * from product");
	ResultSet rs=ps.executeQuery();
		%>
		<div class="view">
		<table>
		<tr>
		<th>SerialNo</th>
		<th>ProductName</th>
		<th>Quantity</th>
		<th>Cost/Unit</th>
		<th>VendorName</th>
		</tr>
		<%
	while(rs.next()) { %>
		<tr>
		<td><%=rs.getString("serialNo")%></td>
		<td><%=rs.getString("productName")%></td>
		<td><%=rs.getString("quantity")%></td>
		<td><%=rs.getString("CostPerUnit")%></td>
		<td><%=rs.getString("vendorName")%></td>
		</tr>
		<%
		
	}
	out.println();%>
	</table>
	</div>
	<%
} 
catch (Exception e) {
	e.printStackTrace();
}
%>
<div class="button-back">
<a href="sales.html">sales</a>
<a href="mmdetails.html">BACK</a>
</div>
<div class="button-logout">
    <a href="logout.jsp">LOGOUT</a>
</div>

</body>
</html>