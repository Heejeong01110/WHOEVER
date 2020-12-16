<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "tag.Tag" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css "/>
<title>게시판</title>
</head>
<body>

   <%
      String user_id = null;
      //String user_id = (String) session.getAttribute("sessionId");
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
      TagDAO tagDAO = new TagDAO();
      //Tag tagDAO = new TagDAO().getTag(bbs_id);
      if(!user_id.equals(bbs.getUser_id())){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다.')");
         script.println("location.href = 'main.jsp'");
         script.println("</script>");
      }
      String A = " ";
      String B = " ";
      String type = bbs.getBbs_type();
      System.out.println("타입: \n"+type);
      if(type.equals("구인")){
         A = "checked";
      } else{
         B = "checked";
      }
   %>
   <jsp:include page="header.jsp" />
   <div class="container">
      <div class="row">
         <form method="post" action="updateAction.jsp?bbs_id=<%=bbs_id%>">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">게시판
                        글 수정</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="radio" placeholder="종류" name="bbs_type"
                        maxlength="20" value="구인" <%=A%>>구인 <input type="radio"
                        placeholder="종류" name="bbs_type" maxlength="20" value="구직" <%=B%>>구직
                     </td>
                  </tr>
                  <tr>
                     <td><input type = "text" class = "form-control" placeholder = "키워드" name = "tag_name" maxlength = "30" value = "<%=tagDAO.getTag(bbs_id).substring(1)%>">
                     </td>
                  </tr>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="제목"
                        name="bbs_title" maxlength="50" value = "<%=bbs.getBbs_title()%>"></td>
                  </tr>
                  <tr>
                     <td ><textarea class="form-control" placeholder="내용"
                           name="bbs_content" maxlength="2048" style="height: 350px;"><%= bbs.getBbs_content() %></textarea></td>
                  </tr>

               </tbody>

            </table>
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
         </form>


      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>