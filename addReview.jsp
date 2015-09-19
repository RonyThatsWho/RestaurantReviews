<%@ include file="header.jsp"%>

<%
			try {		
				
				String vid =request.getParameter("vid");
				String atmos =request.getParameter("atmos");
				String meal =request.getParameter("meal");
				String serv =request.getParameter("serv");				
				String attract =request.getParameter("attract");
				String commenta =request.getParameter("commenta");
				String commentb =request.getParameter("commentb");
				
				out.println("<br><br><br><br><br><br>Submitted Information:<br><table>");
				out.println("<tr><td>VisitID: </td><td>" + vid + "</td></tr>");
				out.println("<tr><td>Atmosphere Rating: </td><td>" + atmos + "</td></tr>");
				out.println("<tr><td>Meal Rating: </td><td>" + meal + "</td></tr>");
				out.println("<tr><td>Service Rating: </td><td>" + serv + "</td></tr>");
				out.println("<tr><td>Atrractiveness: </td><td>" + attract + "</td></tr>");
				out.println("<tr><td>Restaurant Comments: </td><td>" + commenta + "</td></tr>");
				out.println("<tr><td>Server Comments: </td><td>" + commentb + "</td></tr></table>");
				
				java.sql.Connection con;			
				Statement stmt;					

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
							
				stmt.executeUpdate("INSERT INTO REVIEWS (VID,SERVICE,ATTRACTION,ATMOSPHERE,MEAL,RESTCOMMENT, SERVCOMMENT) " + "VALUES ('" + vid + "', '" + atmos + "','" + meal + "','" + serv + "','" + attract + "','" + commenta + "','" + commentb + "')");

				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println("<br><br><br><h2>Processing Error: VisitID either invalid or already reviewed</h2>");
			}
		%>


<%@ include file="footer.jsp"%>