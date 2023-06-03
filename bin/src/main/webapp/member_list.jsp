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
<button onclick = "location = 'login.jsp'">홈</button>
<!-- <form>
	<input type
</form> -->
	<div style = "overflow-x: scroll; width: max-content;">
		<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM shopping_member ORDER BY member_name ASC";
		pstmt = conn.prepareStatement(sql);
	
		// 4) 실행
		rs = pstmt.executeQuery();
	
		// 5) 결과를 테이블에 출력
		while (rs.next()) {
			String member_id = rs.getString("member_id");
			String name = rs.getString("member_name");
			String gender = rs.getString("member_gender");
			String birth_y = rs.getString("member_birth_y");
			String birth_m = rs.getString("member_birth_m");
			String birth_d = rs.getString("member_birth_d");
			String birth_gn = rs.getString("member_birth_gn");
			String HP1 = rs.getString("HP1");
			String HP2 = rs.getString("HP2");
			String HP3 = rs.getString("HP3");
			String SMS_YN = rs.getString("SMS_YN");
			String email1 = rs.getString("email1");
			String email2 = rs.getString("email2");
			String emailsts_YN = rs.getString("emailsts_YN");
			String DBzipcode = rs.getString("zipcode");
			String DBlot_addr = rs.getString("lot_addr");
			String DBroad_addr = rs.getString("road_addr");
			String DBrest_addr = rs.getString("rest_addr");
			String joindate = rs.getString("joindate");
			
			
		%>
		<table border = "1">
			<tr>
					<td>ID</td><td class = "id"><%=member_id%></td>
					<td>이름</td><td><%=name %></td>
					<td>성별</td><td><%=gender %></td>
					<td>생년월일</td><td><%=birth_y%>/<%=birth_m%>/<%=birth_d%>(<%=birth_gn%>)</td>
					<td>HP</td><td><%=HP1%>-<%=HP2%>-<%=HP3%></td>
					<td>sms수신</td><td><%=SMS_YN%></td>
					<td>이메일</td><td><%=email1%>@<%=email2%></td>
					<td>메일수신</td><td><%=emailsts_YN%></td>
					<td>우편번호</td><td><%=DBzipcode%></td>
					<td>지번주소</td><td><%=DBlot_addr%></td>
					<td>도로명주소</td><td><%=DBroad_addr%></td>
					<td>나머지주소</td><td><%=DBrest_addr%></td>
					<td>가입날짜</td><td><%=joindate%></td>
			</tr>
		</table>
		<%
			}
		%>
	</div>
</body>
</html>

<style>
	table {table-laylout : fixed; width : 100%;}

	td:nth-child(odd) {
		background : #E5E4CC;
		width : max-content;
	}
	
	td:nth-child(even){
		width : max-content;
	}
</style>
