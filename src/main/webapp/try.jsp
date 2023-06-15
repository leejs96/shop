<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href = "./css/nav.css"> -->
<title>Insert title here</title>
</head>
<body>
<!-- <div class = "navigation_bar">
			<div class = "navigation_bar" style = "float : left;">
				<ul class = "list">
					<li class = "menu"><a href = "main.jsp">Home</a></li>
				</ul>
			</div>
			<div class = "navigation_bar" id = "sub" style = "float : right;">
				<ul class = "gnb">
					<li class = "menu" id = main_menu style = "padding-right: 10px;"><a href = "memberlist.jsp">관리자페이지</a></li>
							<ul class = "sub_menu" style = "display : none;">
								<li class = "menu" style = "display : block;"><a href = "dept.jsp">부서관리</a></li>
								<li class = "menu" style = "display : block;"><a href = "memberlist.jsp">회원관리</a></li>
							</ul>
					<li id = "logout"><a href = "logout.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	<div class="dc1">
	  <p>▶ mouse over</p>
	  <p class="moya">drop content</p>
	</div> -->
	
	<div id = "nav">
		<ul>
			<li class = "dropdown">
				<div class = "dropdown_menu">Menu</div>
				<div class = "dropdown_content">
					<a href = "#">menu1</a>
					<a href = "#">menu2</a>
					<a href = "#">menu3</a>
				</div>
			</li>
			<li class = "home"><a href = "#">Home</a></li>
		</ul>
	</div>
</body>
</html>

<style>
	#nav {
		width : 100%;
		background : gray;
		list-style-type : none;
		margin : 0;
		padding : 0;
		display : inline-block;
	}
	
	ul {
		display : inline-block;
	}
	
	li {
		display : inline-block;
	}
	
	.home {
		background : darkorange;
		width : 100%;
		text-align: center;
	    font-weight: bold;
	    float: right;
	}
	
	.home a {
		color : white;
	    padding: 16px 16px;
	    text-decoration: none;
	    display: block;
	}
	
	.dropdown {
		position : relative;
	}
	
	.dropdown_menu {
		color : white;
	    padding: 16px;
    	font-size: 16px;
	}
	
	.dropdown_content {
		background: yellow;
	    position: absolute;
	    min-width: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	}
	
	.dropdown_content a {
		color : black;
	}
	
	.dropdown_content {
	    /* display : none; */
	}
	
	.dropdown_menu:hover:not(.home) {
		background : orange;
		color : white;
	}
	
	.dropdown:hover .dropdown_content {
		display : block;
	}
</style>

<!-- <style>
.menu:hover .sub_menu {
display: block;
}

.moya {
  display: none;
  width: 33.3%;
  background: #eee;
  box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.3);
  padding: 10px;
}

.dc1:hover .moya {
  display: block;
}
</style> -->