<%--
  Created by IntelliJ IDEA.
  User: zhazha
  Date: 2022/6/12
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <a href="${pageContext.request.contextPath}/book/managerpage?action=page&pageNo=1">图书管理</a>
    <a href="pages/manager/order_manager.jsp">订单管理</a>
    <a href="${pageContext.request.contextPath}/book/page?action=page&pageNo=1">返回商城</a>
    <a href="${pageContext.request.contextPath}/manager/logout">注销管理员</a>
</div>