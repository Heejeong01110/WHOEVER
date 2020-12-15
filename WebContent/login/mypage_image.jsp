<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String filedel = request.getParameter("filedel");
	//세션 받아오기
	String loginId = (String) session.getAttribute("sessionId");
	//이 값이 null이면 초기화 버튼 클릭
	
	//String fileUploadPath = "C:\\Github\\WHOEVER\\WebContent\\resources\\images"; //test용. 수정 필요
	String fileUploadPath = this.getServletContext().getRealPath("/resources/images");
	
	//DiskFileUpload upload = new DiskFileUpload();
	//List items = upload.parseRequest(request);
	//Iterator params = items.iterator();
	
	String fileName1 ="";// 중복처리된 이름
    String originalName1 ="";// 중복 처리전 실제 원본 이름
    long fileSize =0;// 파일 사이즈
    String fileType ="";// 파일 타입
    int maxSize =1024 *1024 *10;
    
    MultipartRequest multi =null;

    try{
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi =new MultipartRequest(request,fileUploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
        
        // 전송한 전체 파일이름들을 가져옴
        Enumeration files = multi.getFileNames();
         
        
        while(files.hasMoreElements()){
            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
            // 그에 해당하는 실재 파일 이름을 가져옴
            originalName1 = multi.getOriginalFileName(file1);
            
            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
            fileName1 = multi.getFilesystemName(file1);
            // 파일 타입 정보를 가져옴
            fileType = multi.getContentType(file1);
            // input file name에 해당하는 실재 파일을 가져옴
            File file = multi.getFile(file1);
            // 그 파일 객체의 크기를 알아냄
            fileSize = file.length();
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    
    if("null".equals(fileName1)){
    	response.sendRedirect("mypage.jsp");
    }else{
    	//db user_image 값 1로 만들기
    			String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    			Connection con = null;
    			PreparedStatement pstmt = null;

    			try {
    				Class.forName(JDBC_DRIVER);
    				con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
    				String sql;
    				if("no".equals(filedel)){//사진 초기화
    					sql = " UPDATE user SET user_image=? WHERE id = '" + loginId+"'";
    					pstmt = con.prepareStatement(sql);
    					pstmt.setString(1,"defaultusrimg.jpg");
    					int r = pstmt.executeUpdate();
    					pstmt.close();
    				}
    				else if(fileName1==null){
    					
    				}else{//사진 업로드
    					sql = " UPDATE user SET user_image=? WHERE id = '" + loginId+"'";
    					pstmt = con.prepareStatement(sql);
    					pstmt.setString(1, fileName1);
    					int r = pstmt.executeUpdate();
    					con.close();
    				}
    				
    				
    				
    				
    				
    			}catch (SQLException e) {
    				System.out.println("[SQL Error : " + e.getMessage() + "]");
    			} catch (ClassNotFoundException e1) {
    				System.out.println("[JDBC Connector Driver 오류 : " + e1.getMessage() + "]");
    			} finally {
    				if (pstmt != null) {
    					try {
    						pstmt.close();
    					} catch (SQLException e) {
    						e.printStackTrace();
    					}
    				}
    				if (con != null) {
    					try {
    						con.close();
    					} catch (SQLException e) {
    						e.printStackTrace();
    					}
    				}
    			}
    		
    		response.sendRedirect("mypage.jsp");
    }
%>