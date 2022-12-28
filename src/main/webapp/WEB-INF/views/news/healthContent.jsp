<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %>

	<style>
	
		.news-group {
			display: block;
			text-align: center;
			width: 100%;
		}
		
		.newsImg {
			width: 50%;
		}
		
	</style>
	
	
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/news/newsColumn">건강 컬럼</a></li>
			</ul>
		</div>
	
	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">건강 컬럼</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
        		<div class="col-sm-4 col-md-4">
        			<h2 class="content-title">이젠 나도 먹을 수 있다! 두리안!!</h2>
        			<p>KimAdmin</p>
        			<p>2022. 12. 07<p>
        			<hr>
        		</div>
        		<div class="news-article">
        			<img class="newsImg" alt="newsImg2" src="${pageContext.request.contextPath}/resources/img/durian.png">
        			<h4>
        				두리안은 천국의 맛과 지옥의 냄새를 모두 가지고 있는 과일입니다. 냄새만 맡으면 먹을 수 없을 것 같지만 달콤한 맛이 매력적입니다.
        			</h4>
        		</div>
        	</div>

		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>