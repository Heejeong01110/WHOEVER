<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "java.io.PrintWriter" %>
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
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = './login/login.jsp'");
			script.println("</script>");
			
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
		//Tag tagDAO = new TagDAO().getTag(bbs_id);
		if(!user_id.equals(bbs.getUser_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		else{
			if(request.getParameter("bbs_title") == null || request.getParameter("bbs_content")== null || request.getParameter("bbs_title").equals("") || request.getParameter("bbs_content").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 내용이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				BbsDAO bbsDAO = new BbsDAO();
				TagDAO tagDAO = new TagDAO();
				//CategoryDAO categoryDAO = new CategoryDAO();
				request.setCharacterEncoding("utf-8");
				String type = request.getParameter("bbs_type");
				String[] tagArray = request.getParameter("tag_name").split(" ");
				for(int i = 0; i < tagArray.length; i++){
				System.out.println("카테고리\n" + tagArray[i]);
				}
				/*for(int i = 0; i < tagArray.length; i++){
					tagContent = tagArray[i];
				}*/
				//int hash1 = categoryDAO.Hashtag(tagArray);
				
				int result = bbsDAO.update(bbs_id, request.getParameter("bbs_title"), request.getParameter("bbs_content"),type);
				int delete = tagDAO.delete(bbs_id);
				int insert= tagDAO.Hashtag(tagArray);
			
				out.println("타입: \n"+ bbs.getBbs_type());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(delete == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('태그 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				/*if(insert == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('태그 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}*/
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'view.jsp?bbs_id="+bbs_id+"'");
					script.println("</script>");
				}
			}
			
		}
	%>
</body>
</html>