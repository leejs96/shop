<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../script/dbconn.jsp" %>
<title>Insert title here</title>
</head>
<body>
	<%
		String update=request.getParameter("update");
		String target=request.getParameter("target");
		PreparedStatement pstmt = null;
		if(update==null) {
			String user_id=request.getParameter("user_id");
			String hp1=request.getParameter("user_hp1");
			String hp2=request.getParameter("user_hp2");
			String hp3=request.getParameter("user_hp3");
			String sms=request.getParameter("sms");
			String email1=request.getParameter("user_email1");
			String email2=request.getParameter("user_email2");
			String emailsts=request.getParameter("emailsts");
			String zipcode=request.getParameter("zipcode");
			String jibun_addr=request.getParameter("jibun_addr");
			String road_addr=request.getParameter("road_addr");
			String rest_addr=request.getParameter("rest_addr");
			
			pstmt = null;
			String sql = "UPDATE shopping_member SET HP1 =?, HP2 =?, HP3 =?, SMS_YN =?, email1 =?, email2 =?, emailsts_YN =?, zipcode =?, jibun_addr =?, road_addr =?, rest_addr =? WHERE member_id ='" + user_id + "'";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hp1);
			pstmt.setString(2, hp2);
			pstmt.setString(3, hp3);
			pstmt.setString(4, sms);
			pstmt.setString(5, email1);
			pstmt.setString(6, email2);
			pstmt.setString(7, emailsts);
			pstmt.setString(8, zipcode);
			pstmt.setString(9, jibun_addr);
			pstmt.setString(10, road_addr);
			pstmt.setString(11, rest_addr);
			
			pstmt.executeUpdate();
			
			pstmt.close();
	%>
		<script>
			alert("<%=user_id%>님의 정보가 수정되었습니다.");
			/* window.close();
			opener.location.reload(); */
		</script>
		
	<%}else{
			String sql = "DELETE FROM shopping_member WHERE member_id ='" + target + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
	%>
		<script>
			alert("<%=target%>님의 정보 삭제가 완료되었습니다.");
			window.location.href="./memberlist.jsp";
		</script>
	<%}%>
	
</body>
</html>

