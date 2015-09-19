<%@ include file="header.jsp"%>

<br>
<br>
<br>
<br>
<h3>Server Profile</h3>

<%
			try {		

				String sid =request.getParameter("SID");

				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(
						
						
						
						"SELECT first, gender, datediff(year, birthdate, getdate()) AS AGE, attract, serv "
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
					
						+"Where A.SID = S.sid  AND A.sid = B.sid "
						+"AND A.SID =" + sid
						
						);
				
				out.println("<table border=1>");
				out.println("<tr><th>	Name"  + "</th><th>		Gender"  + "</th><th>    Age"  + "</th><th>    Attractiveness"  + "</th><th>    Service"  + "</th></tr>");
				rs.next();
				/* for (int i=0; i < 10; i++ ) { */
					String name = rs.getString(1);
					String gender = rs.getString(2);
					String age = rs.getString(3);
					String score = rs.getString(4);
					String service = rs.getString(5);
					 
					out.println("<tr><td>" + name + "</td><td>" + gender + "</td><td>" + age +  "</td><td>" + score +  "</td><td>" + service + "</td></tr>");
					
				out.println("</table>");
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
<h3>Current Employers</h3>
<%
			try {		

				String sid =request.getParameter("SID");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(							

						"SELECT W.RID, RNAME, TYPE, SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY FROM "
						+ "WORKS W, RESTAURANTS R "
						+ "WHERE W.RID = R.RID "
						+ "AND sid = " + sid
						
						);
				
				out.println("<form name= \"view\" action=\"viewRestaurant.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>   Rid" + "</th><th>	Restaurant"  + "</th><th>	Type"  + "</th><th>	Sunday"  + "</th><th>	Monday"  + "</th><th>	Tuesday"  + "</th><th>	Wednesday"  + "</th><th>	Thursday"  + "</th><th>	Friday"  + "</th><th>    Saturday"  + "</th></tr>");
				while (rs.next()) {
					
					String rid = rs.getString(1);
					String restaurant = rs.getString(2);
					String type = rs.getString(3);
					String sun = rs.getString(4);
					String mon = rs.getString(5);
					String tues = rs.getString(6);
					String wed = rs.getString(7);
					String thur = rs.getString(8);
					String fri = rs.getString(9);
					String sat = rs.getString(10);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"RID\" value=\"" + rid + "\"/>"
					+ "</td><td>" + restaurant + "</td><td>" + type + "</td><td>" + sun + "</td><td>" + mon + "</td><td>" + tues + "</td><td>" + wed + "</td><td>" + thur + "</td><td>" + fri + "</td><td>" + sat + "</td></tr>");
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
<h3>Server Reviews</h3>
<%
			try {		

				String sid =request.getParameter("SID");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(							

						"SELECT REVIEW, SERVICE, ATTRACTION, ATMOSPHERE, MEAL, SERVCOMMENT  FROM "
						+ "REVIEWS R, VISITS V "
						+ "WHERE (R.VID = V.VID) "
						+ "AND V.SID =" + sid
						
						);
				
				out.println("<form name= \"view\" action=\"viewReview.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>   Review" +"</th><th>	Service"  + "</th><th>		Attraction"  + "</th><th>    Atmosphere"  + "</th><th>    Food"  + "</th><th>    Comments"  + "</th></tr>");
				while (rs.next()) {
					
					String review = rs.getString(1);
					String service = rs.getString(2);
					String attract = rs.getString(3);
					String atmos = rs.getString(4);
					String food = rs.getString(5);
					String comments = rs.getString(6);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"revID\" value=\"" + review + "\"/>" 
					+ "</td><td>" + service + "</td><td>" + attract + "</td><td>" + atmos +  "</td><td>" + food +  "</td><td>" + comments + "</td></tr>");
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

<%@ include file="footer.jsp"%>