<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainHome</title>
<link rel="stylesheet" href = "./css/nav.css">
</head>

<body>
	<%String user_id = (String)session.getAttribute("member_id"); %>
	<div class = "navigation_bar">
		<div class = "navigation_bar" style = "float : left;">
			<ul class = "list">
				<li class = "menu"><a href = "main.jsp">Home</a></li>
			</ul>
		</div>
		<div class = "navigation_bar" style = "float : right;">
			<ul class = "list">
				<% if(user_id == null) {%>
						<li class = "menu"><a href = "login.jsp">로그인</a></li>
				<%} else {%>
						<li class = "menu" style = "padding-right: 10px;"><a href = "my_info.jsp">마이페이지</a></li>
						<li class = "menu"><a href = "logout.jsp">로그아웃</a></li>
				<%}%>
			</ul>
		</div>
	</div>
	<h1>메인페이지</h1>
	<%if(user_id != null) { %>
		<p><%=user_id %>님 안녕하세요!</p>
	<%}%>
	
</body>
</html>
