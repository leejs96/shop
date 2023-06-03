<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<
<head>
<meta charset="UTF-8">
<%@page session="true"%>
<%@ include file="./dbconn.jsp" %>
<title>Insert title here</title>
</head>
<body>
	<h1>정보 업데이트</h1>
	<%
		String user_id = (String)session.getAttribute("member_id");		
	
		String user_pw=request.getParameter("user_pw");
		String hp1=request.getParameter("user_hp1");
		String hp2=request.getParameter("user_hp2");
		String hp3=request.getParameter("user_hp3");
		String sms=request.getParameter("sms");
		String email1=request.getParameter("user_email1");
		String email2=request.getParameter("user_email2");
		String emailsts=request.getParameter("emailsts");
		String zipcode=request.getParameter("zipcode");
		String lot_addr=request.getParameter("lot_addr");
		String road_addr=request.getParameter("road_addr");
		String rest_addr=request.getParameter("rest_addr");
	%>
	<table>
		<tr>
			<td><%=user_pw%></td>
			<td><%=hp1%></td>
			<td><%=hp2%></td>
			<td><%=hp3%></td>	
			<td><%=sms%></td>
			<td><%=email1%></td>
			<td><%=email2%></td>
			<td><%=emailsts%></td>
			<td><%=zipcode%></td>
			<td><%=lot_addr%></td>
			<td><%=road_addr%></td>
			<td><%=rest_addr%></td>
		</tr>
	</table>
	<%
		PreparedStatement pstmt = null;
		out.print(hp1);
		String sql = "UPDATE shopping_member SET member_pw = ?, HP1 =?, HP2 =?, HP3 =?, SMS_YN =?, email1 =?, email2 =?, emailsts_YN =?, zipcode =?, lot_addr =?, road_addr =?, rest_addr =? WHERE member_id ='" + user_id + "'";

		
		pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1,user_pw);
		pstmt.setString(2,hp1);
		pstmt.setString(3, hp2);
		pstmt.setString(4, hp3);
		pstmt.setString(5, sms);
		pstmt.setString(6, email1);
		pstmt.setString(7, email2);
		pstmt.setString(8, emailsts);
		pstmt.setString(9, zipcode);
		pstmt.setString(10, lot_addr);
		pstmt.setString(11, road_addr);
		pstmt.setString(12, rest_addr);
		
		out.print(sql);
		pstmt.executeUpdate();
		
		pstmt.close();
		%>
		<script>
			alert("정보가 수정되었습니다.");
			window.location.href="./my_info.jsp";
		</script>
</body>
</html>