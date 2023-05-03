<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}

</style>
</head>
<body>
<ul>
		<li>
			<a href="/">Home</a>
		</li>
		<li>
			<a href="/city/list">/city/list</a>
		</li>
		<li>
			<a href="/city/detail">/city/detail</a>
		</li>
		<li>
			<a href="/login/join">/login/login</a>
		</li>
		<li>
			<a href="/moim/list">/moim/list</a>
		</li>
	</ul>
<div class="mainlayout">
	<section class="main">
		<tiles:insertAttribute name="main"/>
	</section>
</div>
</body>
</html>











