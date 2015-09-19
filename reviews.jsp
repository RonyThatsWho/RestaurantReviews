<%@ include file="header.jsp"%>
<br>
<br>
<br>
<br>
<h3>Reviews</h3>
<br>
<%
			try {			
				
				Class.forName("org.h2.Driver");
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(
						
						"SELECT REVIEW, SERVICE, ATTRACTION, ATMOSPHERE, MEAL, RESTCOMMENT, SERVCOMMENT  FROM "
								+ "REVIEWS R, VISITS V "
								+ "WHERE (R.VID = V.VID) "
								+ "ORDER BY REVIEW DESC"
						
						
				);
				
 				out.println("<form name= \"view\" action=\"viewReview.jsp\" method=\"post\">");
 				out.println("<table border=1>");
 				out.println("<tr><th>   Review" +"</th><th>	Service"  + "</th><th>		Attraction"  + "</th><th>    Atmosphere"  + "</th><th>    Food" + "</th><th>   Restaurant Comments"   + "</th><th>  Server Comments"  + "</th></tr>");
				while (rs.next()) {
					
					String review = rs.getString(1);
					String service = rs.getString(2);
					String attract = rs.getString(3);
					String atmos = rs.getString(4);
					String food = rs.getString(5);
					String commentsa = rs.getString(6);
					String commentsb = rs.getString(7);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"revID\" value=\"" + review + "\"/>"
					+ "</td><td>" + service + "</td><td>" + attract + "</td><td>" + atmos +  "</td><td>" + food +  "</td><td>" + commentsa + "</td><td>" + commentsb + "</td></tr>");
					} 
				out.println("</table>");
 				out.println("</form>"); 
				
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>




<div class="img">
	<img src="http://i.imgur.com/1bEMriO.jpg" height="auto"
		style="max-width: 99.9%">
</div>

<%@ include file="footer.jsp"%>