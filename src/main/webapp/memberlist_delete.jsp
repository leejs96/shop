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
	<%
		String user_id=request.getParameter("target");
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM shopping_member WHERE member_id ='" + user_id + "'";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	%>
	
	<script>
		alert("<%=user_id%>님의 정보 삭제가 완료되었습니다.");
		window.location.href="./memberlist.jsp";
	</script>
	
</body>
</html>

