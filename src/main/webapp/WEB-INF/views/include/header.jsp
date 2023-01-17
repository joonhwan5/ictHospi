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
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">ict-병원</a>
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
            	<c:if test="${login==null && admin==null}">
          			<a id="login" href="<c:url value='/user/userLogin' />">&emsp;&emsp;로그인</a>
          		</c:if>
            	<c:if test="${login!=null || admin!=null}">
          			<a id="logout" href="<c:url value="/user/userLogout" />">&emsp;&emsp;로그아웃</a>
          		</c:if>
          	</div>
          </form>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
<script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>