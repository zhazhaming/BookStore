<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
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
			<span class="wel_word">我的订单</span>
		<%--	静态包含成功登录的菜单--%>
		<%@include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
		
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>状态</td>
				<td>详情</td>
			</tr>
			<c:forEach items="${requestScope.orders}" var="order">
				<c:if test="${order.userId==sessionScope.user.id}">
					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>
							<c:if test="${order.stauts==0}">未发货</c:if>
							<c:if test="${order.stauts==1}">已发货</c:if>
							<c:if test="${order.stauts==2}">已签收</c:if>
						</td>
						<td><a href="#">查看详情</a></td>
					</tr>
				</c:if>

			</c:forEach>

		</table>
		
	
	</div>

	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>