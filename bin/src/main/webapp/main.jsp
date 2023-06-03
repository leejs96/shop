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
	<button onclick="logout();">로그아웃</button>
	<button onclick="my_info();">내정보</button>
	
</body>
</html>

<script>
	function logout() {
		alert("로그아웃되었습니다.")
		session.removeAttributes("member_id");
		window.location.href="./login.jsp";
	}

	function my_info() {
		window.location.href="./my_info.jsp";
	}
</script>