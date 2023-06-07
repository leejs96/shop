<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./dbconn.jsp" %>
<title>Insert title here</title>
</head>
<body>
	<h1>회원탈퇴</h1>
	<%
		String user_id = (String)session.getAttribute("member_id");
		String pw=request.getParameter("user_pw");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT member_pw FROM shopping_member WHERE member_id = '" + user_id + "';";
		pstmt = conn.prepareStatement(sql);
		out.println(sql);
		// 4) 실행
		rs = pstmt.executeQuery();
		// 5) 결과를 테이블에 출력
		String DBpw = "";
		if (rs.next()) {
			DBpw = rs.getString("member_pw");
		}
		
		if(!DBpw.equals(pw)) {
	%>
			<script>
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
	<%} else {
			sql = "DELETE FROM shopping_member WHERE member_id ='" + user_id + "'";
			out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
	%>
			<script>
				alert("탈퇴가 완료되었습니다.");
				window.location.href="./login.jsp";
			</script>
	<%
		}
	%>

</body>
</html>

