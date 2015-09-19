<%@ include file="header.jsp"%>

<br>
<br>
<br>
<br>
<h3>Customer Profile</h3>

<%
			try {		

				String pid =request.getParameter("pid");

				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(
						
						
						
						"SELECT first, gender, datediff(year, birthdate, getdate()) AS AGE "
						+ "From " 
						+ "CUSTOMERS "
						+ "WHERE PID='" + pid + "'"
						);
				
				out.println("<table border=1>");
				out.println("<tr><th>	Name"  + "</th><th>		Gender"  + "</th><th>    Age"  +  "</th></tr>");
				rs.next();
					String name = rs.getString(1);
					String gender = rs.getString(2);
					String age = rs.getString(3);;
					 
					out.println("<tr><td>" + name + "</td><td>" + gender + "</td><td>" + age +  "</td></tr>");
					
				out.println("</table>");
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
<h3>Reviews Made</h3>
<%
			try {		
				
				//Get the max unit price inputed by the user
				String pid =request.getParameter("pid");
				
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
						+ "AND V.PID ='" + pid + "'"
						
						);
				
				out.println("<form name= \"view\" action=\"viewReview.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>   Review" +"</th><th>	Service"  + "</th><th>		Attraction"  + "</th><th>    Atmosphere"  + "</th><th>    Food"  + "</th><th>    Restaurant Comments"  + "</th><th>    Server Comments"  + "</th></tr>");
				while (rs.next()) {
					
					String review = rs.getString(1);
					String service = rs.getString(2);
					String attract = rs.getString(3);
					String atmos = rs.getString(4);
					String food = rs.getString(5);
					String commenta = rs.getString(6);
					String commentb = rs.getString(7);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"revID\" value=\"" + review + "\"/>" 
					+ "</td><td>" + service + "</td><td>" + attract + "</td><td>" + atmos +  "</td><td>" + food +  "</td><td>" + commenta +  "</td><td>" + commentb + "</td></tr>");
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