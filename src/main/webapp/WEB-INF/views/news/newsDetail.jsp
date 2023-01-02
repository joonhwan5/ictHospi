<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<style>
		.news-content-group {
			display: block;
		}
		
		.imgBox {
			display: block;
		}
		
		 .articleBox {
			display: block;
		}
		
		.news-group {
			display: block;
		}
		
		.news-article {
			display: block;
		}
		
	</style>    
    
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
        	</div>
        	
        	<div class="news-article-box clearfix">
        	
        		<div class="news-content-group clearfix">
        			<input type="hidden" value="${article.bno}">
        			<h2 class="content-title">${article.title}</h2>
        			<p>${article.adminId}</p>
        			<p>${article.regDate}<p>
        			<hr>
        		</div>
        		
        		<div class="news-article clearfix">
        		
        			<div class="imgBox">
        				<img class="newsImg" alt="newsImg" src="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
	        		</div>
	        		
	        		<div class="articleBox clearfix">	
	        			<h4 class="newsContent">
							${article.content}	        				
	        			</h4>
        			</div>
        		</div>
        		
        		<hr>
        		
        		<div class="news-group clearfix">
					<div class="newsBtnBox">
						<button type="submit" class="btn btn-primary news-modify-btn" onclick="location.href='${pageContext.request.contextPath}/news/newsModify'">수정</button>
						<button type="button" class="btn btn-dark news-list-btn" onclick="location.href='${pageContext.request.contextPath}/news/newsMain'">목록</button> 		
						<button type="button" class="btn btn-primary news-delete-btn" onclick="location.href='${pageContext.request.contextPath}/news/newsDelete/${article.bno}'">삭제</button> 		
	        		</div>
        		</div>
        	
        	</div>
		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>