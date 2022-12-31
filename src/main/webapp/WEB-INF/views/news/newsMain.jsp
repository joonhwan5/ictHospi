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
        	
        	<div class="news-group clearfix">
        		<div class="imgBox">
        			<img class="newsImg" alt="newsImg1" src="${pageContext.request.contextPath}/resources/img/newsImg1.png">
        		</div>
        		<div class="news-article">
        			<div class="article-content">
	        			<h2>
	        				<a href="${pageContext.request.contextPath}/news/newsDetail">서울대병원, 초대형 한국인 우울증 유전자 연구 ‘코모젠D’ 진행</a>
	        			</h2>
	        			<h4>
	        				서울대병원이 미국국립정신건강연구소(NIMH)로부터 2021년부터 2026년까지 5년간 약 70억원의 연구비를 지원받아 초대형 한국인 우울증 유전자 연구 ‘코모젠D(KOMOGEN-D)’ 프로젝트를 진행한다. 
							‘코모젠D’ 프로젝트는 한국의 재발성 주요우울장애 여성 10,000명의 유전자와 면담 데이터를 모집해 우울증의 원인 유전자를 찾고, 이를 통해 향후 우울증의 경과 예측과 새로운 치료제 개발에 도움이 되는 것이 목표다.
		     			</h4>
        			</div>
        		</div>
        	</div>
           	
			<div class="news-group clearfix">
				<div class="newsBtnBox">
					<button type="button" class="btn btn-info news-write-btn" onclick="location.href='${pageContext.request.contextPath}/news/newsRegist'">글쓰기</button> 		
        		</div>
        	</div>
        	
		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>