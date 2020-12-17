<%@ page language="java" contentType="text/html; charset = utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css " />
<link rel="stylesheet" href="./resources/css/card.css" />
<link rel="stylesheet" href="./resources/css/search.css?after">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="./resources/js/hashtag.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "tag.Tag" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.*" %>
<title>WHOEVER</title>

</head>

<script type="text/javascript">
   function moreList() {
       var startNum = Number(document.getElementById('more').value); //몇번째 호출인지 확인--> 마지막 리스트 번호 : startNum*4
       var addListHtml = "";  
       var params="startNum="+startNum;
       var nextNum = startNum + 4;
       $('#more').val(nextNum);
       
       //alert("startNum "+ String(startNum)+" 출력해주라"); //콘솔로그로 startNum에 값이 들어오는지 확인
    
       
        $.ajax({
           url : "./insert_board.jsp", //실행할 자바파일 부르기(또는 jsp)
           type : "post",
           dataType : "json",
           data : params, //전송데이터
           
           success : function(webData) {
              console.log(webData);
               var addListHtml ="";
               if(webData.length > 0){
                  if(webData.length < 4){ //게시글 전체 수가 4개보다 적을 때??
                       $("#more").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
                   }
                   for(var i=0; i<webData.length;i++) {
                      //alert(webData);
                      
                       var idx = Number(startNum)*4+Number(i)+1;   
                          // 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
                       addListHtml += "<a href=\"view.jsp?bbs_id="+webData[i].bbs_id +"\">";
                       addListHtml += "<div class=\"bbs\">";
                       //bbs 헤더
                       addListHtml += "<div class=\"bbs-header\">";
                       addListHtml += "<div class=\"bbs-header-is_closed\">"
                       addListHtml +=" <div class=\"bbs-header-text\">"+webData[i].bbs_type+"</div>";
                       addListHtml += "<div class=\"bbs-header-number\">"+"2 / 5"+"</div>"
                       addListHtml += "</div>";
                       addListHtml += "</div>";
                       //카트 바디
                       addListHtml += "<div class=\"bbs-body\">";
                       addListHtml += "<div class=\"bbs-body-header\">";
                       addListHtml += "<h1>"+webData[i].bbs_title+"</h1>"
                       addListHtml += "<p class=\"bbs-body-hashtag\"></p>"
                       addListHtml += "<p class=\"bbs-body-nickname\">작성자:"+webData[i].bbs_userId+"</p>"
                       addListHtml += "</div>";
                       addListHtml += "<p class=\"bbs-body-description\">"+webData[i].bbs_content+"</p>";
                       //카트바디 본문
                       //카트바디 푸터
                       addListHtml += "<div class=\"bbs-body-footer\">";
                       addListHtml += "<hr style=\"margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31\">"
                       addListHtml += "<i class=\"icon icon-view_count\"></i>"+"조회 38회";
                       addListHtml += "<i class=\"reg_date\">"+webData[i].bbs_date.substring(0 , 11)+webData[i].bbs_date.substring(11, 13)+"시 "+webData[i].bbs_date.substring(14, 16) + "분 " + webData[i].bbs_date.substring(17, 19) + "초";
                       addListHtml += "</i>"
                       addListHtml += "</div>";
                       
                       addListHtml += "</div>";
                       addListHtml += "</div>";
                       addListHtml += "</a>";
                   }
                   $("#listBody").append(addListHtml);
               }//if 종료
               
           }//success
       });
       
   }
</script>


