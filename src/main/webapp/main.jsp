
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	<%String user_id = (String)session.getAttribute("member_id"); %>
	<p><%=user_id %></p>
	<button onclick="location = 'logout.jsp'">로그아웃</button>
	<button onclick="my_info();">내정보</button>
	
</body>
</html>

<script>
	function my_info() {
		alert("<%=user_id%>");
		window.location.href="./my_info.jsp";
	}


</script>