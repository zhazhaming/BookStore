<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>书城首页</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function (){
			$("button.addToCart").click(function (){
				var bookId = $(this).attr("bookId");
				location.href = "${pageContext.request.contextPath}/car/addCar?id="+bookId+"&pageNo=${requestScope.pageNo}"
			});
		});
	</script>
</head>
<body>

<div id="header">
	<img class="logo_img" alt="" src="static/img/logo.gif" >
	<span class="wel_word">网上书城</span>
	<div>
		<c:if test="${empty sessionScope.user.username and empty sessionScope.manager.username}">
			<a href="${pageContext.request.contextPath}/user/gologin">登录</a>
			<a href="pages/user/regist.jsp">注册</a>&nbsp
		</c:if>
		<c:if test="${not empty sessionScope.user.username}">
			<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临书城</span>
		</c:if>
		<c:if test="${not empty sessionScope.manager}">
			<span>欢迎<span class="um_span">${sessionScope.manager.username}</span> 光临书城</span>
		</c:if>
		<c:if test="${empty sessionScope.manager}">
			<a href="${pageContext.request.contextPath}/car/goaddCar">购物车</a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<a href="${pageContext.request.contextPath}/manager/manager">后台管理</a>
		</c:if>

	</div>
</div>
<div id="main">
	<div id="book">
		<div class="book_cond">
			<form action="${pageContext.request.contextPath}/book/querybookByMoney" method="get">
				<input type="hidden" name="action" value="querybookByMoney">
				价格：<input id="min" type="text" name="min" value="${param.min}" > 元 -
				<input id="max" type="text" name="max" value="${param.max}"> 元
				<input type="submit" value="查询" />
				<input type="hidden" name="pageNo" value="1">
			</form>
		</div>
		<div style="text-align: center">
			<c:if test="${empty sessionScope.cart.items}">
				<%--购物车为空的输出--%>
				<span> </span>
				<div>
					<span style="color: red">当前购物车为空</span>
				</div>
			</c:if>
			<c:if test="${not empty sessionScope.cart.items}">
				<%--购物车非空的输出--%>
				<span>您的购物车中有 ${sessionScope.cart.totalcount} 件商品</span>
				<div>
					您刚刚将<span style="color: red">${sessionScope.lastName}</span>加入到了购物车中
				</div>
			</c:if>
		</div>

		<c:forEach items="${requestScope.book}" var="book">
			<div class="b_list">
				<div class="img_div">
					<img class="book_img" alt="" src="${book.img_path}" />
				</div>
				<div class="book_info">
					<div class="book_name">
						<span class="sp1">书名:</span>
						<span class="sp2">${book.name}</span>
					</div>
					<div class="book_author">
						<span class="sp1">作者:</span>
						<span class="sp2">${book.author}</span>
					</div>
					<div class="book_price">
						<span class="sp1">价格:</span>
						<span class="sp2">${book.price}</span>
					</div>
					<div class="book_sales">
						<span class="sp1">销量:</span>
						<span class="sp2">${book.sales}</span>
					</div>
					<div class="book_amount">
						<span class="sp1">库存:</span>
						<span class="sp2">${book.stock}</span>
					</div>
					<div class="book_add">
						<button bookId="${book.id}" class="addToCart">加入购物车</button>
					</div>
				</div>
			</div>
		</c:forEach>


	</div>
<%--	静态包含分页--%>
	<%@include file="/pages/common/page_nav.jsp"%>
</div>

</div>
<%--	静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>