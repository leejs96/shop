
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainHome</title>
</head>
<body>
	<h1>메인페이지</h1>
	<%String user_id = (String)session.getAttribute("member_id"); %>
	<p><%=user_id %>님 안녕하세요!</p>
	
	<button onclick="location = 'logout.jsp'">로그아웃</button>
	<button onclick="my_info();">내정보</button>
	
</body>
</html>

<script>
	function my_info() {
		window.location.href="./my_info.jsp";
	}


</script>