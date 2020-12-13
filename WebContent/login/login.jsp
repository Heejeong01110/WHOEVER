<!doctype html>
<html>
<head>
	<%@ page contentType="text/html; charset=utf-8"%>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<!-- Bootstrap core CSS -->
	<link href="/docs/4.4/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<%request.setCharacterEncoding("UTF-8"); %>
	<style>
		.app {
			position:absolute;
			text-align: center;
  			top:0;
  			left:0;
  			width:100%;
  			height:100%;
  			font-size: 50px;
  			background:#f3f5f7;
		}
		.app .content {
            display: inline-block;
            vertical-align: middle;
  			
        }
        .app .blank {
            display: inline-block;
            width: 0;
            height: 100%;
            vertical-align: middle
        }
        
        .login_container {
        	position: relative;
    		margin: 0 auto;
    		width: 450px;
    		min-height: 682px;
    		background-color: #fff;
    		box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
        }
        .login_layout__inner {
    		margin: 0 40px;
    		padding-bottom: 40px;
		}
		.member_input_style {
    		margin-top: 27px;
    		position: relative;
    		padding: 10px 0 11px;
    		border-bottom: 1px solid #dddfe4;
    		height: 26px;
    		
    		
		}
		.member_input_box{
			position: relative;
    		z-index: 10;
    		border: 0;
    		padding: 0;
    		background-color: transparent;
    		outline: 0;
    		font-weight: 400;
    		font-size: 16px;
    		line-height: 19px;
    		width: 100%;
    		margin: 10 0 10 10;
    		border-bottom: 1px solid #bcbcbc;
		}
		.member_button_login {
			position: relative;
			text-align: center;
			font-weight: 700;
			line-height: 56px;
    		padding: 0 20px;
    		
    		background-color: #dddfe4!important;
    		cursor: default!important;
    		
    		font-size: 16px;
    		border-radius: 3px;
    		display: inline-block;
    		text-decoration: none;
    		color: #fff;
    		border: 0;
    		height: 56px;
    		
    		margin-top: 40px;
    		width: 100%;
    		
    		font: 400 13.3333px;
    		
		}
		
        
        
	</style>
	
	<script type="text/javascript">
	function signupGo(){
		window.location.href = "http://localhost:8080/WHOEVER/login/signup.jsp";
	}
	</script>
	
<title>WHOEVER LOGIN</title>
</head>

<body>
	<div class="app">
  		<div class="content">
  			<div class="login_container">
  				<div class="login_layout__inner" >
  					<!-- 페이지 로고 -->
  					<h1 style="padding-top: 48px; text-align: center; margin-bottom:42px;">
  						<img src="logo" alt="logo" style="height: 24; weight=auto">
  					</h1>
  					<!-- 페이지 로고 -->
  					<h4 style="text-align: center; margin-bottom:42px;">로그인</h4>
  					<!-- 로그인 form 시작 -->
  					<div class="login">
  					<%
						String error = request.getParameter("error");
						if (error != null) {
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해 주세요");
							out.println("</div>");
						}
					%>
  						<form action="login_process.jsp" method="post">
  							<input id="login_id" class="member_input_box"type="text"name="login_id" placeholder="아이디">
  							<input id="login_password" class="member_input_box"type="password"name="login_password"placeholder="비밀번호">
  							<span style="font-weight:400;font-size:14px;line-eight:20px;color:#1ea1f7;float:right;margin-top:20px;">
  								<a style="font-weight: 400;font-size: 14px;line-height: 20px;color: #1ea1f7;text-decoration: underline;"href="findpw.jsp">아이디, 비밀번호를 잊으셨나요?</a>
  							</span>
  							<br>
  							<button type="submit" class="member_button_login"><strong>로그인</strong></button>
  						</form>
  						<button type="button" class="member_button_login"  onclick = "signupGo()"><strong>회원가입</strong></button>
  					</div>
  				</div>
  			</div>
  		</div>
  		<span class="blank"></span>
	</div>
</body>
</html>		