<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	
	#innerTitle {
		margin-bottom: 0;
	}
	
	#chatCon {
		margin-left: 15px;
	}
	
	.client-service-container {
		margin-top: 13vh;
	}
	
	.MainBanner-main-banner {
		margin-bottom: 30px;
		text-align: center;
	}
	
	.MainBanner-main-banner #atag #mainTitle {
	    line-height: 5.6rem;
	    font-size: 5.6rem;
		text-align: center;
		color: black;
	}
	
	#atag:hover {
		text-decoration: none;
	}
	
	.question-main, .transfer-main, .chatbot-main {
		margin-bottom: 80px;
	}
	
	.clientInner {
		position: relative;
	    padding: 0 40px;
	    height: 100%;
	    max-width: 1130px;
	    margin: 40px auto;
	}
	
	.service-question {
		padding-left: 40px;
	}
	
	.question-list {
		margin-left: -15px;
		padding-inline-start: 0px;
		list-style: none;
	}
	
	.question-list-box {
	    display: inline-block;
	    width: 240px;
	    margin-top: 30px;
	    vertical-align: top;
	}
	
	.question-list-box .question-list-btn {
		margin: 0 15px;
		height: 130px;
		border: 1px solid #e0e0e0;
		border-radius: 16px;
		box-sizing: border-box;
	}
	
	.question-list-box .question-list-btn > .clientButton:hover {
		background: black;
		color: white;
		transform: scale(1.05);
		transition: 0.5s;
		border-radius: 16px;
	}
	
	.clientButton {
		height: 100%;
		appearance: none;
	    border: 0;
	    background: none;
	    cursor: pointer;
	    color: inherit;
	}
	
	.transfer-list {
		list-style: none;
	}
	
	.transfer-list .transfer-box {
		display: inline-block;
    	width: 190px;
    	margin-top: 36px;
    	vertical-align: top;
    	text-align: center;
	}
	
	#claimIcon, #noticeIcon, #newsIcon, #mapIcon, #introIcon, #hoverClaim, #hoverNotice, #hoverNews, #hoverMap, #hoverIntro {
		width: 100px;
		height: 100px;
		border: 1px solid #e0e0e0;
		border-radius: 16px;
		box-sizing: border-box;
	}
	
	.transfer-box #iconName {
		display: block;
	    padding: 16px 4px 0;
	    line-height: 20px;
	    text-align: center;
	    font-size: 18px;
	    color: #222;
	}
	
	#hoverClaim, #hoverNotice, #hoverNews, #hoverMap, #hoverIntro {
		display: none;
	}
	
	.transfer-box:hover {
		transform: scale(1.1);
		transition: 0.5s;
	}
	
	.transfer-box:hover #introIcon, .transfer-box:hover #claimIcon, .transfer-box:hover #noticeIcon, .transfer-box:hover #newsIcon, .transfer-box:hover #mapIcon {
		display: none;
	}
	
	.transfer-box:hover #hoverNews, .transfer-box:hover #hoverClaim, .transfer-box:hover #hoverNotice, .transfer-box:hover #hoverMap, .transfer-box:hover #hoverIntro {
		display: block;
		margin: 0 auto;
	}
	
	.service-chatbot {
		width: 420px;
		height: 150px;
		border: 1px solid #e0e0e0;
		border-radius: 16px;
		box-sizing: border-box;
		display: inline-block;
	    position: relative;
	    white-space: normal;
	    vertical-align: top;
	    margin-left: 40px;
	    margin-top: 40px;
	}
	
	.service-chatbot:hover {
		transform: scale(1.05);
		transition: 0.5s;
		background: skyblue;
	}
	
	#chatbot-icon {
		margin-right: 15px;
		width: 50px;
		height: 50px;
		border: none;
	}
	
	.chatbot-button {
		text-align: left;
		margin: 20px 0 24px 10px;
	}
	
	.qMark {
		float: left;
		width: 15%;
	}
	
	.qContent {
		float: left;
		width: 82%;
		text-align: left;
	}
	
	#cModalContent {
		margin-right: 0;
	}
	
	#cModalBody {
		margin-top: 10px;
	}
	
	.aMark {
		font-size: 15px;
		width: 5%;
		text-align: left;
	}
	
	.aContent {
		font-size: 15px;
		width: 90%;
		text-align: left;
	}
	
	
	
@media(max-width: 550px){
	.MainBanner-main-banner {
	    padding-top: 20px;
		text-align: center;
	}
	
	.MainBanner-main-banner a {
		font-size: 35px;
	}
	
	.question-main .inner {
		text-align: center;
		padding: 0px;
	}
	
	.service-question {
    	padding-left: 0px;
	}
	
	.transfer-main .inner {
		text-align: center;
	}
	
	.service-transfer .transfer-list {
		padding: 0px;
	}
	
	.chatbot-main .inner {
		text-align: center;
	}
	
	.service-chatbot {
		text-align: center;
		margin-left: 0px;
		width: 250px;
    	height: 200px;
	}
}
	@media(max-width: 1299px) {
	.MainBanner-main-banner {
	    padding-top: 20px;
	}
	
	.MainBanner-main-banner {
    	margin-top: 15px;
	}
	
}
	
