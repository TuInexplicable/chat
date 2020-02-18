<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酷哥聊天室</title>
		<link rel="stylesheet" href="./css/ChatWindow.css" />
		<script src="./js/jquery.js"></script>
	</head>
	<body>
		<div style="width:100%;height:30px;text-align:center;background-color:#deb887;color:gray;font-size:20px;padding-top:20px">信息展示板</div>
		<table id="table" style="width:100%;height:100px;background-color:#deb887;top:5%;padding-left:50px">	
		</table>
		<div class="chatbox">
				<div class="chatleft">
					<div class="top">
							<div>
								<input type="text" id="text" class="text" name="search" placeholder="Search"  onkeyup="Searchword(this)"/>
								<img src="./img/common/fangdajing-hui.png" />
							</div>
							<div id="search" style="display:none;position: absolute;top:200px;left:130px;line-height:30px;font-size:13px;width:280px;z-index:1000;background:gray;color:#000000"></div>
							</div>
					<div class="center">
						<ul>
							<li class="list1">
								<div class="list-header" id="myfriends">
									<div class="list-title">好友总列表</div><span class="list-wrap" id ="usersum"></span>
									<div class="list-wrap" id="friends" style="position: absolute;z-index:1000;width:100px;background-color:#deb887;">
									</div>
								</div>
							</li>
							<li class="list2">
								<div class="list-header" id="onlinefriends"  style="position: relative;">
									<div class="list-title">在线好友</div><span  class="list-wrap" id ="onlinesum"></span>
									<div class="list-wrap"  id = "online" style="position: absolute;z-index:1000;width:100px;background:#deb887;">
									</div>
								</div>
							</li>
							<li class="list3">
								<div class="list-header">
									<div class="list-title" onclick="Sum()">在线人数&nbsp; &nbsp;&nbsp;&nbsp;<span id="sum"></span></div>
									<!-- <div class="list-wrap"  style="color:white;position: absolute;z-index:1000;width:200px;background-color:white;">
										
									</div> -->
								</div>
							</li>
							<li class="list4">
								<div class="list-header">
									<h3 class="list-title">退出</h3>
								</div>
							</li>
						</ul>
						<div class="footer">
							<ul class="extra">
								<li>&copy; Untitled.</li><br>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						
						</div>
					</div>
				</div>
				<div class="chatright">
					<div class="top">
						<img src="./img/darks/pic02.jpg" >
						<span>
							<%
								Object mininame = session.getAttribute("mininame");
								Object agent = session.getAttribute("agent");
								String title="";
								if(mininame==null) title="";
								else title = "用户"+mininame+agent+"在线";
							%>
							<%=title%>
							<span id="mininame" style="display:none"><%=mininame %></span>
							</span>
						<!--<i class="fas fa-ellipsis-v" style="font-size: 1.4em; position: absolute; right: 20px; color: gray;"></i>-->
					</div>
					<div class="center">
						<textarea id="txt1" class="txt1" rows="20" cols="100" style="width: 98%;height: 100%" disabled></textarea>
					</div>
