<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %>

	<style>
		.news-group {
			display: inline;
		}
		
		.news-article > h2 {
		margin: 0px;
		}
		
		.newsImg1 {
			width: 100%;
		}
		
		.newsImg2 {
			width: 100%;
		}
	
		.news-img-box {
			width : 50%;
			text-align: center;
		}
		
		.news-article {
			width : 50%;
			text-align: center;
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
		<h1 class="page-header">병원 소식</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        		<div class="news-right">
        			<a>관련도순</a> | <a>최신순</a> | <a>오래된순</a>
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
        		<div class="col-sm-4 col-md-4">
        			<img class="newsImg1" alt="newsImg2" src="${pageContext.request.contextPath}/resources/img/newsImg2.png">
        		</div>
        		<div class="news-article">
        			<h2>
        				<a href="${pageContext.request.contextPath}/news/newsContent">서울대병원, 초대형 한국인 우울증 유전자 연구 ‘코모젠D’ 진행</a>
        			</h2>
        			<h4>
        				서울대병원이 미국국립정신건강연구소(NIMH)로부터 2021년부터 2026년까지 5년간 약 70억원의 연구비를 지원받아 초대형 한국인 우울증 유전자 연구 ‘코모젠D(KOMOGEN-D)’ 프로젝트를 진행한다. 
						‘코모젠D’ 프로젝트는 한국의 재발성 주요우울장애 여성 10,000명의 유전자와 면담 데이터를 모집해 우울증의 원인 유전자를 찾고, 이를 통해 향후 우울증의 경과 예측과 새로운 치료제 개발에 도움이 되는 것이 목표다.
						서울대병원 정신건강의학과 안용민 교수와 의생명연구원 이상진 연구교수팀은 총괄 연구기관으로 △서울권 15기관 △경기권 9기관 △충청강원권 6기관 △전라경상권 7기관 등 전국의 37개 종합병원과 이들의 협력병원 및 지역 정신건강복지센터 등과 함께 코모젠D 연구를 진행 중이라고 11일 밝혔다.
        			</h4>
        		</div>
        	</div>
        	<div class="news-group clearfix">
        		<div class="col-sm-4 col-md-4 news-img-box">
        			<img class="newsImg2" alt="newsImg1" src="${pageContext.request.contextPath}/resources/img/newsImg1.png">
        		</div>
        		<div class="news-article">
        			<h2 class="article-header">
        				<a href="">서울대병원 이정훈·권오상·최홍윤 교수, 함춘학술상 수상</a>
           			</h2>
        			<h4>
	        			서울대병원은 소화기내과 이정훈·피부과 권오상·핵의학과 최홍윤 교수가 최근 개최된 제26회 함춘학술상 시상식에서 우수한 연구 성과를 인정받아 ‘함춘학술상’을 수상했다고 22일 밝혔다.
	 					서울의대동창회가 매년 시상하는 ‘함춘학술상’은 동문 교수들의 연구의욕을 고취시키기 위해 제정됐다. 동아쏘시오그룹 강신호 명예회장이 후원하는 ‘함춘동아의학상(상금 3천만원)’과 동창회학술연구재단이 후원하는 ‘함춘의학상‧함춘젊은연구자상(상금 1천만원)’으로 나눠 시상한다.
					</h4>
        		</div>
        	</div>

		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>