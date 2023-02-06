<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
	<script type="text/javascript" charset="utf-8">sessionStorage.setItem("contextPath", "${pageContext.request.contextPath}");</script>
	<link href="${pageContext.request.contextPath}/resources/css/chatbot.css" rel="stylesheet">

<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header class="chat-header clearfix">
		<div>ict병원 챗봇</div>
	</header>

	<!-- 섹션 -->
	<section class="chat-section clearfix" id="chat-section">
		
		<!-- 한 덩이 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						안녕하세요 ict병원 챗봇입니다.<br>
						무엇을 도와드릴까요?
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn">
					<tr>
						<td class="howCome l-t">오시는 길</td>
						<td class="howReserve r-t">예약</td>
					</tr>
					<tr>
						<td class="chat-intro-doctor">의료진 소개</td>
						<td class="chat-frequency">자주하는 질문</td>
					</tr>
					<tr>
						<td class="chat-week-food bot" colspan="2">이번주 식단</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>


		<!-- 내과 -->
		<div id="display-none" class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						내과 전문의 리스트입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<c:forEach var="i" items="${doctorList}" varStatus="cls">
						<c:if test="${i.medicalDepartment == '내과'}">
							<tr>
								<td class="chat-doctor text-left clearfix">
									<!-- 사진 -->
									<div class="chat-doctor-img left">
										<img alt="" src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<!-- 컨텐트 -->
									<div class="left">
										<p>
											이름 : ${i.doctorName}<br>
											상세진료 : ${i.medicalCharge}
										</p>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 외과 -->
		<div id="display-none1" class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						외과 전문의 리스트입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<c:forEach var="i" items="${doctorList}">
						<c:if test="${i.medicalDepartment == '외과'}">
							<tr>
								<td class="chat-doctor text-left clearfix">
									<!-- 사진 -->
									<div class="chat-doctor-img left">
										<img alt="" src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<!-- 컨텐트 -->
									<div class="left">
										<p>
											이름 : ${i.doctorName}<br>
											상세진료 : ${i.medicalCharge}
										</p>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 피부과 -->
		<div id="display-none2" class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						피부과 전문의 리스트입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<c:forEach var="i" items="${doctorList}">
						<c:if test="${i.medicalDepartment == '피부과'}">
							<tr>
								<td class="chat-doctor text-left clearfix">
									<!-- 사진 -->
									<div class="chat-doctor-img left">
										<img alt="" src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<!-- 컨텐트 -->
									<div class="left">
										<p>
											이름 : ${i.doctorName}<br>
											상세진료 : ${i.medicalCharge}
										</p>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
	</section>
	
	<!-- 새 문의 버튼 -->
	<div class="chat-new-btn">
		<button type="button" id="newQuestion">새 문의하기</button>
		<button type="button" id="hospitalQna">간호상담 바로가기</button>
	</div>
	
	<footer class="chat-footer">
		<div class="chat-input-box">
			<input class="chat-search" type="text" placeholder="질문을 입력하세요.">	
		</div>
		<div class="chat-enter-box">
			<a href="#" onclick="event.preventDefault()">
				<img alt="" src="${pageContext.request.contextPath}/img/enter.PNG">
			</a>
		</div>
	</footer>


<script src="${pageContext.request.contextPath}/resources/js/chatbot.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a02665dd817da8aa65978237b7a6cec9"></script>
</body>
</html>
