<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算页面</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/logo.gif" >
			<span class="wel_word">结算</span>
		<%--	静态包含成功登录的菜单--%>
		<%@include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
		
		<h10>你的订单已结算，订单号为${sessionScope.orderId}</h10>
		
	
	</div>

	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>