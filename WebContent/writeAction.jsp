<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "message.ChattingDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "tag" class = "tag.Tag" scope="page"/>
<jsp:setProperty name = "tag" property = "tag_name"/>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css "/>
<title>게시판</title>
</head>
<body>
   <%
   //String loginId = (String) session.getAttribute("sessionId");
    //  String loginUserId = (String) session.getAttribute("sessionUserId"); //user 인덱스번호
      
      //로그인 필요한 서비스의 경우
      /*if(loginId==null ||loginUserId==null){
         out.println("<script> alert(\"로그인이 필요합니다.\"); window.location= \"login/login.jsp\"; </script>");}*/
      Bbs bbs = new Bbs();
      BbsDAO bbsDAO = new BbsDAO();
      TagDAO tagDAO = new TagDAO();
      ChattingDAO chatDAO = new ChattingDAO(); 
      //String user_id = null;
       String loginUserId = null;
       String loginId = null;
       String title = request.getParameter("bbs_title");
       String content = request.getParameter("bbs_content");
      //세션 받아오기
     
      //String user_id = (String) session.getAttribute("sessionId");
      if(session.getAttribute("sessionId") != null){
           loginId = (String) session.getAttribute("sessionId"); //user 이름
           //loginUserId =  (String) session.getAttribute("sessionUserId"); //user 인덱스번호
          
          // out.println("id:"+loginUserId + " "+ loginId);
      }
      
      if(loginId.equals(null)){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인을 하세요.')");
         script.println("location.href = './login/login.jsp'");
         script.println("</script>");
      } else{
         if(request.getParameter("bbs_title") == null || request.getParameter("bbs_content") == null || request.getParameter("bbs_type") == null || request.getParameter("tag_name") == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력되지 않은 내용이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         } else{
            //BbsDAO bbsDAO = new BbsDAO();
            //TagDAO tagDAO = new TagDAO();
            //CategoryDAO categoryDAO = new CategoryDAO();
            request.setCharacterEncoding("utf-8");
            String type = request.getParameter("bbs_type");
            String[] tagArray = request.getParameter("tag_name").split(" ");
            for(int i = 0; i < tagArray.length; i++){
            System.out.println("카테고리\n" + tagArray[i]);
            }
            
            //int hash1 = categoryDAO.Hashtag(tagArray);
            
            int result = bbsDAO.write(title,loginId, content ,type);
            int hash2 = tagDAO.Hashtag(tagArray);
            out.println("타입: \n"+ bbs.getBbs_type());
            if(result == -1){
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('글쓰기에 실패했습니다.')");
               script.println("history.back()");
               script.println("</script>");
            }
            else{
               chatDAO.createChatting(loginId, Integer.toString((bbsDAO.getRow()+1)));
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href = 'bbs.jsp'");
               script.println("</script>");
            }
         }
       }
   
   %>
</body>
</html>