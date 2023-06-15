<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="../script/dbconn.jsp" %>
		<%@ include file="../script/nav_admin.jsp" %>
		
		<link rel="stylesheet" href = "../css/nav.css">
		<link rel="stylesheet" href = "../css/mem_list.css">
		<title>Insert title here</title>
		
		<script>
			function add() {
				const table = document.getElementById('list');
				
				const newRow = table.insertRow();
				
				const newCell1 = newRow.insertCell(0);
				const newCell2 = newRow.insertCell(1);
				const newCell3 = newRow.insertCell(2);
				const newCell4 = newRow.insertCell(3);
				var frmTag1 = "<input type=text name=addNo>";
				var frmTag2 = "<input type=text name=addName>";
				var add = "<input type=button value = '추가' name = dept_add onclick='insert();'>"
				newCell1.innerHTML = frmTag1;
				newCell2.innerHTML = frmTag2;
				newCell3.innerHTML = add;
				
			}
			
			function insert() {
				var no = document.dept.addNo.value;
				var name = document.dept.addName.value;
				
				location.href="dept_update.jsp?target=insert&dept_no=" + no + "&dept_name=" + name;
			}
		</script>
	</head>
	
	<body>
			
		<div class = "wrap">
			<h1>부서관리</h1>
			
			<div style = "margin-top: 20px;">
				<button onclick = "add();">부서 추가하기</button>
			</div>
			
			<form name = dept>
				<table border = "1" id = "list">
					<tr style = "background: #94AF9F">
						<td>부서코드</td>
						<td>부서명</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
					
					<%
					int i = 1;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = "SELECT * FROM dept ORDER BY dept_No ASC";
					pstmt = conn.prepareStatement(sql);
				
					// 4) 실행
					rs = pstmt.executeQuery();
				
					// 5) 결과를 테이블에 출력
					while (rs.next()) {
						String dept_No = rs.getString("dept_No");
						String dept_Name = rs.getString("dept_Name");
					%>
					<tr>
						<td><%=dept_No%></td>
						<td><%=dept_Name%></td>
						<td>
							<input type = button value = 수정 onclick = 'dept_update(<%=dept_No%>)'>
						</td>
						<td>
							<input type = button value = '삭제' onclick = 'dept_delete(<%=dept_No %>)'>
						</td>
					</tr>
					
					<%
					i++;
					}
					%>
				</table>	
			</form>
		</div>
	</body>
</html>

<script>
	function dept_delete(dept_no) {
		if (confirm("부서코드 " + dept_no + "번을 삭제하시겠습니까?") == true) {
			var manage_num = prompt("관리자 비밀번호를 입력해주세요.");
	        if(manage_num == "0000") {
				location.href="dept_update.jsp?target=delete&dept_no=" + dept_no;
	        } else if(manage_num == null){
				return false;
	        } else {
	        	alert("관리자비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	}
	
	function dept_update(dept_No) {
		window.open("http://localhost:8060/web02/change_dept.jsp?dept_no=" + dept_No, "name(about:blank)", "width=500, height=500");
	}
</script>

<style>
.menu2:hover .submenu {display : block;}

.sub_menu {
	display : none;
	position : absolute;
}
</style>