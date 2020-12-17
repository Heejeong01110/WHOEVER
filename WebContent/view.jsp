<%@ page language="java" contentType="text/html; charset = utf-8"
	pageEncoding="utf-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "tag.Tag" %>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css " />
<meta name = "viewport" content= "width=device-width", initial-scale="1">
<script src="./resources/js/hashtag.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="./resources/css/container.css " />
<script src = "https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>게시판</title>

<script>    
        //$(document.ready(function(){ .. });

        $(function(){
            //$("#dialog").dialog();
            $("#dialog").dialog({
                autoOpen:true, //자동으로 열리게
                position:{my:"center"}, //x,y  값을 지정
                width: 'auto',
                height: 'auto',
                //"center", "left", "right", "top", "bottom"
                modal:true, //모달대화상자
                resizable:true, //크기 조절 
                show: {                // 애니메이션 효과 - 보여줄때
                    effect: "explode",
                    duration: 1000
                },
                close : function(){
       				alert("메인으로 이동합니다.");
					location.href = "main.jsp";
                
                    // functionality goes here
                }  
               /*  buttons:{
                    "확인":function(){
                        $(this).dialog("close");
                    },"취소":function(){
                        $(this).dialog("close");
                    }
                } */
            });

            //창 열기 버튼을 클릭했을경우
           /*  $("#btn").on("click",function(){
                $("#dialog").dialog("open"); //다이얼로그창 오픈                
            }); */
        });
      
        
       
    </script>
    
</head>
<body>
	<% 
		 request.setCharacterEncoding("utf-8"); 
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
		int flag = 0;
		if(request.getParameter("flag") != null){
			flag = Integer.parseInt(request.getParameter("flag"));
		}
		
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
<%-- 	<jsp:include page="header.jsp" /> --%>
	
	<div id="dialog" class="container">
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
				<a href = "main.jsp" class = "btn btn-primary">전체 목록</a>  
				<%
					
					if(loginBbsIdequal==1 && flag == 1){ //일치
						out.println("<a href = \"bbs.jsp\" class = \"btn btn-primary\">내가 쓴 글 목록</a>");
					}
					
					if(loginBbsIdequal==1){ //일치
						out.println("<a href = \"update.jsp?bbs_id="+bbs_id+"\" class = \"btn btn-primary\">수정</a>");
						out.println("<a onclick = \"return confirm('정말로 삭제하시겠습니까?')\" href = \"deleteAction.jsp?bbs_id="+bbs_id+"\" class = \"btn btn-primary\">삭제</a>");
					}else if(loginBbsIdequal==0){//일치 안함
						
					}
				%>
				
				<!-- <input type="submit" class="btn btn-primary pull-right" value="글쓰기"> -->
		


		</div>
	</div>
	<div class="back"></div> 

</body>
</html>