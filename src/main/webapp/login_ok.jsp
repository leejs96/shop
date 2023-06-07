<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="./dbconn.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		
	%>

	<%
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM shopping_member WHERE member_id = '" + user_id + "' AND member_pw = '" + pw + "';";
		pstmt = conn.prepareStatement(sql);
		out.println(sql);
		// 4) 실행
		rs = pstmt.executeQuery();
		// 5) 결과를 테이블에 출력
		if (rs.next()) {
			session.setAttribute("member_id", user_id);
	%>
		<script>
			window.location.href="./main.jsp";
		</script>
		<%
		} else{
	%>			
		<script>
			alert("아이디와 비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
	
	<%
		}
	%>
	
</body>
</html>
