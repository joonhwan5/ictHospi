<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %>

	<style>
		.news-group {
			padding: 10px;
			display: block;
			border: 1px solid black;
		}
<<<<<<< HEAD
=======
		
		.news-right {
			float: right;
			margin-bottom: 10px; 
		}
>>>>>>> origin/deukan
	
		.imgBox {
			width: 40%;
			float: left;
			text-align: center;
			border: 1px solid black;
			padding: 5px;
		}
		
		.healthImg {
			width: 70%;
		}
		
		.news-article {
			float: right;
			width: 60%;
			text-align: center;
			border: 1px solid black;
		}
		
		.article-content {
			text-align: left;
		}
		
		.healthBtnBox {
			width: 100%;
		}
		
		.health-write-btn {
			float: right;
		}
		
	</style>
	
	
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/news/healthMain">건강 컬럼</a></li>
			</ul>
		</div>
	
	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">건강 컬럼</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        		<div class="news-right">
        			<a>관련도순</a> | <a>최신순</a> | <a>오래된순</a>
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
     	  		<div class="imgBox">
        			<img class="healthImg" alt="durian" src="${pageContext.request.contextPath}/resources/img/durian.png">
        		</div>
        		<div class="news-article">
        			<div class="article-content">
	        			<h2>
	        				<a href="${pageContext.request.contextPath}/news/healthDetail">이젠 나도 먹을 수 있다! 두리안!!</a>
	        			</h2>
	        			<h4>
	        				두리안은 천국의 맛과 지옥의 냄새를 모두 가지고 있는 과일입니다. 냄새만 맡으면 먹을 수 없을 것 같지만 달콤한 맛이 매력적입니다.
	        			</h4>
        			</div>
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
     	  		<div class="imgBox">
        			<img class="healthImg" alt="durian" src="${pageContext.request.contextPath}/resources/img/durian.png">
        		</div>
        		<div class="news-article">
        			<div class="article-content">
	        			<h2>
	        				<a href="${pageContext.request.contextPath}/news/healthDetail">이젠 나도 먹을 수 있다! 두리안!!</a>
	        			</h2>
	        			<h4>
	        				두리안은 천국의 맛과 지옥의 냄새를 모두 가지고 있는 과일입니다. 냄새만 맡으면 먹을 수 없을 것 같지만 달콤한 맛이 매력적입니다.
	        			</h4>
        			</div>
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
     	  		<div class="imgBox">
        			<img class="healthImg" alt="durian" src="${pageContext.request.contextPath}/resources/img/durian.png">
        		</div>
        		<div class="news-article">
        			<div class="article-content">
	        			<h2>
	        				<a href="${pageContext.request.contextPath}/news/healthDetail">이젠 나도 먹을 수 있다! 두리안!!</a>
	        			</h2>
	        			<h4>
	        				두리안은 천국의 맛과 지옥의 냄새를 모두 가지고 있는 과일입니다. 냄새만 맡으면 먹을 수 없을 것 같지만 달콤한 맛이 매력적입니다.
	        			</h4>
        			</div>
        		</div>
        	</div>

			<div class="news-group clearfix">
				<div class="healthBtnBox">
<<<<<<< HEAD
					<button type="button" class="btn btn-info health-write-btn">글쓰기</button> 		
=======
					<button type="button" class="btn btn-info health-write-btn" onclick="location.href='${pageContext.request.contextPath}/news/healthRegist'">글쓰기</button> 		
>>>>>>> origin/deukan
        		</div>
        	</div>

		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>