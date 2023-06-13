<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainHome</title>
<link rel="stylesheet" href = "./css/nav.css?after">
</head>

<body>
	<%
		String manager = request.getParameter("manage");
		if(manager != null) {
			session.setAttribute("manager", manager);
		}
	%>
	<%manager = (String)session.getAttribute("manager"); %>
	<%String user_id = (String)session.getAttribute("member_id"); %>
	
		
	<div class = "navigation_bar">
			<ul class = "list">
				<li class = "menu" style = "float : left;"><a href = "main.jsp">Home</a></li>
				<%if(manager != null) {%>
						<li class = "menu"><a href = "logout.jsp">로그아웃</a></li>
						<li class = "menu" style = "padding-right: 10px;">
							<div class = "dropdown">관리자페이지</div>
							<div class = "dropdown_menu">
								<a href = "dept.jsp">부서관리</a>
								<a href = "memberlist.jsp">회원관리</a>
							</div>
						</li>
				<%} else if(user_id == null) {%>
						<li class = "menu"><a href = "login.jsp">로그인</a></li>
				<%} else {%>
						<li class = "menu"><a href = "logout.jsp">로그아웃</a></li>
						<li class = "menu" style = "padding-right: 10px;"><a href = "my_info.jsp">마이페이지</a></li>
				<%}%>
			</ul>
	</div>
	<h1>메인페이지</h1>
	<%if(user_id != null) { %>
		<p><%=user_id %>님 안녕하세요!</p>
	<%}%>
	
</body>
</html>
