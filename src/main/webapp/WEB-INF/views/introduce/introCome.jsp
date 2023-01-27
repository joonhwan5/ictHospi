<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<%@ include file="../include/introSide.jsp" %>
	</div>
</div>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="main intro-body1 clearfix">
		<div>
			<h1 class="headTitle">오시는 길</h1>
			<hr>
			<div class="clearfix">
				<div class="col-md-6">
					<img class="come-img img-responsive" alt="오시는 길" src="${pageContext.request.contextPath}/resources/img/ictHospi.jpg">
					<p class="comePage-p">
						서울특별시 마포구 백범로 23 (신수동 63-14) (우) 04108
					</p>
				</div>
				<div class="col-md-6">
					<div class="col-md-12 text-block">
						<h3>지하철로 오실 경우</h3>
						<p class="comePage-p">
							<span style="background:#4EB444;color:#fff">&nbsp;지하철 2호선&nbsp;</span>
							신촌역 6번 출구 - 서강대방면 150m <br>
							<span style="background:#AE4F00;color:#fff">&nbsp;지하철 6호선&nbsp;</span>
							대흥역 1번 출구 - 서강대방면 600m <br>
							<span style="background:#84C4A4;color:#fff">&nbsp;경의중앙선&nbsp;</span>
							서강대역 1번 출구 - 서강대방면 200m <br>
						</p>
					</div>
					<div class="col-md-12 text-block">
						<h3>버스로 오실 경우</h3>
						<p class="comePage-p">
							<span style="background:#395CB4;color:#fff">&nbsp;간선(파랑)버스&nbsp;</span>
							신촌로터리나 서강대앞 하차 <br>
							13-1, 19, 110, 163, 170, 171, 271, 371, 472, 602, 603, <br>
							604, 705, 740, 753 <br>
							<span style="background:#4A972E;color:#fff">&nbsp;지선(초록)버스&nbsp;</span>
							<br>
							1, 1-1, 3, 7, 8, 8-1, 11, 11-1, 19, 10, 5711, 5712, 5713, <br>
							5714, 7011, 7012, 7015, 7016, 7611, 7613, 7711, 7726 <br>
							<span style="background:red;color:#fff">&nbsp;광역(빨간)버스&nbsp;</span>
							<br>
							1100, 1200, 9602, 9713
						</p>
					</div>
					<div class="col-md-12 text-block">
						<h3>승용차로 오시는 경우</h3>
						<p class="comePage-p">
							네비게이션: "ICTHospital" 검색 <br>
							도로명주소: 서울시 마포구 백범로 23(신수동 63-14) ICTHospital <br>
							주차장 안내: 정문(스타벅스쪽) 우측 주차장 이용 (지상, 지하)
							<br>
							<br>
							<a href="https://map.naver.com/v5/entry/place/13323901?c=14129894.6754992,4515644.8778516,15,0,0,0,dh" class="a-naver">네이버 지도에서 보기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@include file="../include/footer.jsp" %>



