<%@ include file="header.jsp"%>

<br>
<br>
<br>
<br>
<%
			try {		
				
				String revID =request.getParameter("revID");
				out.println("<h3>Review " + revID + "</h3>");
				
				java.sql.Connection con;			
				Statement stmt;			
				ResultSet rs;			

				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");	
				con = ds.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(
						
						"SELECT C.PID, C.FIRST, C.GENDER, DATEDIFF(YEAR, C.BIRTHDATE, GETDATE()) "
						+ ", E.RID, RNAME, TYPE, ATMOSPHERE, MEAL, RESTCOMMENT "
						+ ", S.SID, S.FIRST, S.GENDER, DATEDIFF(YEAR, S.BIRTHDATE, GETDATE()), SERVICE, ATTRACTION, SERVCOMMENT  "	
						
						+ "FROM "
						+ "REVIEWS R, VISITS V, RESTAURANTS E, SERVERS S, CUSTOMERS C "
						+ "WHERE R.VID = V.VID AND V.RID = E.RID AND V.SID = S.SID AND V.PID = C.PID AND "
						+ "REVIEW = " + revID	
						
						);
				out.println("<h3>Review made by</h3>");
				out.println("<form name= \"view\" action=\"viewPerson.jsp\" method=\"post\">");
				out.println("<table border=1>");
				out.println("<tr><th>	PID"  + "</th><th>		Name"  + "</th><th>		Gender"  + "</th><th>		Age"  +  "</th></tr>");
				while(rs.next()) {
					String pid = rs.getString(1);
					String cfirst = rs.getString(2);
					String cgender = rs.getString(3);
					String cage = rs.getString(4);
					
					String rid = rs.getString(5);
					String rname = rs.getString(6);
					String type = rs.getString(7);
					String atmos = rs.getString(8);
					String food = rs.getString(9);
					String commenta = rs.getString(10);
					
					String sid = rs.getString(11);
					String sfirst = rs.getString(12);
					String sgender = rs.getString(13);
					String sage = rs.getString(14);
					String service = rs.getString(15);
					String attract = rs.getString(16);
					String commentb = rs.getString(17);
					out.println("<tr><td>" 
							+ "<input type=\"submit\" name=\"pid\" value=\"" + pid + "\"/>"
							+ "</td><td>" + cfirst + "</td><td>" + cgender +  "</td><td>" + cage + "</td></tr>");
					out.println("</table>");
					out.println("</form>");
					out.println("<h3>Restaurant Review</h3>");
					out.println("<form name= \"view\" action=\"viewRestaurant.jsp\" method=\"post\">");
					out.println("<table border=1>");
					out.println("<tr><th>	RID"  + "</th><th>		Name"  + "</th><th>		type"  + "</th><th>		Atmosphere" + "</th><th>		Food"    + "</th><th>		Comments"  +  "</th></tr>");
					out.println("<tr><td>" 
							+ "<input type=\"submit\" name=\"RID\" value=\"" + rid + "\"/>"
							+ "</td><td>" + rname + "</td><td>" + type +  "</td><td>" + atmos +  "</td><td>" + food +  "</td><td>" + commenta + "</td></tr>");
					out.println("</table>");
					out.println("</form>");
					out.println("<h3>Server Review</h3>");
					out.println("<form name= \"view\" action=\"viewProfile.jsp\" method=\"post\">");
					out.println("<table border=1>");
					out.println("<tr><th>	SID"  + "</th><th>		Name"  + "</th><th>		Gender"  + "</th><th>		Age" + "</th><th>		Service"    + "</th><th>		Attractiveness"    + "</th><th>		Comments"    +  "</th></tr>");
					out.println("<tr><td>" 
							+ "<input type=\"submit\" name=\"SID\" value=\"" + sid + "\"/>"
							+ "</td><td>" + sfirst + "</td><td>" + sgender +  "</td><td>" + sage +  "</td><td>" + service +  "</td><td>" + attract +  "</td><td>" + commentb + "</td></tr>");
					out.println("</table>");
					out.println("</form>");
					
					}
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		%>



<%@ include file="footer.jsp"%>