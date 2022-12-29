<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %>

	<style>
	
		.news-content-group {
			display: inline;
			text-align: center;
			width: 50%;
		}
		
		.news-article {
			text-align: center;
		}
		
		.imgBox {
			padding-bottom: 15px; 
		}
		
		.newsImg {
			width: 50%;
		}
		
		.articleBox {
			padding: 20px;
		}
		
		.newsContent {
			text-align: center;
		}
		
	</style>
	
	
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/news/healthColumn">건강 컬럼</a></li>
			</ul>
		</div>
	
	
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">병원 소식</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        	</div>
        	
        	<div class="clearfix">
        	
        		<div class="news-content-group">
        			<h2 class="content-title">서울대병원, 초대형 한국인 우울증 유전자 연구 ‘코모젠D’ 진행</h2>
        			<p>KimAdmin</p>
        			<p>2022. 12. 07<p>
        			<hr>
        		</div>
        		
        		<div class="news-article">
        			<div class="imgBox">
        				<img class="newsImg" alt="newsImg1" src="${pageContext.request.contextPath}/resources/img/newsImg1.png">
	        		</div>
	        		
	        		<div class="articleBox">	
	        			<h4 class="newsContent">
	        				서울대병원이 미국국립정신건강연구소(NIMH)로부터 2021년부터 2026년까지 5년간 약 70억원의 연구비를 지원받아 초대형 한국인 우울증 유전자 연구 ‘코모젠D(KOMOGEN-D)’ 프로젝트를 진행한다. 
							‘코모젠D’ 프로젝트는 한국의 재발성 주요우울장애 여성 10,000명의 유전자와 면담 데이터를 모집해 우울증의 원인 유전자를 찾고, 이를 통해 향후 우울증의 경과 예측과 새로운 치료제 개발에 도움이 되는 것이 목표다.
							서울대병원 정신건강의학과 안용민 교수와 의생명연구원 이상진 연구교수팀은 총괄 연구기관으로 △서울권 15기관 △경기권 9기관 △충청강원권 6기관 △전라경상권 7기관 등 전국의 37개 종합병원과 이들의 협력병원 및 지역 정신건강복지센터 등과 함께 코모젠D 연구를 진행 중이라고 11일 밝혔다.
	        			</h4>
        			</div>
        		</div>
        	
        	</div>
		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>