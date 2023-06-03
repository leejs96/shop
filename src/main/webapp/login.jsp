<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%String user_id = (String)session.getAttribute("member_id"); %>
	<p><%=user_id %></p>
	<div id = "page">
		<form name="loginform" action=login_ok.jsp method=get onSubmit="return login();">
			<table style = "margin : 5% auto;">
				<tr>
					<td><input type = "text" name = "user_id" id = "user_id" placeholder = "ID"></td>
				</tr>
				<tr>
					<td><input type = "password" name = "user_pw" id = "user_pw" placeholder = "password"></td>
				</tr>
				<tr>
					<td class = "button"><input type = "submit" value = "로그인"></td>
				</tr>
			</table>
		</form>
		<button class = "button" onclick = "location = 'member.jsp'">회원가입</button>
		<br>		
		회원관리
		<input type = "text" name = "manage_num" id = "manage_num" placeholder = "관리자번호">
		<button onclick = "manage();">확인</button>
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
			window.location.href="./member_list.jsp";
		} else {
			alert("관리자번호를 입력하세요.");
			return false;
		}
	}
</script>