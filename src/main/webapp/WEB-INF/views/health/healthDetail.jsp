<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<style>
		.health-content-group {
			display: block;
		}
		
		.imgBox {
			display: block;
		}
		
		 .articleBox {
			display: block;
		}
		
		.health-group {
			display: block;
		}
		
		.health-article {
			display: block;
		}
		
	</style>    
    
<%@include file="../include/header.jsp" %>
	
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/health/healthMain">건강 컬럼</a></li>
			</ul>
		</div>
	
	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">건강 컬럼</h1>
			<div class="health-head-row clearfix">
        		<div class="health-left">
        		</div>
        	</div>
        	
        	<form action="${pageContext.request.contextPath}/health/healthModify" method="POST" id="healthModifyFrom">
        		<input type="hidden" name="bno" value="${article.bno}">
        		<input type="hidden" name="title" value="${article.title}">
        		<input type="hidden" name="adminId" value="${article.adminId}">
        		<input type="hidden" name="regDate" value="${article.regDate}">
        		<input type="hidden" name="file" value="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
        		<input type="hidden" name="content" value="${article.content}">
        	</form>
        	
        	<div class="news-article-box clearfix">
        	
        		<div class="health-content-group clearfix">
        			<input type="hidden" name="bno" value="${article.bno}">
        			<h2 class="content-title">${article.title}</h2>
        			<p>${article.adminId}</p>
        			<p>${article.regDate}<p>
        			<hr>
        		</div>
        		
        		<div class="health-article clearfix">
        		
        			<div class="imgBox">
        				<img class="healthImg" alt="healthImg" src="${pageContext.request.contextPath}/health/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
	        		</div>
	        		
	        		<div class="articleBox clearfix">	
	        			<h4 class="healthContent">
							${article.content}	        				
	        			</h4>
        			</div>
        		</div>
        		
        		<hr>
        		
        		<div class="health-group clearfix">
					<div class="healthBtnBox">
						<button type="button" id="healthModifyBtn" class="btn btn-primary health-modify-btn">수정</button>
						<button type="button" class="btn btn-dark health-list-btn" onclick="location.href='${pageContext.request.contextPath}/health/healthMain'">목록</button> 		
						<button type="button" class="btn btn-primary health-delete-btn" onclick="location.href='${pageContext.request.contextPath}/health/healthDelete/${article.bno}'">삭제</button> 		
	        		</div>
        		</div>
        	
        	</div>
		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>


<script>

	$('#healthModifyBtn').click(function() {
		$('#healthModifyFrom').submit();
	});

</script>