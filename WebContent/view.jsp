<%@ page language="java" contentType="text/html; charset = utf-8"
	pageEncoding="utf-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "tag.Tag" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css " />
<meta name = "viewport" content= "width=device-width", initial-scale="1">
<script src="./resources/js/hashtag.js"></script>
<title>게시판</title>
</head>
<body>
	<% 
		
		String user_id = null;
		if(session.getAttribute("sessionId") != null){
			user_id = (String)session.getAttribute("sessionId");
		}
		int bbs_id = 0;
		if(request.getParameter("bbs_id") != null){
			bbs_id = Integer.parseInt(request.getParameter("bbs_id"));
		}
		if(bbs_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbs_id);
		
		
		//세션 확인
		int loginBbsIdequal=-1;//-1인 경우 로그인 안한경우, 0인경우 일치X, 1인경우 일치O
		if(user_id==null){ //접근 X
			out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"login/login.jsp\"; </script>");
			loginBbsIdequal=-1;
		}else if(bbs.getUser_id().equals(user_id)){
			loginBbsIdequal=1;
		}else{
			loginBbsIdequal=0;
		}
		//Tag tag = new TagDAO().getTag(bbs_id);
		TagDAO tagDAO = new TagDAO();
	%>	
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">게시판
								글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style = "width: 20%;">글 제목</td>
							<td colspan = "2"><%= bbs.getBbs_title() %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan = "2"><%= bbs.getUser_id() %></td>
						</tr>
						<tr>
							<td>태그</td>
							<td colspan = "2"><%=tagDAO.getTag(bbs_id)%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan = "2"><%=bbs.getBbs_date().substring(0 , 11) + bbs.getBbs_date().substring(11, 13) + "시 " + bbs.getBbs_date().substring(14, 16) + "분 " + bbs.getBbs_date().substring(17, 19) + "초"%></td>
						</tr>
						<tr>
							<td>키워드</td>
							<td colspan = "2"><%= bbs.getBbs_type() %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan = "2"><%= bbs.getBbs_content() %></td>
						</tr>

					</tbody>

				</table>
				<a href = "main.jsp" class = "btn btn-primary">목록</a>
				<%
					if(loginBbsIdequal==1){ //일치
						out.println("<a href = \"update.jsp?bbs_id="+bbs_id+"\" class = \"btn btn-primary\">수정</a>");
						out.println("<a onclick = \"return confirm('정말로 삭제하시겠습니까?')\" href = \"deleteAction.jsp?bbs_id="+bbs_id+"\" class = \"btn btn-primary\">삭제</a>");
					}else if(loginBbsIdequal==0){//일치 안함
						
					}
				%>
				
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		


		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>