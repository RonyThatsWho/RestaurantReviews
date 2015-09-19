<%@ include file = "header.jsp" %>

		<div class="reviewbox">
			<br><br><br><br>
					
			<form name="input" action="addReview.jsp" method="post">
				
				
				Please Enter VisitID<br>
				<input type="text" name="vid" /><br>
				<br><br>
				<b>Restaurant Review</b><br>
				Please rate the atmosphere of the restaurant?<br>
				<select name="atmos">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				</select>
				<br>
				How was your meal?<br>
				<select name="meal">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				</select>
				<br><br>
				Comments on the restaurant<br>
				<TEXTAREA NAME="commenta" ROWS=4 COLS=50 ></TEXTAREA><br>
				<b>Server Review</b><br>
				How do you rate the service?<br>
				<select name="serv">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				</select>
				<br>
				How attractive was your server?<br>
				<select name="attract">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				</select>
				<br><br>
				Comments on your server<br>
				<TEXTAREA NAME="commentb" ROWS=4 COLS=50 ></TEXTAREA><br>

				<input type="submit" value="Submit" />
			</form>
		</div>
		
<%@ include file = "footer.jsp" %>