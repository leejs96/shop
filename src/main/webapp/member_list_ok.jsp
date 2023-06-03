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
	<% 
		String opt=request.getParameter("opt");
		String search=request.getParameter("search");
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM shopping_member WHERE " + opt + " like '%" + search + "%'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			count++;
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
			<form name="SearchForm" action=member_list_ok.jsp method=get onSubmit="return validateForm();">
			<table>
				<tr>
					<td>
						<select name = "opt" id = "opt" >
							<option value = "1">항목</option>
							<option value = "D">ID</option>
							<option value = "member_name">이름</option>
							<option value = "lot_addr">지번주소</option>
							<option value = "road_addr">도로명주소</option>
						</select>
					</td>
					<td>
						<input type = "text" name = "search" id = "search">
					</td>
					<td>
						<input type = "submit" >
					</td>
				</tr>
			</table>
		</form>
		<button onclick = "location = 'login.jsp'">전체 리스트보기</button>
			<table border = "1" id = "list">
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
		if(count == 0) {
			out.print("검색결과가 없습니다.");
		}
	%>
</body>
</html>