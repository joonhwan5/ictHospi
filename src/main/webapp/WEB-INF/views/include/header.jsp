<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/offcanvas.css" rel="stylesheet">
	
	
	<link href="${pageContext.request.contextPath}/resources/css/myCss.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>

	<style>

	</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container header-container">
        <div class="navbar-header header-navbar-header clearfix">
          <button type="button" class="navbar-toggle collapsed right" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/logo.png" /></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/introduce/introMain/1">병원소개</a></li>
            <li><a href="${pageContext.request.contextPath}/news/newsMain">소식</a></li>
            <li><a href="${pageContext.request.contextPath}/notice/noticeMain">게시판</a></li>
            <c:if test="${login!=null}">
            	<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">마이페이지</a></li>
            </c:if>
            <c:if test="${admin!=null}">
            	<li><a href="${pageContext.request.contextPath}/admin/adminPageMain">관리자</a></li>
            </c:if>
          </ul>
          <form class="navbar-form navbar-right">
            
            <div class="form-group login-form-group">
            		<button type="button" class="chat-start btn"><img src="${pageContext.request.contextPath}/img/ogu-logo-nav.PNG" style="margin-right:10px;" />챗봇</button>
            	<c:if test="${login==null && admin==null}">
            		<button type="button" id="login" class="btn">로그인</button>
          		</c:if>
            	<c:if test="${login!=null || admin!=null}">
            		<button type="button" id="logout" class="btn">로그아웃</button>
          		</c:if>
          	</div>
          </form>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
<script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>
<script>

	$(document).on('mousedown', '*:not(body > div, body > div *)', function(e){
		e.stopPropagation();
		if($(this).prop('tagName') == 'BODY' && $('#navbar').hasClass('in')) {
			$('.navbar-toggle').click();
		}
	});

	$('.chat-start').click(function() {
		window.open('${pageContext.request.contextPath}/util/ictChatBot', 'ictChatBot', 'width=520, height=800, left=300, top=300');	
	});
	
	$('#login').click(function() {
		location.href = '${pageContext.request.contextPath}/user/userLogin';
	});
	$('#logout').click(function() {
		location.href = '${pageContext.request.contextPath}/user/userLogout';
	});
</script>