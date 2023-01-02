<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
    
<%@include file="../include/header.jsp" %>
	
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/news/healthMain">건강 컬럼</a></li>
			</ul>
		</div>
	
	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">병원 소식</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        		<div class="news-right">
        			<a>관련도순</a> | <a>최신순</a> | <a>오래된순</a>
        		</div>
        	</div>
        	
        	<c:forEach var="vo" items="${newsList}">
        		<div class="news-group clearfix">
        			<div class="bnoBox">
        				<input class="bnoHidden" type="hidden" value="${vo.bno}">
        			</div>        		
	        		<div class="imgBox">
	        			<img class="newsImg" alt="newsImg" src="${pageContext.request.contextPath}/news/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileName}">
	        		</div>
		       		<div class="news-article">
      					<div class="article-content">
		       				<h2>
		       					<a href="${pageContext.request.contextPath}/news/newsDetail/${vo.bno}${pc.makeURI(pc.paging.pageNum)}">${vo.title}</a>
		       				</h2>
		       				<h4>
		        				${vo.content}
		     				</h4>
      					</div>
		       		</div>
        		</div>
        	</c:forEach>
        	
		<form action="<c:url value='/news/newsMain' />" name="pageForm">
			<div class="text-center"><hr>
				<ul id="pagination" class="pagination pagination-sm">
					<c:if test="${pc.prev}">
						<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
						<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" data-pagenum="${num}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pc.next}">
						<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		
		<!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭시 같이 숨겨서 보내 줄 공통 값 -->
		<input type="hidden" name="pageNum" value="${pc.paging.pageNum}" >
		<input type="hidden" name="cpp" value="${pc.paging.cpp}" >
		<input type="hidden" name="condition" value="${pc.paging.condition}" >
		<input type="hidden" name="keyword" value="${pc.paging.keyword}" >
		</form>
           	
			<div class="news-group clearfix">
				<div class="newsBtnBox">
					<button type="button" class="btn btn-info news-write-btn" onclick="location.href='${pageContext.request.contextPath}/news/newsRegist'">글쓰기</button> 		
        		</div>
        	</div>
        	
		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>