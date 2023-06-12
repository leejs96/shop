<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload = "logout();">
	
</body>
</html>

<script>
	function logout()	{
		alert("로그아웃되었습니다.");
		<%session.invalidate();%>
		window.location.href="./main.jsp";
	}
</script>