</style>

<div class="container client-service-container">
	<div class="MainBanner-main-banner">

		<a href="${pageContext.request.contextPath}/util/clientService" id="atag">
			<h2 id="mainTitle">ICT병원 고객센터</h2>
		</a>

	</div>
	<hr>
	<div class="question-main">
		<div class="clientInner">
			<h3 id="innerTitle">자주 찾는 도움말</h3>
			<div class="service-question">
				<ul class="question-list">
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q1service clientButton">
								<div class="question-question clearfix">

									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>비밀번호 변경은 어디서 하나요?</strong></div>

	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q2service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>납입증명서 발급은 어떻게 하나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q3service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>진단서의 유효기간이 있나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q4service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>회원탈퇴는 어떻게 하나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q5service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>진료를 하는 것이 아니고 기록 사본이 필요한데 왜 접수하고 의사를 만나야 하나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q6service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>예약 현황은 어디서 확인 하나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q7service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>군대에 들어간 아들의 의무기록 사본 발급 신청시 필요한 서류는?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
					<li class="question-list-box">
						<div class="question-list-btn">
							<button type="button" class="Q8service clientButton">
								<div class="question-question clearfix">
									<div class="qMark">Q.</div>
	                        		<div class="qContent"><strong>기타 문의 사항은 어디에서 할 수 있나요?</strong></div>
	                        	</div>
							</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="transfer-main">
		<div class="clientInner">
			<h3 id="innerTitle">고객센터를 통한 빠른 이동</h3>
			<div class="service-transfer">
				<ul class="transfer-list">
					<li class="transfer-box">
						<a href="${pageContext.request.contextPath}/claim/claimMain" id="atag">
							<img id="claimIcon" alt="claimIcon" src="${pageContext.request.contextPath}/img/claimicon.png">
							<img id="hoverClaim" alt="hoverClaim" src="${pageContext.request.contextPath}/img/claimicon_on.png">
							<span id="iconName">고객의 소리</span>
						</a>
					</li>
					<li class="transfer-box">
						<a href="${pageContext.request.contextPath}/introduce/introMain/1" id="atag">
							<img id="introIcon" alt="introduceIcon" src="${pageContext.request.contextPath}/img/introduceicon.png">
							<img id="hoverIntro" alt="hoverIntro" src="${pageContext.request.contextPath}/img/introduceicon_on.png">
							<span id="iconName">병원 소개</span>
						</a>
					</li>
					<li class="transfer-box">
						<a href="${pageContext.request.contextPath}/news/newsMain" id="atag">
							<img id="newsIcon" alt="newsIcon" src="${pageContext.request.contextPath}/img/newsicon.png">
							<img id="hoverNews" alt="hoverNews" src="${pageContext.request.contextPath}/img/newsicon_on.png">
							<span id="iconName">병원 소식</span>
						</a>
					</li>
					<li class="transfer-box">
						<a href="${pageContext.request.contextPath}/notice/noticeMain" id="atag">
							<img id="noticeIcon" alt="noticeIcon" src="${pageContext.request.contextPath}/img/noticeicon.png">
							<img id="hoverNotice" alt="hoverNotice" src="${pageContext.request.contextPath}/img/noticeicon_on.png">
							<span id="iconName">공지사항</span>
						</a>
					</li>
					<li class="transfer-box">
						<a href="${pageContext.request.contextPath}/introduce/introCome" id="atag">
							<img id="mapIcon" alt="mapIcon" src="${pageContext.request.contextPath}/img/mapicon.png">
							<img id="hoverMap" alt="hoverMap" src="${pageContext.request.contextPath}/img/mapicon_on.png">
							<span id="iconName">오시는 길</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="chatbot-main">
		<div class="clientInner">
			<h3 id="innerTitle">다른 도움이 필요하신가요?</h3>
			<div class="service-chatbot">
				<button type="button" class="clientButton chatbotBtn">
					<div class="chatbot-button">
						<img src="${pageContext.request.contextPath}/img/robot.png" id="chatbot-icon" />
						<!-- <img src="${pageContext.request.contextPath}/img/robot_on.png" id="hoverChatbot" /> -->
						<strong>챗봇 문의하기</strong>						
					</div>
					<p id="chatCon">24시간 언제든지 궁금하신 점을 챗봇이 알려드립니다.</p>
				</button>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<div class="modal fade" id="serviceModal" role="dialog">
    <div class="modal-dialog modal-lg" id="cModal">
        <div class="serviceModalContent modal-content container" id="cModalContent">
            <div class="serviceModalBody modal-body row" id="cModalBody">
                
            </div>
        </div>
    </div>
