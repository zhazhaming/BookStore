<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/logo.gif" >
			<span class="wel_word">订单管理系统</span>
		<%--静态包含manger管理模块菜单--%>
	<div>
		<a href="${pageContext.request.contextPath}/book/page?action=page&pageNo=1">返回商城</a>
	</div>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>详情</td>
				<td>发货</td>
			</tr>
			<c:forEach items="${requestScope.user_order}" var="order">
					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>
							<c:if test="${order.status==0}">未发货</c:if>
							<c:if test="${order.status==1}">已发货</c:if>
							<c:if test="${order.status==2}">已签收</c:if>
						</td>
						<td><a href="#">查看详情</a></td>
					</tr>
			</c:forEach>
		</table>
	</div>

	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>