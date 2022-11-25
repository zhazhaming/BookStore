<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>尚硅谷会员登录页面</title>
	<%--	大家共同拥有的头部信息--%>
	<%@include file="/pages/common/head.jsp"%>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎登录</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>管理员登录</h1>
								<a href="${pageContext.request.contextPath}/user/gologin">会员登录</a>
								<a href="${pageContext.request.contextPath}/manager/goregist">立即注册</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg">
<%--									<%=request.getAttribute("msg")==null?"输入用户名和密码":request.getAttribute("msg")%>--%>
									${empty requestScope.msg?"输入管理员名和密码":requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="${pageContext.request.contextPath}/manager/login"method="post">
									<input type="hidden" name="action" value="login"/>
									<label>管理员名称：</label>
									<input class="itxt" type="text" placeholder="请输入管理员名" autocomplete="off" tabindex="1" name="username"
											value="${requestScope.username}"/>
									<br />
									<br />
									<label>管理员密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" />
									<br />
									<br />
									<input type="submit" value="登录" id="sub_btn" />
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<%--	静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>