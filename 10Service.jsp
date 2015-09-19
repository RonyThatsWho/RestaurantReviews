<%@ include file = "header.jsp" %>
	<br><br><br><br>
	<h3>Top 10 Service Rating</h3>
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
						
						"SELECT * FROM ("
						+"SELECT A.sid, first, gender, DATEDIFF(YEAR, BIRTHDATE, GETDATE()) AS AGE, attract, serv "
						+"From " 
						+"SERVERS S,"
						+"(SELECT avg(service) as serv, sid "
						+"From REVIEWS R, VISITS V "
						+"WHERE (R.VID = V.VID) "
						+"group by sid)  A,"

						+"(SELECT avg(attraction) as attract, sid "
						+"From REVIEWS R, VISITS V "
						+"WHERE (R.VID = V.VID) "
						+"group by sid)  B "
					
						+"Where A.SID = S.sid  AND A.sid = B.sid) "
						+"ORDER BY SERV DESC"
						
						
				);
				
				out.println("<form name= \"view\" action=\"viewProfile.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>	SID" + "</th><th>    Name"  + "</th><th>		Gender"  + "</th><th>    Age"  + "</th><th>    Attractiveness"  + "</th><th>    Service"  + "</th></tr>");
				rs.next();
				for (int i=0; i < 10; i++ ) {
					String sid = rs.getString(1);
					String name = rs.getString(2);
					String gender = rs.getString(3);
					String age = rs.getString(4);
					String score = rs.getString(5);
					String service = rs.getString(6);
					 
					out.println("<tr><td>"
					+ "<input type=\"submit\" name=\"SID\" value=\"" + sid + "\"/>"
					+ "</td><td>" + name + "</td><td>" + gender + "</td><td>" + age +  "</td><td>" + score +  "</td><td>" + service + "</td></tr>");
					rs.next();
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
			<img src="http://i.imgur.com/1bEMriO.jpg" height="auto" style="max-width: 99.9%">
		</div>

<%@ include file = "footer.jsp" %>