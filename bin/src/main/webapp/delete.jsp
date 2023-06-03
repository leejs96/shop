<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form name="delete" action=delete_ok.jsp method=get onSubmit="return check();">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type = "password" name=user_pw id=user_pw></td>
				<td><input type = "submit" value = "확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>

<script>
	function check() {
		var pw = document.delete.user_pw.value;
		
		if(pw == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
			return true;
		}
	}
	
</script>
