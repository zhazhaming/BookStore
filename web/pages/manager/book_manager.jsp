
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function (){
			//给删除标签添加点击事件，用于提示确认点击事件
			$("a.deleteClass").click(function (){
				return confirm("你确定删除【"+$(this).parent().parent().find(("td:first").text())+"】吗？")
			});
		});
	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/logo.gif" >
			<span class="wel_word">图书管理系统</span>
		<%--静态包含manger管理模块菜单--%>
		<%@include file="/pages/common/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>序号</td>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td colspan="2">操作</td>
			</tr>

			<C:forEach items="${requestScope.book}" var="book">
				<tr>
					<td>${book.id}</td>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="${pageContext.request.contextPath}/book/goupdateBook?pageNo=${requestScope.pageNo}&id=${book.id}">修改</a></td>
					<td><a class="deleteClass" href="${pageContext.request.contextPath}/book/deleteBook?id=${book.id}&pageNo=${requestScope.pageNo}">删除</a></td>
				</tr>
			</C:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="${pageContext.request.contextPath}/book/goaddBook?pageNo=${requestScope.pageNo}">添加图书</a></td>
			</tr>	
		</table>
		<%--	静态包含分页--%>
		<%@include file="/pages/common/page_nav.jsp"%>
	</div>

	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>