</div>

<script>

	$('.service-chatbot').click(function() {
		window.open('${pageContext.request.contextPath}/util/ictChatBot', 'ictChatBot', 'width=520, height=800, left=300, top=300');	
	});
	
	$('.Q1service').click(function() {
        
        const serviceQ1Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 비밀번호 변경은 어디서 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                	<div class="aMark">A.</div>
                        			<div class="aContent"><strong class="answer-text">로그인 -> 마이페이지 -> 좌측 사이드바에 "비밀번호 변경" 페이지에서 자유롭게 변경 가능합니다.</strong></div>
                                </div>
                                <button type="button" class="btn btn-primary q1ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ1Modal);
      
        $('#serviceModal').modal('show');
    });

    $('.Q2service').click(function() {
        
        const serviceQ2Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 납입증명서 발급은 어떻게 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
									<h2>
										A.<br> 
										- 연말정산 관련  ICT 병원 진료비 내역은 국세청 연말정산간소화 홈페이지<br>
										(http:&#47;&#47;yuhs.medcerti.com&#47;)에서도 확인할 수 있습니다.<br>
										진료비 납입확인서(연말정산용) 발급안내<br>
										<br>
										1. 내원발급<br>
										무인 납입증명서 발급기<br>
										각 수납창구<br>
										<br>
										2. ARS 이용(연말정산 기간중 ? 매년 12월, 1월 경 )<br>
										연말정산 기간중 ARS(02-2228-1006)를 이용하여 진료비 납입확인서를<br>
										발급 받을 수 있습니다.<br>
										연말정산 기간에는 인터넷 발급서비스의 사용자가 많아 접속이 지연될 수 있습니다.<br>
									</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q2ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ2Modal);
      
        $('#serviceModal').modal('show');
    });
    
	$('.Q3service').click(function() {
        
		const serviceQ3Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 진단서의 유효기간이 있나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>A. 유효기간이 정해져 있지는 않지만 환자의 상태에 따라 진단과 소견이 달라질 수 있으므로 발급 후 바로 사용 하셔야 합니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q3ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ3Modal);
      
		$('#serviceModal').modal('show');
	});
   
	$('.Q4service').click(function() {
        
        const serviceQ4Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 회원탈퇴는 어떻게 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>A. 로그인 -> 마이페이지 -> 좌측 사이드바에 "회원탈퇴" 페이지에서 회원 탈퇴 가능합니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q4ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ4Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q5service').click(function() {
        
        const serviceQ5Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 진료를 하는 것이 아니고 기록 사본이 필요한데 왜 접수하고 의사를 만나야 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>
										A.<br> 
										보건복지부령 진료기록사본 발급지침(의정65507-275) 에 의거“의사의 의학적 판단이 필요한 진료기록의 사본 발급은 해당 진료과에 접수,<br> 
										의사의 결정을 받은 후 발급 하며, 진찰료는 별도로 징수하도록”되어있습니다. 의학적 판단은 의사만이 할 수 있다는 근거에 의합니다.<br> 
										단, 검 사결과지만 필요한 경우는 의학적 판단이 필요하지 않은 것으로 접수를 하지 않고 사본 창구에서 본인 확인 후 바로 수령 가능합니다.
									</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q5ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ5Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q6service').click(function() {
        
        const serviceQ6Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 예약 현황은 어디서 확인 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>A. 로그인 -> 마이페이지 -> 좌측 사이드바에 "예약 현황" 페이지에서 확인하실 수 있습니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q6ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ6Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q7service').click(function() {
        
        const serviceQ7Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 군대에 들어간 아들의 의무기록 사본 발급 신청시 필요한 서류는?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>
										A.<br>
										신청자의 신분증과 가족관계를 입증할 수 있는 가족관계 증명서 및 환자가 군복무 중임을 확인할 수 있는 병적 증명서를 제출하시고 의사의 승인을 받고 처방 받으시면 됩니다.<br>
										단, 병적 증명서는 주민센터 신청 후 1일이 걸리 므로 사본발행 신청 전에 준비하셔야 합니다.
                                    </h2>    
                                </div>
                                <button type="button" class="btn btn-primary q7ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ7Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q8service').click(function() {
        
        const serviceQ8Modal = `<div class="service-modal-q clearfix" id="cModalQ"> 
                                	<h2>Q. 기타 문의 사항은 어디에서 할 수 있나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix" id="cModalA">
                                    <h2>A. 로그인 -> 상단 탭 "게시판" 클릭 -> 고객의 소리 페이지에서 작성해주시면 빠른 시일내에 관리자를 통해 답변 드리겠습니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q8ModalClose" id="cModalBtn" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ8Modal);
      
        $('#serviceModal').modal('show');
    });

</script>
