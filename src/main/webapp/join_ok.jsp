<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="./dbconn.jsp" %>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
		request.setCharacterEncoding("UTF-8"); // post방식 사용시 한글 깨짐 방지
		String user_id=request.getParameter("user_id");
		String pw=request.getParameter("user_pw");
		String dept=request.getParameter("select_dept");
		String name=request.getParameter("user_name");
		String gender=request.getParameter("gender");
		String birth_y=request.getParameter("user_birth_y");
		String birth_m=request.getParameter("user_birth_m");
		String birth_d=request.getParameter("user_birth_d");
		String birth_SL=request.getParameter("birth_SL");
		String hp1=request.getParameter("user_hp1");
		String hp2=request.getParameter("user_hp2");
		String hp3=request.getParameter("user_hp3");
		String sms=request.getParameter("sms");
		if(sms != "Y") {sms = "N";} 
		String email1=request.getParameter("user_email1");
		String email2=request.getParameter("user_email2");
		String emailsts=request.getParameter("emailsts");
		if(emailsts != "Y") {emailsts = "N";} 
		String zipcode=request.getParameter("zipcode");
		String lot_addr=request.getParameter("lot_addr");
		String road_addr=request.getParameter("road_addr");
		String rest_addr=request.getParameter("rest_addr");
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO shopping_member(member_id, member_pw, member_name, member_gender, member_birth_y, member_birth_m, member_birth_d, member_birth_gn, HP1, HP2, HP3, SMS_YN, email1, email2, emailsts_YN, zipcode, lot_addr, road_addr, rest_addr, dept_No)" + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, user_id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth_y);
		pstmt.setString(6, birth_m);
		pstmt.setString(7, birth_d);
		pstmt.setString(8, birth_SL);
		pstmt.setString(9, hp1);
		pstmt.setString(10, hp2);
		pstmt.setString(11, hp3);
		pstmt.setString(12, sms);
		pstmt.setString(13, email1);
		pstmt.setString(14, email2);
		pstmt.setString(15, emailsts);
		pstmt.setString(16, zipcode);
		pstmt.setString(17, lot_addr);
		pstmt.setString(18, road_addr);
		pstmt.setString(19, rest_addr);
		pstmt.setString(20, dept);
		
		out.print(sql);
		pstmt.executeUpdate();
		
		pstmt.close();
		%>
		
		<script>
			alert("회원가입이 완료되었습니다.");
			window.location.href="./login.jsp";
		</script>
	</body>
</html>