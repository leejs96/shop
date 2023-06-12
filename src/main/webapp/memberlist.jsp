<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="./dbconn.jsp" %>
		<title>회원리스트</title>
		
		<link rel="stylesheet" href = "./css/nav.css">
		<link rel="stylesheet" href = "./css/mem_list.css?">
	</head>
	
	<body>
		<div class = "navigation_bar">
			<div class = "navigation_bar" style = "float : left;">
				<ul class = "list">
					<li class = "menu"><a href = "main.jsp">Home</a></li>
				</ul>
			</div>
			<div class = "navigation_bar" style = "float : right;">
				<ul class = "list">
					<li class = "menu" style = "padding-right: 10px;"><a href = "dept.jsp">부서관리페이지</a></li>
					<li class = "menu" style = "padding-right: 10px;"><a href = "memberlist.jsp">관리자페이지</a></li>
					<li class = "menu"><a href = "logout.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	
		<div class = "wrap">
			<h1>회원관리</h1>
			<form name="SearchForm" action=memberlist_search.jsp method=get style = "margin : 5px; border : 1px solid;">
					<h2 style = "margin-left: 15px; margin-bottom: 10px;">검색조건</h2>
					<div style = "margin-left: 28px;">
						<select name = "opt" id = "opt">
							<option value = "1">항목</option>
							<option value = "member_id">ID</option>
							<option value = "member_name">이름</option>
							<option value = "dept_Name">부서명</option>
							<option value = "zipcode">우편번호</option>
							<option value = "lot_addr">지번주소</option>
							<option value = "road_addr">도로명주소</option>
						</select>
						<input type = "search" name = "search" style = "height : 25px;">
						<input type = "submit" id = "submit" value = "검색">
					</div>
				<table id = "search_con">
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
				<button onclick = "window.location.reload()">전체 리스트보기</button>
			</div>
			<table border = "1" id = "list">
				<tr style = "background: #94AF9F">
					<td>No</td>
					<td>ID</td>
					<td>이름</td>
					<td>부서명</td>
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
					<td>정보수정</td>
					<td>회원삭제</td>
				</tr>
				
				<%
				int i = 1;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM shopping_member INNER JOIN dept ON shopping_member.dept_No = dept.dept_No ORDER BY member_id ASC";
				pstmt = conn.prepareStatement(sql);
			
				// 4) 실행
				rs = pstmt.executeQuery();
			
				// 5) 결과를 테이블에 출력
				while (rs.next()) {
					String member_id = rs.getString("member_id");
					String name = rs.getString("member_name");
					String dept = rs.getString("dept_Name");
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
					<td><%=dept %></td>
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
					<td><button id = <%=member_id%> onclick = "mem_update(this.id);">수정</button></td>
					<td><button id = <%=member_id%> onclick = "mem_delete(this.id);">삭제</button></td>
				</tr>
				
			<%
				i++;
				}
			%>
			</table>
		</div>
	</body>
</html>

<script>
	function mem_delete(id) {
		if (confirm(id + "님의 계정을 삭제하시겠습니까?") == true) {
			var manage_num = prompt("관리자 비밀번호를 입력해주세요.");
	        if(manage_num == "0000") {
				location.href="memberlist_delete.jsp?target=" + id;
	        } else if(manage_num == null){
				return false;
	        } else {
	        	alert("관리자비밀번호가 일치하지 않습니다.");
				return false;
			}
		} else {
			return false;
		}
	}
	
	function mem_update(id) {
	}
</script>