<!-- 						<div id="txt1" style="overflow:auto; margin-left:8px;width:98%; height:58%;border:1px solid black;border-radius:5px; background:white;"></div>
 -->					<div class="emoj">
						<ul>
							<li><a href="#"><img src="./img/common/A.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/emoj.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/cut.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/窗口抖动.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/语音.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/photo.jpg" /></a></li>
							<li><a href="#"><img src="./img/common/sendProject.jpg"  /></a></li>
						</ul>
					</div>
					<div class="footer">
						 <div>
							<textarea id="txt2" rows="5" cols="100" style="width: 98%;height: 10%;" name="message"></textarea>
							<button class="sendbtn" >发送</button>
						</div> 
						<button style="position:absolute;right:0px;margin-top:10px" onclick="getMessage()">历史记录</button>
						<!--<img src="img/common/more.jpg" />-->
					</div>
				</div>
		</div>
		<div style="width:100%">	
			<textarea class="txt1" id = "txt" rows="21" cols="6" style="width: 99.5%;height: 100px;margin-left:0px;background-color:wheat" disabled></textarea>
		</div>
		<script>
		var url = location.href;
        var account = url.split("=")[1];
		var onlinefriends="";
		var allfriends="";
		var searchfriends="";
		function deltable(){$("#table").html('');}
		function inFunction1(element){
			for(var i=0;i<allfriends.length;i++)
			if(allfriends[i].mininame==element.innerHTML){
				var detail="<tr><td>姓名；"+allfriends[i].username+"</td><td>昵称："+allfriends[i].mininame+"</td></tr>"+
				"<tr><td>账号："+allfriends[i].account+"</td><td>性别："+allfriends[i].sex+"</td></tr>"+
				"<tr><td>邮箱："+allfriends[i].email+"</td></tr>"+
				"<tr><td>注册时间："+allfriends[i].date+"</td></tr>";
				$("#table").html(detail);
			}
			setTimeout(deltable,100000);
		}
		function save(){
			$.post(
				"/ChattingHouse/saveServlet",
				{"account":account,"message":$("#txt1").val()},
				function(date){
					$("#table").html(date);
				}
			);
		}
		function deltxt(){$("#txt").html("");}
		function getMessage(){
			$.post(
					"/ChattingHouse/messageServlet",
					{"account":account},
					function(date){ 
						$("#txt").html(date);
					}
				);
			
			setTimeout(deltxt,30000);
		}
		function inFunction3(element){
			for(var i=0;i<searchfriends.length;i++)
			if(searchfriends[i].username==element.innerHTML){
				var detail="<tr><td>姓名；"+searchfriends[i].username+"</td><td>昵称："+searchfriends[i].mininame+"</td></tr>"+
				"<tr><td>账号："+searchfriends[i].account+"</td><td>性别："+searchfriends[i].sex+"</td></tr>"+
				"<tr><td>邮箱："+searchfriends[i].email+"</td></tr>"+
				"<tr><td>注册时间："+searchfriends[i].date+"</td></tr>";
				$("#table").html(detail);
			}
			setTimeout(deltable,100000);
		}
		function inFunction2(element){
			for(var j=0;j<onlinefriends.length;j++){
			if(onlinefriends[j].mininame==element.innerHTML){
				var detail="<tr><td>姓名："+onlinefriends[j].username+"</td><td>昵称："+onlinefriends[j].mininame+"</td></tr>"+
				"<tr><td>账号："+onlinefriends[j].account+"</td><td>性别："+onlinefriends[j].sex+"</td></tr>"+
				"<tr><td>邮箱："+onlinefriends[j].email+"</td></tr>"+
				"<tr><td>注册时间："+onlinefriends[j].date+"</td></tr>";
				$("#table").html(detail);
			}
			setTimeout(deltable,100000);
			}
		}
		//搜索栏失去焦点后，撤去搜索显示框
		$("#text").blur(function(){
		
			$("#search").css("display","none");
			}
		);
		//ajax调用post查询搜索及回显
		function Searchword(doc){
			var person="";
			$.post(
					"/ChattingHouse/searchUsersServlet",
					{"word":$(doc).val()},
					function(date){
						if(date.length>0){
							searchfriends = date;
							for(var i=0;i<date.length;i++)
								person+="<div onclick='inFunction3(this)'>"+date[i].mininame+"</div><span>"+date[i].date+"</span>";
								$("#search").html(person);
								$("#search").css("display","block");
						}
					},
					"json"
				);
	 	}
		//点击事件查询注册好友人数，ajax.
			$("#myfriends").click(function(){
				var people="";
				$.post(
						"/ChattingHouse/usersServlet",
						"",
						function(date){//date 是json数据
							if(date.length>0){
								allfriends=date;
								for(var i=0;i<date.length;i++)
									//将json动态添加到div内，用拼接字符串的形式
								people+="<div onclick='inFunction1(this)' style='border:1px solid black;height:15px;border-radius:5px;text-align:center;color:black;background:white;'>"+date[i].mininame+"</div>";
								$("#usersum").html("总人数"+date.length);
								$("#friends").html(people);
							}
						},
						"json"
					);
				$(this).parent().find(".list-wrap").slideToggle();
		 		
		 	});
		//显示在线好友
			$("#onlinefriends").click(function(){
				var people="";
				$.post(
						"/ChattingHouse/onlineUsersServlet",
						"",
						function(date){
							if(date.length>0){
								onlinefriends = date;
								for(var i=0;i<date.length;i++)
									people+="<div onclick='inFunction2(this)' style='border:1px solid black;height:15px;border-radius:5px;text-align:center;color:black;background:white;'>"+date[i].mininame+"</div>";
								$("#onlinesum").html("在线人数"+date.length);
								$("#online").html(people);
							}
						},
						"json"
					);
				$(this).parent().find(".list-wrap").slideToggle();
		 		
		 	});
		//给发送按钮绑定事件，发送信息到后台
			$(".sendbtn").click(function(){
				$.post(
						"/ChattingHouse/chatServlet",
						{"message":$("#txt2").val(),"mininame":$("#mininame").text()},//json格式传递发送框的内容以及昵称到后台
						function(data){
							$("#txt2").val("");//清空发送框
						}
					);
			}
			);
			//给退出绑定事件，下线退出清除数据库在线表单的信息，关闭当前界面
			$(".list4").click(function(){
				save();
				$("#table").html("将在5秒后关闭");
				setTimeout(stop,5000);
			}
			);
			function stop(){
				$.post(
						"/ChattingHouse/delOnlineuserServlet",
						{"account":account},
						function(date){
							if(date=="1"){
								alert("退出异常了");
							}else{
								 window.onload = function(){
								        history.forward();
								    }
								 location.href = "http://192.168.0.103:8080/ChattingHouse/";
							}
						}
					);	
			}
			//页面0.1秒刷新后台聊天信息
			$(function(){
				setInterval(ajaxchat,100);
				//setInterval(Sum,10000);
			});
			//查询在线人数
			function Sum(){
				$.post(
						"/ChattingHouse/sumServlet",
						"",
						function(date){
							$("#sum").html(date);
						}
					);
			}
			//刷新聊天内容具体实现方式
			function ajaxchat(){
				$.post(
						"/ChattingHouse/chatwindowServlet",
						{"mininame":$("#mininame").text(),"account":account},//传递当前界面的昵称
						function(data){
							if(data!="null")
							document.getElementById("txt1").innerHTML= $("#txt1").val()+data+"\n";//叠加显示聊天内容
							else{
							}
						}
					);
			}
			//用户登陆到聊天界面就会添加到在线表(onlineusers),只能点击退出，delete表中的信息后再能正常退退出，否则下次此账号将无法登陆，不允许用户同归其他凡是退出聊天室
			/* $(window).blur(function(){
				 alert("要走,就退出吧,我会想你的");
			}); */
		</script>
	</body>
</html>
