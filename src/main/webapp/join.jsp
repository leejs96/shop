<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="./dbconn.jsp" %>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="stylesheet" href = "./css/member.css">
		
		<script>
			function check_id(user_id) { // 아이디 체크
				var id_len = user_id.length;
				
				if(id_len>=5 && id_len <=8) {
					var regex = /^[A-Za-z0-9+]*$/;
					if (regex.test(user_id)) 
					{ 
						return true;
					} else 
					{
						alert('영어와 숫자가 혼용된 아이디를 설정해주세요.');
						document.Registform.user_id.focus();
						return false;
					}
				}
				else
				{
					alert('5~8자리 아이디를 설정해주세요.');
					document.Registform.user_id.focus();
					return false;
				}
			}
		
			function check_pw(pw1, pw2) { //비밀번호체크
				if(pw1.length >= 4)
				{
					if(pw1 == pw2) {
						return true;
					} else {
						alert('비밀번호가 일치하지않습니다.');
						return false;
					}
				} else
				{
					alert('4자리 이상의 비밀번호를 입력해주세요.');
					document.Registform.user_pw.focus();
					return false;
				}
			}
			
			function check_name(user_name) { // 이름 체크
				if(user_name.length > 0) {

					var regex = /^[ㄱ-ㅎㅏ-ㅣ가-힣]*$/;
					if (regex.test(user_name)) 
					{ 
						return true;
					} else 
					{
						alert('이름을 한글로 적어주세요.');
						document.Registform.user_name.focus();
						return false;
					}
				}
				else
				{
					alert('이름을 입력해주세요.');
					document.Registform.user_name.focus();
					return false;
				}
			}
			
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
			
			function check_gender(gender) { //성별체크
				if(gender == "male" || gender == "female")
				{
					return true;
				} else
				{
					alert('성별을 선택해주세요.');
					return false;
				}
			}
			
			function check_birth(Y, M, D, sl) { // 생년월일체크
				if(Y.length == 4 && M.length == 2 && D.length == 2)
				{
					if (sl == "양" || sl == "음")
						{
							return true;
						} else {
							alert('양/음력을 체크해주세요.');
							return false;
						}
				} else
				{
					alert('생년월일을 입력해주세요.');
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
					document.Registform.user_hp1.focus();
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
								document.Registform.user_email2.focus();
								return false;
							}
					} else {
						alert('이메일을 입력해주세요.');
						document.Registform.user_email1.focus();
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
				console.log('확인');
		    	
		    	var user_id = document.Registform.user_id.value;
		    	var pw1 = document.Registform.user_pw.value;
		    	var pw2 = document.Registform.user_pw_ch.value;
		    	var user_name = document.Registform.user_name.value;
		    	var dept = document.Registform.select_dept.value;
		    	var gender = document.Registform.gender.value;
		    	var Y = document.Registform.user_birth_y.value;
		    	var M = document.Registform.user_birth_m.value;
		    	var D = document.Registform.user_birth_d.value;
		    	var sl = document.Registform.birth_SL.value;
		    	var hp1 = document.Registform.user_hp1.value;
		    	var hp2 = document.Registform.user_hp2.value;
		    	var hp3 = document.Registform.user_hp3.value;
		    	var email1 = document.Registform.user_email1.value;
		    	var email2 = document.Registform.user_email2.value;
		    	var addr1 = document.Registform.zipcode.value;
		    	var addr2 = document.Registform.lot_addr.value;
		    	var addr3 = document.Registform.road_addr.value;
		    	   
		    	if (check_id(user_id)) 
		    	{
		    		if(check_pw(pw1, pw2))
		    		{
		    			if (check_name(user_name)) 
		    			{
		    				if (check_dept(dept)) 
			    				{
			    				if(check_gender(gender))
			    				{
			    					if(check_birth(Y, M, D, sl)) 
		    						{
					    				if(check_hp(hp1, hp2, hp3))
					    				{
					    					if(check_email(email1, email2))
					    					{
						    					if(check_address(addr1, addr2, addr3)) {
					    							return true;
						    					} else {
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
		    	} else
		    	{
		    		return false;
		    	}
	    	}
			
    	</script>
	</head>
	
	<body>
		<div class = "wrap">
			<h1>회원가입</h1>
			<h2>필수입력사항</h2>
			<form name="Registform" action=join_ok.jsp method=post onSubmit="return validateForm();">
				<table id = "joinT">
					<tr>
						<td class = "title" >아이디</td>
						<td colspan = "2">
							<input type = "text" name=user_id id=user_id>
							<button type = "button" onclick = "check()">중복확인</button>
						</td>
					</tr>
					<tr>
						<td class = "title">비밀번호</td> 
						<td colspan = "2"><input type = "password" name=user_pw id=user_pw value = "1111"></td>
					</tr>
					<tr>
						<td class = "title">비밀번호 확인</td>
						<td colspan = "2"><input type = "password" name=user_pw_ch id=user_pw_ch value = "1111"></td>
					</tr>
					<tr>
						<td class = "title">이름</td>
						<td colspan = "2"><input type = "text" name=user_name id=user_name></td>
					</tr>
					<tr>
						<td class = "title">부서명</td>
						<td colspan = "2">
							<select name = "select_dept">
								<option value = "1">선택</option>
								<option value = "10">인사팀</option>
								<option value = "20">재무팀</option>
								<option value = "30">기획팀</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class = "title">성별</td>
						<td colspan = "2">
							<input type = "radio" name = "gender" value = "male">남자
							<input type = "radio" name = "gender" value = "female">여자
						</td>
					</tr>
					<tr>
						<td class = "title">법정생년월일</td>
						<td colspan = "2">
							<input type = "text" name=user_birth_y id=user_birth_y class = "birth" value = "1996">/<input type = "text" name=user_birth_m id=user_birth_m class = "birth" value = "01">/<input type = "text" name=user_birth_d id=user_birth_d class = "birth" value = "01">
							<input type = "radio" name = "birth_SL" value = "양" checked>양력
							<input type = "radio" name = "birth_SL" value = "음">음력
						</td>
					</tr>
					<tr>
						<td rowspan = "2" class = "title">휴대폰번호</td> 
						<td colspan = "2" class = "hp"><input type = "text" name=user_hp1 class = "hp" id=user_hp1 value = "010">-<input type = "text" name=user_hp2  class = "hp" id=user_hp2 value = "1111">-<input type = "text" name=user_hp3  class = "hp" id=user_hp3 value = "1111"></td>
					</tr>
					<tr>
						<td colspan = "2">
							<input type = "checkbox" name = "sms" value = "Y" id = "sms">쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
						</td>
					</tr>
					<tr>
						<td rowspan = "2" class = "title">이메일<br>(e-mail)</td>
						<td colspan = "2"><input type = "text" name=user_email1 id=user_email1 value = "aaa">@<input type = "text" name=user_email2 id=user_email2 value="naver.com">
							<select name = "select_email" onchange="selectEmail();">
								<option value = "1">직접입력 </option>
								<option value = "naver.com">naver.com</option>
								<option value = "gmail.com">gmail.com</option>
								<option value = "daum.net">daum.net</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan = "2"><input type = "checkbox" name = "emailsts" value = "Y" id = "emailsts">
						쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
					</tr>
					<tr>
						<td rowspan = "8" class = "title">주소</td>
						<td class = "addrTitle">우편번호</td>
						<td class = "addr">
							<input type = "text" name=zipcode id = zipcode value = "13536">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">지번주소</td>
						<td class = "addr">
							<input type = "text" name=lot_addr id = lot_addr>
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">도로명주소</td>
						<td class = "addr">
							<input type = "text" name=road_addr id = road_addr value = "경기 성남시 분당구 판교역로10번길 3">
						</td>
					</tr>
					<tr>
						<td class = "addrTitle">나머지주소</td>
						<td class = "addr">
							<input type = "text" name=rest_addr>
						</td>
					</tr>
				</table>
				
				<input type=submit value='회원 가입' class = "submit">
			</form>
		</div>
		
		<!-- <script>
			var check = function() {
				var user_id = document.Registform.user_id.value;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT count(*) as cnt FROM shopping_member WHERE member_id = '"user_id"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					int cnt = rs.getInt("cnt");
					out.print(rs.getString("cnt"));
					if (cnt != 0) {
						alert("사용할 수 없는 ID입니다.");
					} else{
						alert("사용할 수 있는 ID입니다.");
					}
				}
				
				alert(user_id);
			}
		</script> -->
		
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
		
		<%-- <script>
			function id_doublecheck() { // 아이디 중복확인 만들기부터 시작
		 		var id =  document.Registform.user_id.value;
				<%
			 	PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT count(*) as cnt FROM shopping_member WHERE member_id = '"%>id<%"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					int cnt = rs.getInt("cnt");
					out.print(rs.getString("cnt"));
					if (cnt != 0) {%>
						alert("사용할 수 없는 ID입니다.");
					<%} else{%>
						alert("사용할 수 있는 ID입니다.");
					<%}
				}
				%>
			}
		</script> --%>
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
