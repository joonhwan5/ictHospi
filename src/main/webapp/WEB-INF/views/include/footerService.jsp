<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

	/*
	html{height:100%}
	html,html.font_zoom1{font-size:10px}
	html.font_zoom2{font-size:11.7px}
	body{line-height:18px;font-size:16px;-webkit-text-size-adjust:none;background-color:#fff}
	body,button,dd,dl,dt,fieldset,form,h1,h2,h3,h4,h5,h6,input,legend,li,ol,p,select,table,td,textarea,th,ul{margin:0;padding:0}
	#app,body,button,html,input,select,textarea{font-family:NanumSquareR,-apple-system,AppleSDGothicNeo,SFProDisplay,BlinkMacSystemFont,HelveticaNeue,Helvetica,arial,"sans-serif"}
	@media (min-width:1025px){body{height:100%}b{font-family:NanumSquareB}}
	@media (max-width:1024px){#app,body,button,html,input,select,textarea{font-family:-apple-system,AppleSDGothicNeo,SFProDisplay,BlinkMacSystemFont,HelveticaNeue,Helvetica,arial,"sans-serif"}}
	address,em{font-style:normal}
	fieldset,img{border:0;vertical-align:top}
	table{border-collapse:collapse}
	input,textarea{-webkit-appearance:none;border-radius:0;-webkit-border-radius:0;border:0}
	dl,ol,ul{list-style:none}
	a{color:inherit}
	a,a[href]:active,a[href]:focus,a[href]:hover{text-decoration:none}
	button{-webkit-appearance:none;border:0;background:none;cursor:pointer;-webkit-tap-highlight-color:rgba(0,0,0,0);-webkit-tap-highlight-color:transparent;color:inherit}
	.blind{overflow:hidden!important;position:absolute!important;clip:rect(0 0 0 0)!important;width:1px!important;height:1px!important;margin:-1px!important;-webkit-user-select:none;-moz-user-select: none;-ms-user-select: none;user-select:none}.row_mo{display:none}
	#__next{height:100%}
	@media (max-width:750px){.row_mo{display:block}.row_pc{display:none}}
	@media only screen and (min-width:1280px){.service-editor-wrap .se-viewer .se-caption,.service-editor-wrap .se-viewer .se-component-content,.service-editor-wrap .se-viewer .se-component-content.se-component-content-fit,.service-editor-wrap .se-viewer .se-video .se-media-meta-info-wrap{max-width:1050px}}
	.service-editor-wrap .se-viewer:lang(ko-KR) .se-section-text.se-l-default .se-ff-{font-family:se-nanumsquare,나눔고딕,nanumgothic,sans-serif,Meiryo}
	.service-editor-wrap .se-viewer .se-section-text.se-l-default .se-fs-{font-size:17px}
	@media(min-width:768px)and (orientation:portrait),(min-width:1024px)and (orientation:landscape){.service-editor-wrap .se-viewer .se-section-text.se-l-default .se-fs-{font-size:16px}}
	.service-editor-wrap .se-viewer .se-section-text.se-l-default .se-text-paragraph{line-height:2.1}
	@media only screen and (max-width:760px){.service-editor-wrap .se-viewer .se-section-text.se-l-default .se-text-paragraph{line-height:2.1!important}}
	*/
	
	dl, ol, ul {
 	   list-style: none;
	}
	
	.footer-service-container {
		margin-top: 11vh;
	}
	
	.MainBanner-main-banner {
		margin-bottom: 3%;
	}
	
	.MainBanner-main-banner h2 {
	    line-height: 5.6rem;
	    font-size: 5.6rem;
		text-align: center;
	}
	
	.service-main {
		margin-top: 20px;
	}
	
	.service-question {
		margin-top: 20px;
		padding-left: 40px;
	}
	
	.question-list {
		margin: 0 -15px;
		padding-inline-start: 0px;
	}
	
	.question-list-box {
	    display: inline-block;
	    width: 24%;
	    margin-top: 30px;
	    vertical-align: top;
	}
	
	.question-list-box .question-list-btn {
		
	}

</style>

