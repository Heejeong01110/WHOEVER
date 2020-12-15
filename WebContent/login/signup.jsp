<!doctype html>
<html>
<head>
<%@ page contentType="text/html; charset=utf-8"%>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jQuery and JS bundle w/ Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<!-- Bootstrap core CSS -->
<link href="/docs/4.4/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>WHOEVER SIGNUP</title>
<style>
.app {
	position: absolute;
	text-align: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	font-size: 50px;
	background: #f3f5f7;
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

.member_input_box {
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
	margin: 10 0 0 10;
	border-bottom: 1px solid #bcbcbc;
}

.member_button_signup {
	position: relative;
	text-align: center;
	font-weight: 700;
	line-height: 56px;
	padding: 0 20px;
	background-color: #dddfe4 !important;
	cursor: default !important;
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
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("signup_email");
	String id = request.getParameter("signup_id");
	String pwd = request.getParameter("signup_password");
	String pwd_re = request.getParameter("signup_password_re");
	String name = request.getParameter("signup_name");
	
%>
<!-- 값 입력여부 확인 -->
</head>

<script type="text/javascript">
	var emailCheck = 0;
	function checkMember() {
		var emailhint = document.getElementById("emailck");
		var idhint = document.getElementById("idck");
		//var expid = /^[a-z0-9]{5,20}$/;
		var exppwd = /^[A-Za-z0-9]{8,16}$/;
		if ($("input:checkbox[name=agree_ok]").is(":checked") == false) {
			alert("동의.");
			document.signup_info.agree_ok.focus();
			return false;
		}
		if(emailhint.style.color=="red"){
			alert("이메일 인증을 먼저 해주세요.");
		  	document.signup_info.signup_email.select();
		  	return false;
		}
		
		if(idhint.style.color=="red"){
			alert("아이디 중복 확인을 먼저 해주세요.");
		  	document.signup_info.signup_id.select();
		  	return false;
		}

		if ($.trim($("#signup_password").val()) == '') {
			alert("패스워드를 입력해주세요.");
			document.signup_info.signup_password.focus();
			return false;
		} else if (exppwd.test($.trim($("#signup_password").val())) == false) {//비밀번호 형식	
			alert("패스워드 형식이 올바르지 않습니다.");
			document.signup_info.signup_id.focus();
			return false;
		}

		if ($.trim($("#signup_password_re").val()) != $.trim($(
				"#signup_password").val())) {
			alert("패스워드 값이 일치하지 않습니다.");
			document.signup_info.signup_password_re.focus();
			return false;
		}
		if ($.trim($("#signup_name").val()) == '') {
			alert("이름 입력해.");
			document.signup_info.signup_name.focus();
			return false;
		}
		document.signup_info.submit();
	}//checkmember end


	function checkEmail() {
		var emailhint = document.getElementById("emailck"); //이메일 밑 힌트문구
		var emailinput = document.getElementById('signup_email'); //이메일 input란 설정
		var email = document.getElementById("signup_email").value; //이메일 입력값
		
		//유효성검사
		var exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var findkpu = "@kpu.ac.kr";
		
		//이메일 입력 안했을 시
		if ($.trim($("#signup_email").val()) == '') {
			emailhint.style.color="red";
			$("#emailck").text("이메일을 입력해주세요.");
			document.signup_info.signup_email.select();
			emailCkeck = 0;
			return false;
		} //이메일 유효성 검사 통과 못했을 시 
		else if (exptext.test(email) == false) {
			emailhint.style.color="red";
			$("#emailck").text("이메일 형식이 올바르지 않습니다.");
			document.signup_info.signup_email.focus();
			emailCkeck = 0;
			return false;
		} //이메일 형식이 학교 이메일이 아닐 시 
		else if (email.indexOf(findkpu) == -1) {
			emailhint.style.color="red";
			$("#emailck").text("이메일은 학교 이메일 주소를 이용해주세요.");
			document.signup_info.signup_email.focus();
			return false;
		}//조건 만족 시 
		else {  
			emailhint.style.color="blue";
			$("#emailck").text("이메일 인증이 완료되었습니다.");
			$("#signup_email").attr("readonly",true);
			//document.getElementById("signup_email") = ture;
			//emailinput.disabled=true; //성공하면 수정 못함
			document.signup_info.signup_id.focus();
			return true;
		}
		//메일 보내는 동작 수행
		
	}//checkemail end
	
	function checkId(){
		var idhint = document.getElementById("idck"); //아이디 밑 힌트문구
		var idinput = document.getElementById('signup_id'); //아이디 input란 설정
		var id = document.getElementById("signup_id").value; //id 입력값
		var expid = /^[a-z0-9]{5,20}$/;
		
		if ($.trim($("#signup_id").val()) == '') {
			idhint.style.color="red";
			$("#idck").text("아이디를 입력해주세요.");
			document.signup_info.signup_id.focus();
			return false;
		} else if (expid.test($.trim($("#signup_id").val())) == false) {//아이디 형식
			idhint.style.color="red";
			$("#idck").text("아이디형식이 올바르지 않습니다. 5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
			document.signup_info.signup_id.focus();
			return false;
		}else{
			var form1 = document.signup_info;
			var url = "idcheck.jsp?id=" + id;
			window.open(url,"IdCheck","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=300,height=180");
			return;		
		}
		//idhint.style.color="blue";
		//$("#idck").text("아이디 인증이 완료되었습니다.");
		//idinput.disabled=true; //성공하면 수정 못함
		//document.signup_info.signup_password.focus();
		//조건 만족시 db 확인
	}
</script>



<body>
	<div class="app">
		<div class="member-scroll-layout">
			<h1>WHOEVER</h1>
			<h6>이용약관, 개인정보 수집 및 이용에 동의합니다.</h6>
			<h6>기본정보 입력</h6>

			<form action="signup_process.jsp" method="post" name="signup_info">
			<!-- 동의 박스 -->
				<input type='checkbox' id='agree_ok' name='agree_ok' value='0'>
				<label for="agree_ok"><b><font size="3" color="gray">ㅇㅇ동의</font></b></label>

			<!-- 이메일 입력 -->
				<input id="signup_email" class="member_input_box" type="email"name="signup_email" placeholder="email@kpu.ac.kr" maxlength="50">
				<h6 id="emailck" style="size: 13px; color: red;">학교 이메일 주소로 인증이 가능합니다.</h6>
				<input type="button" id="emailck2" class="member_button_signup" value="이메일 인증"onclick="checkEmail()"> 
				
				
			<!-- 아이디 입력 -->	
				<input id="signup_id"class="member_input_box" type="text" name="signup_id"placeholder="아이디" maxlength="50">
				<h6 id="idck" style="size: 13px; color: red;">5~20자의 영문 소문자, 숫자만 사용 가능합니다.</h6>
				<input type="button" id="idck2"  class="member_button_signup" value="중복확인" onclick="checkId()">


			<!-- 비밀번호 입력 -->
				<input id="signup_password" class="member_input_box" type="text"name="signup_password" placeholder="패스워드" maxlength="50">
				<h6 style="size: 10px; color: red;">8~16자 영문 대 소문자, 숫자를 사용하세요.</h6>

				<input id="signup_password_re" class="member_input_box" type="text"name="signup_password_re" placeholder="패스워드 확인" maxlength="50">

			<!-- 이름 입력 -->
				<input id="signup_name" class="member_input_box" type="text"name="signup_name" placeholder="이름" maxlength="50"> <br>
				
			<!-- 회원가입 버튼 -->
				<input type="button" class="member_button_signup" value="회원가입" onclick="checkMember()">
			</form>
		</div>
		<span class="blank"></span>
	</div>
</body>
</html>

<!-- 세션 예외 처리 -->
<!-- gmail에서 실제로 인증받아서 인증되게 추가 -->
