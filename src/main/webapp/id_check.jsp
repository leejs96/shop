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
			String check_id = request.getParameter("id");
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT count(*) as c FROM shopping_member WHERE member_id = '"+check_id+"'";
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			/* response.setContentType("application/json");
			PrintWriter outt = response.getWriter(); */
			
// 			if(!rs.next())
// 			{
// 				alert("ID로 사용할 수 있습니다.");
// 			}
// 			else
// 			{
<%-- 		%> alert("ID로 사용할 수 없습니다."); --%>
<%-- 		<%		 --%>
// 			}
		%>
	</body>
</html>