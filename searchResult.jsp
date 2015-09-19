<%@ include file="header.jsp"%>

<br>
<br>
<br>
<br>
<h3>Search Results</h3>
<a target="_top" href="search.jsp" class="menu_default"> - Go Back -</a>

<%
			try {		
				String name =request.getParameter("name");
				String type =request.getParameter("type");

				
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
						+ "AND RNAME LIKE '%" +name+"%'"
						+ "AND TYPE LIKE '%" +type+"%'"
						
						);
				
				out.println("<form name= \"view\" action=\"viewRestaurant.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>	RID"  + "</th><th>		Name"  + "</th><th>		Address"  + "</th><th>    Phone"  + "</th><th>    Food Type"  + "</th><th>    Food"  + "</th><th>    Attractiveness"  + "</th><th>    Service" + "</th><th>    Atmosphere" + "</th></tr>");
				while (rs.next()) {
					String rid = rs.getString(1);
					String names = rs.getString(2);
					String address = rs.getString(3);
					String phone = rs.getString(4);
					String types = rs.getString(5);
					String food = rs.getString(6);
					String atmos = rs.getString(7);
					String attract = rs.getString(8);
					String service = rs.getString(9);
					out.println("<tr><td>" 
					+ "<input type=\"submit\" name=\"RID\" value=\"" + rid + "\"/>"
					+ "</td><td>" + names + "</td><td>" + address + "</td><td>" + phone +  "</td><td>" + types +  "</td><td>"+ food +  "</td><td>" + attract +  "</td><td>" + service +  "</td><td>" + atmos + "</td></tr>");
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