<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/radiobutton.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
</head>
<body>
	<div id="wraper"  align="center">
	    <button id="click_button" align="center">딸깍해 보세요</button>
	    <div style="width: 400px;" id="button_content">
	    	<!-- partial:index.partial.html -->
		<div class="containerOuter">
		  <div class="container">
		    <input type="radio" class="hidden" id="input1" name="inputs">
		    <label class="entry" for="input1"><div class="circle"></div><div class="entry-label">Kingdom</div></label>
		    <input type="radio" class="hidden" id="input2" name="inputs">
		    <label class="entry" for="input2"><div class="circle"></div><div class="entry-label">Horse</div></label>
		    <input type="radio" class="hidden" id="input3" name="inputs">
		    <label class="entry" for="input3"><div class="circle"></div><div class="entry-label">Computer</div></label>
		    <div class="highlight"></div>
		    <div class="overlay"></div>
		  </div>
		</div>
		<svg width="0" height="0" viewBox="0 0 40 140">
		  <defs>
		    <mask id="holes">
		      <rect x="0" y="0" width="100" height="140" fill="white" />
		      <circle r="12" cx="20" cy="20" fill="black"/>
		      <circle r="12" cx="20" cy="70" fill="black"/>
		      <circle r="12" cx="20" cy="120" fill="black"/>
		    </mask>
		  </defs>
		</svg>
		<!-- partial -->
		  <script  src="./script.js"></script>
	    </div>
    </div>
    <script type="text/javascript">
      $('#click_button').click(function() {
        $('#button_content').slideToggle('slow', function() {
          // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
        });
      });
    </script>
    
</body>
</html>