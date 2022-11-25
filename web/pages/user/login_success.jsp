<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>尚硅谷会员注册页面</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">
				<img class="logo_img" alt="" src="static/img/logo.gif" >
			<%--	静态包含成功登录的菜单--%>
			<%@include file="/pages/common/login_success_menu.jsp"%>
		</div>
		
		<div id="main">
		
			<h1>欢迎回来 <a href="${pageContext.request.contextPath}/book/page?action=page&pageNo=1">转到主页</a></h1>
	
		</div>

		<%--	静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>