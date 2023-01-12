<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
	
	<script type="text/javascript" charset="utf-8">sessionStorage.setItem("contextPath", "${pageContext.request.contextPath}");</script>
	<link href="${pageContext.request.contextPath}/resources/css/chatbot.css" rel="stylesheet">

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
				<table class="chat-btn textbox">
					<tr>
						<td class="howCome l-t">오시는 길</td>
						<td class="howReserve r-t">예약</td>
					</tr>
					<tr>
						<td>의료진 소개</td>
						<td>자주하는 질문</td>
					</tr>
					<tr>
						<td colspan="2">병원 소식</td>
					</tr>
					<tr>
						<td class="bot" colspan="2">이번주 식단</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 의료진 소개 -->
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
						의료진 소개 서비스입니다.<br>
						아래 메뉴 중 원하시는 과를 선택해 주세요.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top">내과</td>
					</tr>
					<tr>
						<td>외과</td>
					</tr>
					<tr>
						<td class="bot">피부과</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 내과 -->
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
						내과 전문의 리스트입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="chat-doctor text-left clearfix">
							<!-- 사진 -->
							<div class="chat-doctor-img left">
								<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
							</div>
							<!-- 컨텐트 -->
							<div class="left">
								<p>
									이름 : 허준<br>
									상세진료 : 오목
								</p>
							</div>
							<img alt="" src="">
						</td>
					</tr>
					<tr>
						<td class="chat-doctor text-left clearfix">
							<!-- 사진 -->
							<div class="chat-doctor-img left">
								<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
							</div>
							<!-- 컨텐트 -->
							<div class="left">
								<p>
									이름 : 허준<br>
									상세진료 : 오목
								</p>
							</div>
							<img alt="" src="">
						</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 자주하는 질문 -->
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
						사용자들이 가장 많이 찾은 질문 목록입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top">예약하기</td>
					</tr>
					<tr>
						<td>예약수정</td>
					</tr>
					<tr>
						<td>이번주 식단</td>
					</tr>
					<tr>
						<td>병원 소식</td>
					</tr>
					<tr>
						<td class="bot">오시는 길</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
	</section>
	
	<!-- 새 문의 버튼 -->
	<div class="chat-new-btn">
		<button type="button" id="newQuestion">새 문의하기</button>
		<button type="button">간호상담 바로가기</button>
	</div>
	
	
	<footer class="chat-footer">
		<div class="chat-input-box">
			<input class="chat-search" type="text" placeholder="질문을 입력하세요.">	
		</div>
		<div class="chat-enter-box">
			<a href="#">
				<img alt="" src="${pageContext.request.contextPath}/img/enter.PNG">
			</a>
		</div>
	</footer>


<script src="${pageContext.request.contextPath}/resources/js/chatbot.js"></script>

</body>
</html>



<script>

	//지도 보기
	$('#chat-section').on('mousedown', '.hospitalMap', function(e){
		answerMessage(e.target.textContent);
		let str = 
			`<!-- 지도보기 이용안내 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="../img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="top">
								지도 안내
							</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">
								<div id="map" style="width:500px;height:400px;">
									
								</div>
							</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		
		appendFrag(str);
	});


</script>