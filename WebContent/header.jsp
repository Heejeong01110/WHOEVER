<%@ page language="java" contentType="text/html; charset = utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"><strong>WHOEVER</strong></a>
		</div>
		
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" href="#"data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">
 						<img src="resources/images/loginicon.PNG" width="auto" height="25" border="0" margin="10">
 					</a>
					<ul class="dropdown-menu">
						<li><a href="login/login.jsp">로그인</a></li>
						<li><a href="login/signup.jsp">회원가입</a></li>
						<li><a href="#">회원정보</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>