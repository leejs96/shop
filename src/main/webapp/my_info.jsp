<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="./dbconn.jsp" %>
		<link rel="stylesheet" href = "./css/nav.css?after">
		<link rel="stylesheet" href = "./css/member.css?after">
		<title>정보페이지</title>
	
		<script>
			function check_dept(dept) {
				if(dept == "1")
				{
					alert('부서를 선택해주세요.');
					return false;
				} else
				{
					return true;
				}
			}
			
			function check_hp(hp1, hp2, hp3) { //핸드폰번호 체크
				if(hp1.length == 3 && hp2.length == 4 && hp3.length == 4)
				{
					return true;
				} else
				{
					alert('핸드폰 번호를 입력해주세요');
					document.my_info.user_hp1.focus();
					return false;
				}
			}
			
			function check_email(email1, email2) { // 이메일체크
				var regex = /^[a-zA-z]+\.[a-zA-z]+$/;
					if(email1.length > 0) {
						if (regex.test(email2)) {
								return true;
							} else {
								alert('이메일 입력양식과 일치하지않습니다.');
								document.my_info.user_email2.focus();
								return false;
							}
					} else {
						alert('이메일을 입력해주세요.');
						document.my_info.user_email1.focus();
						return false;
					}
			}
			
			function check_address(addr1, addr2, addr3) {
				if (addr1.length > 0 && (addr2.length > 0 || addr3.length > 0)) {
					return true;
				} else {
					alert('주소를 입력해주세요.');
					return false;
				}
			}
			
			function validateForm() {
				/* console.log('확인'); */
				
				var dept = document.my_info.select_dept.value;
				var hp1 = document.my_info.user_hp1.value;
				var hp2 = document.my_info.user_hp2.value;
				var hp3 = document.my_info.user_hp3.value;
				var email1 = document.my_info.user_email1.value;
				var email2 = document.my_info.user_email2.value;
				var addr1 = document.my_info.zipcode.value;
				var addr2 = document.my_info.lot_addr.value;
				var addr3 = document.my_info.road_addr.value;
				   
				if(check_dept(dept)) {
					if(check_pw(pw1, pw2)) {
						if(check_email(email1, email2))
						{
								if(check_address(addr1, addr2, addr3))
								{
									return true;
								} else
								{
									return false;
								} 
						} else 
						{
							return false;
						}
					} else
					{
						return false;
					}
				} else
				{
					return false;
				}
			}
		</script>
	</head>
	
	<body>
		<%String user_id = (String)session.getAttribute("member_id"); %>
	
		<div class = "navigation_bar">
				<ul class = "list">
					<li class = "menu" style = "float : left;"><a href = "main.jsp">Home</a></li>
					<% if(user_id == null) {%>
							<li class = "menu"><a href = "login.jsp">로그인</a></li>
					<%} else {%>
							<li class = "menu"><a href = "logout.jsp">로그아웃</a></li>
							<li class = "menu" style = "padding-right: 10px;"><a href = "my_info.jsp">마이페이지</a></li>
					<%}%>
				</ul>
		</div>
	
		<div  class = "wrap" style = "width: 615px;">
			<h1>내 정보</h1>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM shopping_member WHERE member_id = '" + user_id + "'";
				pstmt = conn.prepareStatement(sql);
				// 4) 실행
				rs = pstmt.executeQuery();
				// 5) 결과를 테이블에 출력
				if (rs.next()) {
					String member_id = rs.getString("member_id");
					String pw = rs.getString("member_pw");
					String name = rs.getString("member_name");
					String dept = rs.getString("dept_No");
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
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편번호검색 -->
			<script>
				function sample6_execDaumPostcode() {
				    new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				            var addr = ''; // 주소 변수
				            var extraAddr = ''; // 참고항목 변수
				
				            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                addr = data.roadAddress;
					            document.getElementById("road_addr").value = addr;
				            } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                addr = data.jibunAddress;
					            document.getElementById("lot_addr").value = addr;
				            }
				            document.getElementById('zipcode').value = data.zonecode;
				        }
				    }).open();
				}
			</script>
		
			<form name="my_info" action=info_update.jsp method=get onSubmit="return validateForm();">
				<table>
					<tr>
						<td class = "title">아이디</td>
						<td colspan = "2"><input type = "text" name=user_id id=user_id value = <%=member_id%> disabled></td>
					</tr>
					<tr>
						<td class = "title">비밀번호</td>
						<td colspan = "2">
							<input type = "password" name=user_pw id=user_pw disabled>
							<input type="button" value="비밀번호 변경" onclick="change_pw()">
						</td>
					</tr>
					<tr>
						<td class = "title">이름</td>
						<td colspan = "2"><input type = "text" name=user_name id=user_name value=<%=name%> disabled></td>
					</tr>
					<tr>
						<td class = "title">부서명</td>
						<td colspan = "2">
							<select name = "select_dept">
								<option value = "1">선택</option>
								<option value = "10" <%if(dept.equals("10")) {%>selected<%} %>>인사팀</option>
								<option value = "20" <%if(dept.equals("20")) {%>selected<%} %>>재무팀</option>
								<option value = "30" <%if(dept.equals("30")) {%>selected<%} %>>기획팀</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class = "title">성별</td>
						<td colspan = "2">
							<input type = "radio" name = "gender" value = "male" 
							<%if(gender.equals("male")) out.print("checked");%>
							>남자
							<input type = "radio" name = "gender" value = "female" 
							<%if(gender.equals("female")) out.print("checked");%>>여자
						</td>
					</tr>
					<tr>
						<td class = "title">법정생년월일</td>
						<td colspan = "3">
							<input type = "text" name=user_birth_y id=user_birth_y value = <%=birth_y%> class = "birth">/<input type = "text" name=user_birth_m id=user_birth_m value = <%=birth_m%> class = "birth">/<input type = "text" name=user_birth_d id=user_birth_d value =<%=birth_d%> class = "birth">
							<input type = "radio" name = "birth_SL" value = "양" <%if(birth_gn.equals("양")) {%>checked<%} %>>양력
							<input type = "radio" name = "birth_SL" value = "음" <%if(birth_gn.equals("음")) {%>checked<%} %>>음력
						</td>
					</tr>
					<tr>
						<td rowspan = "2" class = "title">휴대폰번호</td>
						<td colspan = "3">
							<input type = "text" name=user_hp1 id=user_hp1 value = <%=HP1%> class = "hp">-<input type = "text" name=user_hp2 id=user_hp2 value = <%=HP2%> class = "hp">-<input type = "text" name=user_hp3 id=user_hp3 value = <%=HP3%> class = "hp">
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<input type = "checkbox" name = "sms" value='Y' id="sms" <%if(SMS_YN.equals("Y")) {%>checked<%} %>>
							<input type="hidden" name="sms" value='N' id="sms_hidden">
							쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
						</td>
					</tr>
					<tr>
						<td rowspan = "2" class = "title">이메일<br>(e-mail)</td>
						<td colspan = "3">
							<input type = "text" name=user_email1 id=user_email1 value = <%=email1%>>@<input type = "text" name=user_email2 id=user_email2 value = <%=email2%>>
							<select name = "select_email" onchange="selectEmail();">
								<option value = "1">직접입력</option>
								<option value = "naver.com">naver.com</option>
								<option value = "gmail.com">gmail.com</option>
								<option value = "daum.net">daum.net</option>
							</select>
						</td>
					</tr>
						<tr>
							<td colspan = "2"><input type = "checkbox" name = "emailsts" value = "Y"  id="emailsts" <%if(emailsts_YN.equals("Y")) {%>checked<%} %>>
							<input type="hidden" name="emailsts" value='N' id="emailsts_hidden">
							쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
						</tr>
					<tr>
						<td rowspan = "4" class = "title">주소</td>
						<td class = "addrTitle">우편번호</td>
						<td class = "addr">
							<input type = "text" name=zipcode id=zipcode value=<%=DBzipcode%>>
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">지번주소</td>
						<td class = "addr">
							<input type = "text" name=lot_addr id=lot_addr style = "width: 300px;" value="<%=DBlot_addr%>">
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">도로명주소</td>
						<td class = "addr">
							<input type = "text" name=road_addr id=road_addr style = "width: 300px;" value="<%=DBroad_addr%>">
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">나머지주소</td>
						<td class = "addr">
							<input type = "text" name=rest_addr id=rest_addr style = "width: 300px;" value="<%=DBrest_addr%>">
						</td>
					</tr>
					<tr>
						<td class = "title">가입날짜</td>
						<td colspan = "2"><input type = "text" id = "joindate" value = <%=joindate %> disabled></td>
					</tr>
				</table>
				<input type = "submit" value = "수정" class = "submit">
				<div>
					<input type = "button" onclick = "location = 'delete.jsp'" id = "delete" value = "회원탈퇴">
				</div>
			</form>
			
		<%}%>
		</div>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편번호검색 -->
		<script>
			function sample6_execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var addr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수
			
			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                addr = data.roadAddress;
				            document.getElementById("road_addr").value = addr;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                addr = data.jibunAddress;
				            document.getElementById("lot_addr").value = addr;
			            }
			            document.getElementById('zipcode').value = data.zonecode;
			        }
			    }).open();
			}
		</script>
		
	</body>
</html>

<script>
	function selectEmail() {
		var select_email = document.Registform.select_email.value;
		
		if (select_email == "1") {
			document.Registform.user_email2.value = "";
			document.Registform.user_email2.focus();
		} else {
			document.Registform.user_email2.value = document.Registform.select_email.value;
		}
	}
	
	function change_pw() {
		window.open("http://localhost:8060/web02/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
	}

</script>