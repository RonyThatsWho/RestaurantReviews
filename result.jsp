<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<h2>Drinkers and Beers</h2>
	<br>
	<br>
	<br>


	<%
			try {		
				
				String beer =request.getParameter("beerType");

				out.println("<tr><td>Beer type  :" + beer + "</td><td>");
				out.println("<br><br><br>");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery("SELECT name,beer from LIKES where LIKES.beer LIKE '" +beer+"'");
				
				out.println("<table border=1 width=400>");
				out.println("<tr><td>    drinker"  + "</td><td>    beer"  + "</td></tr>");
				while (rs.next()) {
					String drinker = rs.getString(1);
					out.println("<tr><td>" + drinker + "</td><td>" + beer+ "</td></tr>");
				} 
				out.println("</table>");
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>


</body>
</html>
