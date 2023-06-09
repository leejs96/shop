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
	<%
		String che = request.getParameter("checkN");
		request.setCharacterEncoding("UTF-8");
		String user_id = (String)session.getAttribute("member_id");		
	
		if(che == null) {
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
			String sql = "UPDATE shopping_member SET HP1 =?, HP2 =?, HP3 =?, SMS_YN =?, email1 =?, email2 =?, emailsts_YN =?, zipcode =?, lot_addr =?, road_addr =?, rest_addr =? WHERE member_id ='" + user_id + "'";
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hp1);
			pstmt.setString(2, hp2);
			pstmt.setString(3, hp3);
			pstmt.setString(4, sms);
			pstmt.setString(5, email1);
			pstmt.setString(6, email2);
			pstmt.setString(7, emailsts);
			pstmt.setString(8, zipcode);
			pstmt.setString(9, lot_addr);
			pstmt.setString(10, road_addr);
			pstmt.setString(11, rest_addr);
			
			out.print(sql);
			pstmt.executeUpdate();
			
			pstmt.close();
			%>
			<script>
				alert("정보가 수정되었습니다.");
				window.location.href="./my_info.jsp";
			</script>
		<%} else if(che.equals("change")) {
			String orgin_pw=request.getParameter("orgin_pw");
			String new_pw=request.getParameter("new_pw");
			String pw_che=request.getParameter("pw_che");
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT member_pw FROM shopping_member WHERE member_id = '" + user_id + "'";
			pstmt = conn.prepareStatement(sql);
			// 4) 실행
			rs = pstmt.executeQuery();
			// 5) 결과를 테이블에 출력
			if (rs.next()) {
				String pw = rs.getString("member_pw");
				if(pw.equals(orgin_pw)) {
					sql = "UPDATE shopping_member SET member_pw = ? WHERE member_id ='" + user_id + "'";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,new_pw);
					
					pstmt.executeUpdate();
					pstmt.close();
				} else {%>
				<script>
					alert("기존 비밀번호가 일치하지 않습니다.");
					history.go(-1);
			</script>
		<% }
			}
		%>
			<script>
				alert("새로운 비밀번호가 설정되었습니다.")
				window.close();
				opener.location.reload();
			</script>
		<%
		}
		%>
</body>
</html>