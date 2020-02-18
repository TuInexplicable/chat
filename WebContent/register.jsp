<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户注册</title>
	<script src="./js/jquery.js"></script>
	<link  rel="stylesheet" href="./css/Register.css">
	<!-- <script> 

		function checkTel(x){ 
			var tel = document.getElementById(x).value;
	 	
			if(/^1[3|5|7|8][0-9]\d{8}$/.test(tel))
 			{
   				document.getElementsByName("span")[0].innerHTML = "right";
  		 	}
			else
  			{
  				 document.getElementsByName("span")[0].innerHTML = "error";
  			}
  		}

  		function CheckInput(x)
    	{
    	var input = document.getElementById(x).value;
        if(input ==''){ alert('密码不能为空！');this.focus();}
        
   		}
	</script> -->
	
</head>

<body>

	<div class="xiao-container">

		<div class="xiao-register-box">

			<div class="xiao-title-box">

				<span>用户注册</span>

			</div>

			<form action="reg" method="post" name="register">

				<div class="xiao-account-box">

				<span class="xiao-require">*</span>

					<label for="account">账号</label>

					<div class="xiao-account-input">

						<input type="text" id="account" name="account" class="required" maxlength="11" placeholder="请输入您的手机号码，11位有效数字"  />
						<!-- onchange="checkTel(this.id)"<span class="account-span" name="span"></span> -->

					</div>

				</div>
				<div class="xiao-username-box">

					<span class="xiao-require">*</span>

					<label for="username">用户名</label>

					<div class="xiao-username-input">

						<input type="text" id="username" name="username" class="required" maxlength="12" placeholder="请输入用户名 长度:6-12个字符" />

					</div>

				</div>
				<div class="xiao-nickname-box">

					<span class="xiao-require">*</span>

					<label for="nickname">昵称</label>

					<div class="xiao-nickname-input">

						<input type="text" id="nickname" name="mininame" class="required" maxlength="12" placeholder="请设置昵称 长度:6-12个字符" />

					</div>

				</div>
				<div class="xiao-userPassword-box">

					<span class="xiao-require">*</span>

					<label for="userPassword">密码</label>

					<div class="xiao-userPassword-input">

						<input type="password" id="userPassword" class="required" name="password" maxlength="20" placeholder="请输入密码 长度:6-20个字符" />

					</div>

				</div>
				<div class="xiao-userRePassword-box">

				<span class="xiao-require">*</span>

						<label for="userRePassword">确认密码</label>

					<div class="xiao-userRePassword-input">

						<input type="password" id="userRePassword" name="userRePassword" class="required" maxlength="20" placeholder="请重复输入密码" />

					</div>

				</div>
				<div class="xiao-userEmail-box">

					<span class="xiao-require">*</span>

					<label for="userEmail">电子邮箱</label>

					<div class="xiao-userEmail-input">

						<input type="text" id="userEmail" name="email" class="required" placeholder="请输入您的邮箱地址，如：123@qq.com" />

					</div>

				</div>

				

				<div class="xiao-userGender-box">

					<span class="xiao-require">*</span>

					<label for="userGender">性别</label>

					<div class="xiao-userGender-input">

						<input type="radio" id="userGender_01" name="sex" value="男" checked="checked" />男   

						<input type="radio" id="userGender_02" name="sex" value="女" />女

					</div>

				</div>

				

				<div class="xiao-submit-box">

					<input id = "xiao-submit-button" type="submit" value="注册" onsubmit="CheckForm()" />

				</div>

				

				<div class="xiao-goLogin-box">

					<a href="./login.jsp" style="text-decoration: none;">已有账号？去登录</a>

				</div>
				<div class="xiao-title-box" style="margin-left:0px;color:red">
					<span id="mesdiv">
							<% Object mes ="";if(session.getAttribute("Rerroy")==null) ;else{ mes=session.getAttribute("Rerroy");session.removeAttribute("Rerroy"); }%> <%=mes %>
					</span>
				
				</div>
			</form>
			
		</div>
		

	</div>

<script>
        //为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
        $(function(){
			$("input").focus(function(){
			$("#mesdiv").hide();
		});
		});
        $("form :input.required").each(function () {
            //通过jquery api：$("HTML字符串") 创建jquery对象
            var $required = $("<strong class='high'>-</strong>");
            //添加到this对象的父级对象下
            $(this).parent().append($required);
        });

        //为表单元素添加失去焦点事件
        $("form :input").blur(function(){
            var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证账号
             if($(this).is("#account")){
                var accountVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
                var regAccount = /^1[34578][0-9]{9}$/;///^1[34578][0-9]{9}$/
                if(accountVal == "" || accountVal.length < 11 || regAccount.test(accountVal)==false){
                    var errorMsg = "请输入正确的手机号码！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证姓名
            if($(this).is("#username")||$(this).is("#nickname")){
                var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "") || regName.test(nameVal)
                //var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
                if(nameVal == ""){
                    var errorMsg = "非空,不包含特殊字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证密码
            if($(this).is("#userPassword")){
                var userPasswordVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
                if(userPasswordVal == "" || userPasswordVal.length < 6){
                    var errorMsg = "非空,长度6-12字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //比较两次密码
            if($(this).is("#userRePassword")){
                var userPasswordVal = $.trim(document.getElementById("userPassword").value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
                var userRepasswordVal = $.trim(this.value);
                if(userRepasswordVal != userPasswordVal || userRepasswordVal == ""){
                    var errorMsg = "非空,长度6-12字符！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证邮箱
            if($(this).is("#userEmail")){
                var emailVal = $.trim(this.value);
                var regEmail = /.+@.+\.[a-zA-Z]{2,4}$/;
                if(emailVal != "" && !regEmail.test(emailVal)){
                    var errorMsg = " 请输入正确的E-Mail住址！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                	if(emailVal== "") ;
                	else{
                		 var okMsg=" 输入正确";
                         $parent.find(".high").remove();
                         $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                	}
                }
            }

        }).keyup(function(){
            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
            $(this).triggerHandler("blur"); 
        }).focus(function(){
            $(this).triggerHandler("blur");
        });
        
        //点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
        $("#xiao-submit-button").click(function(){
            //trigger 事件执行完后，浏览器会为submit按钮获得焦点
            $("form .required:input").trigger("blur"); 
            var numError = $("form .onError").length;
            if(numError){
                return false;
            }
        });
    </script>
</body>

</html>