<div class="container footer-service-container">
	<div class="MainBanner-main-banner">
		<h2>ICT병원 고객센터</h2>
	</div>
	<hr>
	<div class="service-main">
		<h3>자주 찾는 도움말</h3>
		<div class="service-question">
			<ul class="question-list">
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q1service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>비밀번호 변경은 어디서 하나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q2service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>납입증명서 발급은 어떻게 하나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q3service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>진단서의 유효기간이 있나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q4service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>회원탈퇴는 어떻게 하나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q5service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>진료를 하는 것이 아니고 기록 사본이 필요한데 왜 접수하고 의사를 만나야 하나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q6service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>예약 현황은 어디서 확인 하나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q7service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>군대에 들어간 아들의 의무기록 사본 발급 신청시 필요한 서류는?</strong>
                        	</div>
						</button>
					</div>
				</li>
				<li class="question-list-box">
					<div class="question-list-btn">
						<button type="button" class="Q8service">
							<div class="question-question">
								<span>Q.</span>
                        		<strong>기타 문의 사항은 어디에서 할 수 있나요?</strong>
                        	</div>
						</button>
					</div>
				</li>
			</ul>
		</div>
		<h3>고객센터를 통한 빠른 이동</h3>
		<div>
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/claim/claimMain">
						<img alt="" src="">
						<span>고객의 소리</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/introduce/introMain/1">
						<img alt="" src="">
						<span>병원 소개</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/news/newsMain">
						<img alt="" src="">
						<span>병원 소식</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/notice/noticeMain">
						<img alt="" src="">
						<span>공지사항</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/introduce/introCome">
						<img alt="" src="">
						<span>오시는 길</span>
					</a>
				</li>
			</ul>
		</div>
		<h3>다른 도움이 필요하신가요?</h3>
		<div>
			<ul>
				<li>
					<div>
						<button type="button" class="chat-start btn">
							<div>
								<img src="${pageContext.request.contextPath}/img/ogu-logo-nav.PNG" />
								<strong>챗봇 문의하기</strong>
							</div>
							<p>24시간 언제든지 궁금하신 점을 챗봇이 알려드립니다.</p>
						</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	$('.chat-start').click(function() {
		window.open('${pageContext.request.contextPath}/util/ictChatBot', 'ictChatBot', 'width=320, height=600, left=300, top=300');	
	});
	
	$('.Q1service').click(function() {
        
        const serviceQ1Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 비밀번호 변경은 어디서 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>A. 로그인 -> 마이페이지 -> 좌측 사이드바에 "비밀번호 변경" 페이지에서 자유롭게 변경 가능합니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q1ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ1Modal);
      
        $('#serviceModal').modal('show');
    });

    $('.Q2service').click(function() {
        
        const serviceQ2Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 납입증명서 발급은 어떻게 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
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
                                <button type="button" class="btn btn-primary q2ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ2Modal);
      
        $('#serviceModal').modal('show');
    });
    
	$('.Q3service').click(function() {
        
		const serviceQ3Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 진단서의 유효기간이 있나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>A. 유효기간이 정해져 있지는 않지만 환자의 상태에 따라 진단과 소견이 달라질 수 있으므로 발급 후 바로 사용 하셔야 합니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q3ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ3Modal);
      
		$('#serviceModal').modal('show');
	});
   
	$('.Q4service').click(function() {
        
        const serviceQ4Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 회원탈퇴는 어떻게 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>A. 로그인 -> 마이페이지 -> 좌측 사이드바에 "회원탈퇴" 페이지에서 회원 탈퇴 가능합니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q4ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ4Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q5service').click(function() {
        
        const serviceQ5Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 진료를 하는 것이 아니고 기록 사본이 필요한데 왜 접수하고 의사를 만나야 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>
										A.<br> 
										보건복지부령 진료기록사본 발급지침(의정65507-275) 에 의거“의사의 의학적 판단이 필요한 진료기록의 사본 발급은 해당 진료과에 접수,<br> 
										의사의 결정을 받은 후 발급 하며, 진찰료는 별도로 징수하도록”되어있습니다. 의학적 판단은 의사만이 할 수 있다는 근거에 의합니다.<br> 
										단, 검 사결과지만 필요한 경우는 의학적 판단이 필요하지 않은 것으로 접수를 하지 않고 사본 창구에서 본인 확인 후 바로 수령 가능합니다.
									</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q5ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ5Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q6service').click(function() {
        
        const serviceQ6Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 예약 현황은 어디서 확인 하나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>A. 로그인 -> 마이페이지 -> 좌측 사이드바에 "예약 현황" 페이지에서 확인하실 수 있습니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q6ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ6Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q7service').click(function() {
        
        const serviceQ7Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 군대에 들어간 아들의 의무기록 사본 발급 신청시 필요한 서류는?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>
										A.<br>
										신청자의 신분증과 가족관계를 입증할 수 있는 가족관계 증명서 및 환자가 군복무 중임을 확인할 수 있는 병적 증명서를 제출하시고 의사의 승인을 받고 처방 받으시면 됩니다.<br>
										단, 병적 증명서는 주민센터 신청 후 1일이 걸리 므로 사본발행 신청 전에 준비하셔야 합니다.
                                    </h2>    
                                </div>
                                <button type="button" class="btn btn-primary q7ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ7Modal);
      
        $('#serviceModal').modal('show');
    });
   
	$('.Q8service').click(function() {
        
        const serviceQ8Modal = `<div class="service-modal-q clearfix"> 
                                	<h2>Q. 기타 문의 사항은 어디에서 할 수 있나요?</h2>
                                </div>
                                <hr>
                                <div class="service-modal-a clearfix">
                                    <h2>A. 로그인 -> 상단 탭 "게시판" 클릭 -> 고객의 소리 페이지에서 작성해주시면 빠른 시일내에 관리자를 통해 답변 드리겠습니다.</h2>    
                                </div>
                                <button type="button" class="btn btn-primary q8ModalClose" data-dismiss="modal">닫기</button>`;
        $('.serviceModalBody').html(serviceQ8Modal);
      
        $('#serviceModal').modal('show');
    });

</script>
