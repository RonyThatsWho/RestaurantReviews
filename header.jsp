<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>Sensual Dining</title>
		<link rel="stylesheet" href="style.css" />	
	</head>

<body>

<div class="topbar">
	<h1>Sensual Dining</h1>
</div>
<div class="outterbox">
	<div class="adbox">
		<img src="ads/ru screwed.jpg" title="Get Screwed" />
	</div>
	<div class="linkbox">
		<div id="leftcolumn">
			<br><br><br>
			<a target="_top" href="index.jsp" class="menu_default">Home</a>
			<a target="_top" href="writeReview.jsp" class="menu_default">Write a Review</a>
			<a target="_top" href="search.jsp" class="menu_default">Search</a>
			<a target="_top" href="reviews.jsp" class="menu_default">Reviews</a>
			<br><br><br>
			<h2>Top 10 Places</h2>
			<a target="_top" href="bestOverall.jsp" class="menu_default">Best Overall</a>
			<a target="_top" href="bestService.jsp" class="menu_default">Best Service</a>
			<a target="_top" href="mostAttractive.jsp" class="menu_default">Most Attractive</a>
			<a target="_top" href="bestFood.jsp" class="menu_default">Best Food</a>
			<a target="_top" href="bestAtmosphere.jsp" class="menu_default">Best Atmosphere</a>
			<br><br><br><br><br>
			<h2>Top 10 Servers</h2>
			<a target="_top" href="10Chicks.jsp" class="menu_default">Hottest 10 Chicks</a>
			<a target="_top" href="10Guys.jsp" class="menu_default">Top 10 Guys</a>
			<a target="_top" href="10Service.jsp" class="menu_default">Top 10 Service</a>
			<a target="_top" href="rightNow.jsp" class="menu_default">Best Working Now</a>
		</div>
	</div>
	<div class="innerbox">