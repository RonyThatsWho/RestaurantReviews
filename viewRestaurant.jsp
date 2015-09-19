<%@ include file="header.jsp"%>

<br>
<br>
<br>
<br>
<h3>Restaurant Info</h3>

<%
			try {		
				
				String rid =request.getParameter("RID");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(
						
						
						
						"SELECT A.RID, RNAME, ADDRESS, PHONE, TYPE, MEALAVG AS MEALS, B.ATMOS, ATTRACT, SERVICE "
						+ "FROM "

						+ "(SELECT AVG(MEAL) AS MEALAVG, RID "
						+ "FROM "
						+ "REVIEWS RV, VISITS V "
						+ "WHERE (RV.VID = V.VID) " 
						+ "GROUP BY RID) A, "

						+ "(SELECT AVG(ATMOSPHERE) AS ATMOS, RID "
						+ "FROM "
						+ "REVIEWS RV, VISITS V "
						+ "WHERE (RV.VID = V.VID) "
						+ "GROUP BY RID) B, "


						+ "(SELECT RID, RNAME,ADDRESS, PHONE, TYPE, AVG(SERVICE) AS SERVICE, AVG(ATTRACT) AS ATTRACT FROM "

						+ "(SELECT avg(SERVICE) as SERVICE, avg(attraction) as attract, Sid "
						+ "From REVIEWS R, VISITS V "
						+ "WHERE (R.VID = V.VID) "
						+ "group by SID) A, "

						+ "(SELECT R.RID, RNAME, ADDRESS, PHONE, TYPE, W.SID FROM "
						+ "RESTAURANTS R, WORKS W "
						+ "WHERE R.RID = W.RID) B "

						+ "WHERE A.SID = B.SID "
						+ "GROUP BY RID) C "

						+ "WHERE (A.RID = C.RID) AND (B.RID = C.RID) "
						+ "AND A.RID = '" +rid+"'"
						
						);
				
				
				out.println("<table border=1>");
				out.println("<tr><th>	Name"  + "</th><th>		Address"  + "</th><th>    Phone"  + "</th><th>    Food Type"  + "</th><th>    Food"  + "</th><th>    Attractiveness"  + "</th><th>    Service" + "</th><th>    Atmosphere" + "</th></tr>");
				while (rs.next()) {
					String names = rs.getString(2);
					String address = rs.getString(3);
					String phone = rs.getString(4);
					String types = rs.getString(5);
					String food = rs.getString(6);
					String atmos = rs.getString(7);
					String attract = rs.getString(8);
					String service = rs.getString(9);
					out.println("<tr><td>" + names + "</td><td>" + address + "</td><td>" + phone +  "</td><td>" + types +  "</td><td>"+ food +  "</td><td>" + attract +  "</td><td>" + service +  "</td><td>" + atmos + "</td></tr>");
					} 
				out.println("</table>");
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
<h3>Currently Staffed Servers</h3>
<%
			try {		

				String rid =request.getParameter("RID");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(							

						"SELECT A.SID, FIRST, GENDER, DATEDIFF(YEAR, BIRTHDATE, GETDATE()) AS AGE, SERVICE, ATTRACT FROM "

						+ "(SELECT avg(SERVICE) as SERVICE, avg(attraction) as attract, SID "
						+ "FROM REVIEWS R, VISITS V "
						+ "WHERE (R.VID = V.VID) "
						+ "GROUP BY SID) A, "

						+ "(SELECT RID, FIRST, GENDER, BIRTHDATE, S.SID  FROM "
						+ "SERVERS S, WORKS W "
						+ "WHERE S.SID = W.SID) B "

						+ "WHERE (A.SID = B.SID) "
						+ "AND RID =" + rid
						
						);
				
				out.println("<form name= \"view\" action=\"viewProfile.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>   SID" +"</th><th>	Name"  + "</th><th>		Gender"  + "</th><th>    Age"  + "</th><th>    Attractiveness"  + "</th><th>    Service"  + "</th></tr>");
				while (rs.next()) {
					
					String sid = rs.getString(1);
					String name = rs.getString(2);
					String gender = rs.getString(3);
					String age = rs.getString(4);
					String score = rs.getString(5);
					String service = rs.getString(6);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"SID\" value=\"" + sid + "\"/>"
					+ "</td><td>" + name + "</td><td>" + gender + "</td><td>" + age +  "</td><td>" + score +  "</td><td>" + service + "</td></tr>");
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
<h3>Restaurant Reviews</h3>
<%
			try {		
				
				String rid =request.getParameter("RID");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(							

						"SELECT REVIEW, SERVICE, ATTRACTION, ATMOSPHERE, MEAL, RESTCOMMENT  FROM "
						+ "REVIEWS R, VISITS V, RESTAURANTS S "
						+ "WHERE (R.VID = V.VID) AND (V.RID = S.RID) "
						+ "AND S.RID =" + rid
						
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