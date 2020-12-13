<%@ page language = "java" contentType = "text/html; charset = utf-8" pageEncoding = "utf-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "tag.TagDAO" %>
<%@ page import = "category.CategoryDAO" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "bbs" class = "bbs.Bbs" scope="page"/>
<jsp:useBean id = "category" class = "category.Category" scope="page"/>
<jsp:useBean id = "tag" class = "tag.Tag" scope="page"/>
<jsp:setProperty name = "bbs" property = "bbs_title"/>
<jsp:setProperty name = "bbs" property = "bbs_content"/>
<jsp:setProperty name = "tag" property = "tag_name"/>
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
			
		} else{
			if(bbs.getBbs_title() == null || bbs.getBbs_content() == null){
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
				
				int result = bbsDAO.write(bbs.getBbs_title(), user_id, bbs.getBbs_content() ,type);
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