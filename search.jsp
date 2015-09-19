<%@ include file="header.jsp"%>

<div class="search">


	<form name="input" action="searchResult.jsp" method="post">
		<br>
		<br>
		<br>
		<br> Search for a place<br> <input type="text" name="name" /><br>
		<br>
		<br> Searching Filters.<br>
		<br> Food Type<br> <select name="type">
			<option value="">Any</option>
			<option value="Italian">Italian</option>
			<option value="Spanish">Spanish</option>
			<option value="Mexican">Mexican</option>
			<option value="Indian">Indian</option>
			<option value="Chinese">Chinese</option>
			<option value="Japanese">Japanese</option>
			<option value="American">American</option>
			<option value="French">French</option>
			<option value="Thai">Thai</option>
		</select> <br>
		<br> <input type="submit" value="Submit" />
	</form>
</div>

<%@ include file="footer.jsp"%>