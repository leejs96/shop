<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./dbconn.jsp" %>
<link rel="stylesheet" href = "./css/member.css?after">
<title>정보페이지</title>

<script>
function check_pw(pw1, pw2) {
	if(pw1.length >= 4)
	{
		if(pw1==pw2) {
			return true;
		} else {
			alert('비밀번호가 일치하지않습니다.');
			return false;
		}
	} else
	{
		alert('4자리 이상의 비밀번호를 입력해주세요.');
		document.my_info.user_pw.focus();
		return false;
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
	var regex = /^[0-9]+$/;
	if (regex.test(addr1) && addr1.length > 0) {
		if (addr2.length > 0 && addr3.length > 0) {
			return true;
		} else {
			alert('주소를 입력해주세요.');
			return false;
		}
	} else {
		alert('정확한 우편번호(숫자) 입력해주세요.');
		return false;
	}
}

function validateForm() {
	/* console.log('확인'); */
	
	var pw1 = document.my_info.user_pw.value;
	var pw2 = document.my_info.user_pw.value;
	var hp1 = document.my_info.user_hp1.value;
	var hp2 = document.my_info.user_hp2.value;
	var hp3 = document.my_info.user_hp3.value;
	var email1 = document.my_info.user_email1.value;
	var email2 = document.my_info.user_email2.value;
	var addr1 = document.my_info.zipcode.value;
	var addr2 = document.my_info.lot_addr.value;
	var addr3 = document.my_info.road_addr.value;
	   
	if(check_pw(pw1, pw2)) {
		if(check_hp(hp1, hp2, hp3))
		{
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
	<div style = "text-align: center; margin: 1% auto; padding-left: 35%; width : 605px;">
		<button onclick = "location = 'main.jsp'" class = "top">홈</button>
		<button onclick = "location = 'logout.jsp'" class = "top">로그아웃</button>
	</div>
	<h1 style = "text-align : center;">내 정보</h1>
	<%
		String user_id = (String)session.getAttribute("member_id");
		/* out.print(user_id); */
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
	<div  class = "wrap">
		<form name="my_info" action=update.jsp method=post onSubmit="return validateForm();">
			<table border = "1">
				<tr>
					<td class = "title">아이디</td>
					<td colspan = "2"><input type = "text" name=user_id id=user_id value = <%=member_id%> disabled></td>
				</tr>
				<tr>
					<td class = "title">비밀번호</td>
					<td colspan = "2"><input type = "password" name=user_pw id=user_pw></td>
				</tr>
				<tr>
					<td class = "title">비밀번호 확인</td>
					<td colspan = "2"><input type = "password" name=user_pw_ch id=user_pw_ch></td>
				</tr>
				<tr>
					<td class = "title">이름</td>
					<td colspan = "2"><input type = "text" name=user_name id=user_name value=<%=name%> disabled></td>
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
					<td colspan = "2" class = "addr">
						<input type = "text" name=zipcode id=zipcode value=<%=DBzipcode%> class=addr>
					</td>
					
				</tr>
				<tr>
					<td class = "addrTitle">지번주소</td>
					<td colspan = "2" class = "addr">
						<input type = "text" name=lot_addr id=lot_addr value=<%=DBlot_addr%> class=addr>
					</td>
				</tr>
				<tr>
					<td class = "addrTitle">도로명주소</td>
					<td colspan = "2" class = "addr">
						<input type = "text" name=road_addr id=road_addr value=<%=DBroad_addr%> class=addr>
					</td>
				</tr>
				<tr>
					<td class = "addrTitle">나머지주소</td>
					<td colspan = "2"  class = "addr">
						<input type = "text" name=rest_addr id=rest_addr value=<%=DBrest_addr%> class=addr>
					</td>
				</tr>
				<tr>
					<td class = "title">가입날짜</td>
					<td colspan = "2"><input type = "text" id = "joindate" value = <%=joindate %> disabled></td>
				</tr>
			</table>
			<input type = "submit" value = "수정" class = "submit">
		</form>
		
		<button onclick = "location = 'delete.jsp'" id = "delete">회원탈퇴</button>
	<%}%>
	</div>
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
</script>