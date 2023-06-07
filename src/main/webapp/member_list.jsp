<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./dbconn.jsp" %>
<title>회원리스트</title>
<link rel="stylesheet" href = "./css/mem_list.css?after">

<script>
	function validateForm() {
		var opt = document.SearchForm.opt.value;
		var search = document.SearchForm.search.value;
		if(opt != "1") {
			alert("검색어를 입력하세요.");
			return false;
		} else {
			return true;
		}
	}
</script>

</head>
<body>
	<button onclick = "location = 'login.jsp'" id = "main">홈</button>
	<h1>회원리스트</h1>
	<form name="SearchForm" action=member_list_ok.jsp method=get onSubmit="return validateForm();" style = "margin : 5px;">
		<table>
			<tr><td id = "search" colspan = "2">검색조건</td></tr>
			<tr>
				<td colspan = "2">
					<select name = "opt" id = "opt" style = "width: 77px;">
						<option value = "1">항목</option>
						<option value = "member_id">ID</option>
						<option value = "member_name">이름</option>
						<option value = "lot_addr">지번주소</option>
						<option value = "road_addr">도로명주소</option>
					</select>
					<input type = "text" name = "search">
					<input type = "submit" id = "submit" value = "검색">
				</td>
			</tr>
			<tr>
				<td class="cond">성별</td>
				<td>
					<input type = "checkbox" name = "male" value = "male">남자
					<input type = "checkbox" name = "female" value = "female">여자
				</td>
			</tr>
			<tr>
				<td class="cond">SMS수신</td>
				<td>
					<input type = "checkbox" name = "SMSY" value = "Y">허용
					<input type = "checkbox" name = "SMSN" value = "N">미허용
				</td>
			</tr>
			<tr>
				<td class="cond">email수신</td>
				<td>
					<input type = "checkbox" name = "emailY" value = "Y">허용
					<input type = "checkbox" name = "emailN" value = "N">미허용
				</td>
			</tr>
		</table>
	</form>
	<div style = "margin-top: 20px;">
		<button onclick = "location = 'member_list.jsp'">전체 리스트보기</button>
	</div>
	<table border = "1" id = "list">
		<!-- <colgroup>
			<col width = "8%">
			<col width = "6%">
			<col width = "4%">
			<col width = "8%">
			<col width = "10%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
			<col width = "8%">
		</colgroup> -->
		<tr style = "background: #7D9D9C; color: white;">
			<td>num</td>
			<td>ID</td>
			<td>이름</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>HP</td>
			<td>sms수신</td>
			<td>이메일</td>
			<td>메일수신</td>
			<td>우편번호</td>
			<td>지번주소</td>
			<td>도로명주소</td>
			<td>나머지주소</td>
			<td>가입날짜</td>
			<td>회원삭제</td>
		</tr>
		
		<%
		int i = 1;
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
			<tr>
				<td><%=i%></td>
				<td><%=member_id%></td>
				<td><%=name %></td>
				<td><%=gender %></td>
				<td><%=birth_y%>/<%=birth_m%>/<%=birth_d%>(<%=birth_gn%>)</td>
				<td><%=HP1%>-<%=HP2%>-<%=HP3%></td>
				<td><%=SMS_YN%></td>
				<td><%=email1%>@<%=email2%></td>
				<td><%=emailsts_YN%></td>
				<td><%=DBzipcode%></td>
				<td><%=DBlot_addr%></td>
				<td><%=DBroad_addr%></td>
				<td><%=DBrest_addr%></td>
				<td><%=joindate%></td>
				<td><button id = <%=member_id%> onclick = "mem_delete(this.id);">삭제</button></td>
			</tr>
			
		<%
			i++;
			}
		%>
		</table>
	</body>
</html>

<script>
	function mem_delete(id) {
		alert(id + "행");
		location.href="admin_delete.jsp?target=" + id;
	}
</script>