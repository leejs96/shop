<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href = "./css/login.css?after">
</head>
<body>
	<div id = "page">
		<form name="loginform" action=login_ok.jsp method=post onSubmit="return login();">
			<table>
				<tr>
					<td colspan = "2"><input type = "text" name = "user_id" class = "user" placeholder = "ID"></td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "password" name = "user_pw" class = "user" placeholder = "PASSWORD"></td>
				</tr>
				<tr>
					<td><input type = "submit" value = "로그인" class = "submit"></td>
					<td><input type = "button" class = "submit" onclick = "location = 'join.jsp'" value = 회원가입 style = "background: #ACB1D6;"></td>
				</tr>
			</table>
		</form>

		<div id = "manage">
			회원관리
			<input type = "text" name = "manage_num" id = "manage_num" placeholder = "관리자번호">
			<button onclick = "manage();" style = "background-color: #E8E8E8; border: 1px solid #BBBFCA; height: 25px;">확인</button>
		</div>
	</div>
</body>
</html>

<script>
	function login() {
		var id = document.loginform.user_id.value;
		var pw = document.loginform.user_pw.value;
		
		if(id != "") {
			if(pw != "") {
				return true;
			} else {
				alert("비밀번호를 입력하세요.");
				return false;
			}
		} else {
			alert("아이디를 입력하세요.");
			return false;
		}
	}
	
	function manage() {
		var manage_code = "0000";
		var manage_num = document.getElementById("manage_num").value;
		if(manage_num==manage_code) {
			window.location.href="./memberlist.jsp";
		} else {
			alert("관리자번호를 입력하세요.");
			return false;
		}
	}
</script>