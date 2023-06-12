<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="./dbconn.jsp" %>
		<title>Insert title here</title>
		
		<script>
			function validateForm() {
				var dept_name = document.change.dept_name.value;
				
				if(dept_name.length > 0) {
					return true;
				} else {
					alert("부서명을 입력해주세요.");
					return false;
				}
			}
		</script>
	</head>
	<body>
		<h1>부서정보 변경</h1>
			<form name = change action=dept_update.jsp method=get onSubmit="return validateForm();">
				<%
				String dept_no=request.getParameter("dept_no");
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM dept WHERE dept_No ='" + dept_no + "' ORDER BY dept_No ASC";
				pstmt = conn.prepareStatement(sql);
			
				// 4) 실행
				rs = pstmt.executeQuery();
			
				// 5) 결과를 테이블에 출력
				while (rs.next()) {
					String dept_No = rs.getString("dept_No");
					String dept_Name = rs.getString("dept_Name");
				%>
				<table border = "1" id = "list">
					<tr>
						<td>부서코드</td>
						<td>
							<input type = text name = dept_no value = <%=dept_No%>>
						</td>
					</tr>
					<tr>
						<td>부서명</td>
						<td>
							<input type = text name = dept_name value = <%=dept_Name%>>
						</td>
					</tr>
					<tr>
						<td>
							<input type = submit value = '수정'>
						</td>
					</tr>
				<%
				}
				%>
				</table>	
			</form>
	</body>
</html>