<body>
   <jsp:include page="header.jsp" />
   <%
      int oncePage = 4;
   	  int vButton = 1;
      String msg = request.getParameter("msg");
      
      String loginId = (String) session.getAttribute("sessionId");
      if(loginId==null){
    	  out.println(" <h2 class='alert alert-danger'>" + "로그인이 필요합니다.</h2>");
      }
      else{
    	  out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");  
      }
   %>
   
   <div class="search__container" style="width: 450px; margin: 0 auto; margin-top: 50px">
       <p class="search__title">
           WHOEVER
       </p>
       <form name = "searchBox" action = "mainServlet?cmd=search" method="post">
          <select id="searchType" name="searchType">
            <option value="all" <c:if test= "${param.searchType=='all'}">selected="selected"</c:if>>전체</option>
            <option value="title" <c:if test = "${param.searchType=='title'}">selected="selected"</c:if>>제목</option>
            <option value="tag" <c:if test = "${param.searchType=='tag'}">selected="selected"</c:if>>태그</option>
            <option value="content" <c:if test = "${param.searchType =='content'}">selected="selected"</c:if>>내용</option>
            <option value="user" <c:if test = "${param.searchType=='user'}">selected="selected"</c:if>>작성자</option>
          </select>
          <input class="search__input" type="text" placeholder="Search" name = "searchData">
          <p> <!-- <input type="submit" value = "전송"> -->
       </form>
   </div>

   <%
      Bbs bbsvo = new Bbs();
      TagDAO tagDAO = new TagDAO();
      ArrayList<Bbs> bbslist = (ArrayList<Bbs>)request.getAttribute("bbslist");
      if(bbslist!=null) {
    	  vButton = 0;
    	  if((int)request.getAttribute("isEmpty") == 1){
    		  out.println("<script> alert('검색어를 입력해주세요!'); window.history.back(); </script>");
    		  
    	  }
         for(Bbs B: bbslist){
      %>
   <a href="view.jsp?bbs_id=<%= B.getBbs_id()%>"> <!-- 클릭 시 링크 설정 -->
      <div class="bbs">
         <!-- BBS 헤더 -->
         <div class="bbs-header">
            <div class="bbs-header-is_closed">
               <div class="bbs-header-text"><%=B.getBbs_type()%></div>
               <div class="bbs-header-number">2 / 5</div>
            </div>

         </div>
         <!--  카드 바디 -->

         <div class="bbs-body">
            <!--  카드 바디 헤더 -->
            <div class="bbs-body-header">
               <h1><%=B.getBbs_title()%></h1>
               <p class="bbs-body-hashtag"></p>
               <p class="bbs-body-nickname">작성자: <%= B.getUser_id() %></p>
            </div>

            <p class="bbs-body-description"><%=B.getBbs_content()%></p>
            <!--  카드 바디 본문 -->
            <!--  카드 바디 푸터 -->

            <div class="bbs-body-footer">
               <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
               <i class="icon icon-view_count"></i>조회 38회 
               <i class="reg_date"><%=B.getBbs_date().substring(0 , 11) + B.getBbs_date().substring(11, 13) + 
                  "시 " + B.getBbs_date().substring(14, 16) + "분 " + B.getBbs_date().substring(17, 19) + "초"%>
               </i>
            </div>
         </div>
      </div>
   </a>
   <%
         }
      }else{
         BbsDAO bbsdao = new BbsDAO();
         bbslist = bbsdao.allElement();
         int firstNotification = 0;
         for(Bbs B: bbslist){
   %>
   <a href="view.jsp?bbs_id=<%= B.getBbs_id()%>"> <!-- 클릭 시 링크 설정 -->
      <div class="bbs">
         <!-- BBS 헤더 -->
         <div class="bbs-header">
            <div class="bbs-header-is_closed">
               <div class="bbs-header-text"><%=B.getBbs_type()%></div>
               <div class="bbs-header-number">2 / 5</div>
            </div>

         </div>
         <!--  카드 바디 -->

         <div class="bbs-body">
            <!--  카드 바디 헤더 -->
            <div class="bbs-body-header">
               <h1><%=B.getBbs_title()%></h1>
               <p class="bbs-body-hashtag"></p>
               <p class="bbs-body-nickname">작성자: <%=B.getUser_id()%></p>
            </div>

            <p class="bbs-body-description"><%=B.getBbs_content()%></p>
            <!--  카드 바디 본문 -->
            <!--  카드 바디 푸터 -->

            <div class="bbs-body-footer">
               <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
               <i class="icon icon-view_count"></i>조회 38회 
               <i class="reg_date"><%=B.getBbs_date().substring(0 , 11) + B.getBbs_date().substring(11, 13) + 
                  "시 " + B.getBbs_date().substring(14, 16) + "분 " + B.getBbs_date().substring(17, 19) + "초"%>
               </i>
            </div>
         </div>
      </div>
   </a>
   <%      
   			firstNotification++;
            if(firstNotification == 4)
               break;
         }
      }
   %>
   <div id="listBody">
   </div>
   
   <% 
   		//검색하면 더보기를 없앤다
   		if(vButton == 1){
   %>
   <div id="test" style="display:block">
   	<button type="button" class="page_more" id="more" onclick="moreList()" value="<%=oncePage%>" >더보기..</button>
   </div>
   <% 
   		}else{
   %>
   <div id="test" style="display:none">
   	<button type="button" class="page_more" id="more" onclick="moreList()" value="<%=oncePage%>" >더보기..</button>
   </div>
   <% 
   		}
   %>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="resources/js/bootstrap.js"></script>
</body>
</html>