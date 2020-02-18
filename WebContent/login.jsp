<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登陆</title>
		<link rel="stylesheet" href="./css/Login.css" />
	</head>
	<body>
		<div class="box0">

			<div class="box1">
				<p style="font-weight: bold;">酷哥聊天室</p>

			</div>

			<div class="box2">
				<form action="log" method="post">
					<p>
						<span id="n">账号：</span>
						<input type="text" name="account" id="account" class="num"  maxlength="11" pattern="^1[34578][0-9]{9}$" 
    					oninvalid="setCustomValidity('请输入11位手机号');"><!-- onclick="nameMOver()"  -->
					</p>
					<p>
						<span>密码：</span>
						<input type="password" name="password" id="pword" class="pass" required="required" /> <!-- pattern="^[a-zA-Z]\w{5,17}$" onclick="checkNameNull()" onmouseout="checkPassNull()"  -->
					</p>

					<p>
						<input type="submit" class="btn01" value="登陆"/>		
						<a href="./register.jsp"><input type="button" class="btn02" value="注册"/></a>
					</p>
					</form>
			</div>

			<div class="box3">
				<p id="ling" style="color:red"><% Object mes ="";if(session.getAttribute("Lerroy")==null) ;else{ mes=session.getAttribute("Lerroy");session.removeAttribute("Lerroy"); }%> <%=mes %></p>
			</div>
		</div>


	</body>
</html>