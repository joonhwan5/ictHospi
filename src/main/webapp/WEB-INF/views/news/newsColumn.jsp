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
		<h1 class="page-header">건강 컬럼</h1>
			<div class="news-head-row clearfix">
        		<div class="news-left">
        		</div>
        		<div class="news-right">
        			<a>관련도순</a> | <a>최신순</a> | <a>오래된순</a>
        		</div>
        	</div>
        	
        	<div class="news-group clearfix">
        		<div class="col-sm-4 col-md-4">
        			<img class="newsImg1" alt="durian" src="${pageContext.request.contextPath}/resources/img/durian.png">
        		</div>
        		<div class="news-article">
        			<h2>
        				<a href="${pageContext.request.contextPath}/news/healthContent">이젠 나도 먹을 수 있다! 두리안!!</a>
        			</h2>
        			<h4>
        				두리안은 천국의 맛과 지옥의 냄새를 모두 가지고 있는 과일입니다. 냄새만 맡으면 먹을 수 없을 것 같지만 달콤한 맛이 매력적입니다.
        			</h4>
        		</div>
        	</div>
        	<div class="news-group clearfix">
        		<div class="col-sm-4 col-md-4 news-img-box">
        			<img class="newsImg2" alt="choudofu" src="${pageContext.request.contextPath}/resources/img/choudofu.png">
        		</div>
        		<div class="news-article">
        			<h2 class="article-header">
        				<a href="">이젠 나도 먹을 수 있다! 취두부!!</a>
           			</h2>
        			<h4>
	        			취두부에 풍부하게 함유되어 있는 비타민B 성분은 체내의 혈관을 확장 시켜주고 혈류가 원활하게 흐를 수 있게 큰 도움을 줍니다. 또한 혈관이 튼튼해지면 혈관에 쌓은 노폐물들도 잘 쓸려 내려갑니다. 그래서 취두부를 섭취하게 되면, 혈관 질환을 효과적으로 예방하고 개선할 수 있습니다.
					</h4>
        		</div>
        	</div>

		</div>
	</div>
</div>
        
        
<%@include file="../include/footer.jsp" %>