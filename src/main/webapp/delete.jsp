<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 탈퇴하기</title>
</head>
<body>
	<h1>계정삭제</h1>
	<%String user_id = (String)session.getAttribute("member_id");%>
	<p><%=user_id%>님, 계정을 지우시겠습니까??</p>
	<form name="delete" action=delete_ok.jsp method=get onSubmit="return check();" style = "margin-left : 40px;">
		<table style = "border: 1px solid black;">
			<tr>
				<td style = "width : 115px; padding-right: 0;;">계정삭제 이유</td>
				<td colspan = "2" style = "padding-left: 0;"><textarea cols="40" rows="3"></textarea></td>
			</tr>
			<tr>
				<td colspan = "2" style = "padding-top: 24px;">계정을 삭제하시려면 비밀번호를 입력하세요.</td>
			</tr>
			<tr>
				<td colspan = "3" style = "padding-bottom: 10px;"><input type = "password" name=user_pw id=user_pw></td>
			</tr>
		</table>
		<div>
			<input type = "submit" value = "탈퇴하기" id = "delete">
		</div>
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
			if (confirm("정말 계정을 삭제하시겠습니까?") == true) {
				return true;
			} else {
				return false;
			}
		}
	}
	
</script>


<style>
	body {
		min-width: 1340px;
		display: block;
	    margin: 15px;
	}

	h1 {
		font-size : 50px;
		color : #576F72;
	}
	
	p {
		font-size : 25px;
		margin-left : 30px;
	}

	td {
		padding-left: 12px;
	    padding-right: 14px;
	    font-weight: bold;
	}
	
	#delete {
	margin-top : 5px;
    height: 30px;
    color: #F15A59;
    background: #F2E3DB;
    border: 1px solid beige;
	}
</style>