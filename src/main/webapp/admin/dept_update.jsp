<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="../script/dbconn.jsp" %>
        <title>Insert title here</title>
    </head>
    
    <body>
    <%
        String target = request.getParameter("target");
        String dept_no=request.getParameter("dept_no");
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        if(target == null){
        	String dept_name=request.getParameter("dept_name");
        	String sql = "UPDATE dept SET dept_Name =? WHERE dept_No ='" + dept_no + "'";
             
        	out.println(sql);
            pstmt = conn.prepareStatement(sql);
             
            pstmt.setString(1, dept_name);

			pstmt.executeUpdate();
			pstmt.close();
       	%>
            <script>
                alert("부서정보가 변경되었습니다.");
                window.close();
				opener.location.reload();
            </script>     
     	 <%     	
        } else if (target.equals("insert")) {
            String dept_name=request.getParameter("dept_name");
            
            
            String sql = "INSERT INTO dept(dept_No, dept_Name)" + "VALUES(?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, dept_no);
            pstmt.setString(2, dept_name);
            
            pstmt.executeUpdate();
            pstmt.close();
    %>
            <script>
                window.location.href="./dept.jsp";
                alert("부서정보가 업데이트되었습니다.");
            </script>    
    <%
        } else if(target.equals("delete")) {
            String sql = "DELETE FROM dept WHERE dept_No ='" + dept_no + "'";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            pstmt.close();
    %>
            <script>
                window.location.href="./dept.jsp";
                alert("부서정보가 삭제되었습니다.");
            </script>    
    <%        
        }
    %>
    </body>
</html>