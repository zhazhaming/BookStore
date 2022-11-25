<%--
  Created by IntelliJ IDEA.
  User: zhazha
  Date: 2022/6/12
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%
        String basepath = request.getScheme ()
                + "://"
                + request.getServerName ()
                + ":"
                +request.getServerPort ()
                +request.getContextPath ()
                +"/";
        pageContext.setAttribute ("basepath",basepath);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="<%=basepath%>">
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>