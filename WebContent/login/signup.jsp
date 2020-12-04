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
	<title>WHOEVER SIGNUP</title>
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
		
		.member-scroll-layout {
    	    position: absolute;
    		width: 610px;
    		left: 50%;
    		top: 0;
    		bottom: 0;
    		margin-left: -305px;
    		background-color: #fff;
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
		.member_button_signup {
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
	<!-- 값 입력여부 확인 -->
	<script type="text/javascript">
		if(!document.signup_info.signup_id.value){
        	alert("아이디를 입력하세요.");
        	return false;
    	}
		if(!document.signup_info.signup_password.value){
        	alert("비밀번호를 입력하세요.");
        	return false;
    	}
		if(document.signup_info.signup_password.value != document.signup_info.signup_password_re.value){
        	alert("비밀번호를 동일하게 입력하세요.");
        	return false;
    	}
		if(!document.signup_info.signup_name.value){
        	alert("이름을 입력하세요.");
        	return false;
    	}
		if(!document.signup_info.signup_email.value){
        	alert("이메일을 입력하세요.");
        	return false;
    	}
		if(!document.signup_info.agree_ok){
			alert("동의하세요.");
        	return false;
		}
	</script>
	
	
	
</head>

<body>
	<div class="app">
  		<div class="member-scroll-layout">
  			<h1>WHOEVER</h1>
  			<h6>이용약관, 개인정보 수집 및 이용에 동의합니다. </h6>
  			<h6>기본정보 입력</h6>
  			
  			<form action="signup_process.jsp" method="post" name="signup_info" onsubmit="return checkValue()">
  				<input type='checkbox' name='agree_ok' value='agree_ok'  />
  				<b><font size="3" color="gray">ㅇㅇ동의</font></b>
  				
  				<input id="signup_id" class="member_input_box"type="text"name="signup_id" placeholder="아이디"maxlength="50">
  				<input type="button" class="member_button_signup" value="중복확인" >   

  				<input id="signup_password" class="member_input_box"type="text"name="signup_password"placeholder="패스워드"maxlength="50">
  				<input id="signup_password_re" class="member_input_box"type="text"name="signup_password_re"placeholder="패스워드 확인"maxlength="50">
  				<input id="signup_name" class="member_input_box"type="text"name="signup_name"placeholder="이름"maxlength="50">
  				<input id="signup_email" class="member_input_box"type="email"name="signup_email"placeholder="이메일 주소"maxlength="50">
  				<br>
  				<button type="submit" class="member_button_signup"><strong>회원가입</strong></button>
  			</form>
  		</div>
  		<span class="blank"></span>
	</div>
</body>
</html>		