function CheckSignupVal() {

	var agree_ok = document.getElementById("agree_ok");
	var email = document.getElementById("signup_email");
	var id = document.getElementById("signup_id");
	var pwd = document.getElementById("signup_password");
	var pwd_re = document.getElementById("signup_password_re");
	var signup_name = document.getElementById("signup_name");
	
	// 약관 체크 여부
	if(agree_ok.value.checked){
    	alert("동의.");
    	document.signup_info.signup_email.select();
    	return false;
	}
	else if(email.value==""){
    	alert("이메일을 입력하세요.");
    	email.select();
    	return false;
	}
	else if(id.value==""){
    	alert("아이디를 입력하세요.");
    	document.signup_info.signup_password.select();
    	return false;
	}
	else if(pwd.value==""){
    	alert("비밀번호를 입력하세요.");
    	document.signup_info.signup_password.select();
    	return false;
	}
	else if(pwd_re.value==""){
    	alert("비밀번호를 입력하세요.");
    	document.signup_info.signup_password.select();
    	return false;
	}
	else if(signup_name.value==""){
		alert("이름을 입력하세요.");
    	document.signup_info.signup_password.select();
    	return false;
	}
}

