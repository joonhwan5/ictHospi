<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp" %>

<style>

	.intro-body1, .intro-body2 {
		margin: 40px 20px;
	}

	.headTitle {
		font-size: 4rem;
		
	}

	.doctor-article {
		margin: 80px 20px;
		margin-bottom: 80px;
	}
	
	.doctor-article > img {
		width: 40%;
		height: 25%;
		border-radius: 30px;
	}
	
	.greeting {
		float: right;
		display: block;
		width: 55%;
		margin-top: 35px;
		
	}
	
	.greeting-title {
		color: #3981BF;
		font-size: 4rem;
		line-height: 60px;
	}
	
	.greeting-name {
		font-size: 2.5rem;
	}
	
	.greeting-name > span {
		font-size: 3.7rem;
	}
	
	.greeting-contents {
		font-size: 2rem;
		color: gray;
	}
	
	.hospital-article {
		margin: 50px 20px;
		margin-bottom: 80px;
	}
	
	.introMain {
		background-color: #e4e8f0;
		margin: 50px auto;
		line-height: 80px;
	
	}
	
	.introMain > .introMain-sentence {
		font-size: 4rem;
		
	}
	
	.introMain-contents {
		font-size: 2rem;
		color: gray;
	}
	
</style>

<div class="container-fluid">
	<div class="row">

		<%@ include file="../include/introSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="intro-body1">
				<h1 class="headTitle">원장의 말</h1>
				<div class="doctor-article clearfix">
					<img src="${pageContext.request.contextPath}/resources/img/headDoctor.jpg">
					<div class="greeting">
						<p class="greeting-title">
							방문해 주셔서 대단히 감사합니다.
							<br>
							"신촌 ICT 병원은 서울 지역 의료서비스에 중추적 역할을 담당하고 있습니다."
						</p>
						<hr>
						<br>
						<p class="greeting-name">
							신촌  ICT 병원 원장 &nbsp;&nbsp;<span>김 명 민</span>
						</p>
					</div>
				</div>
				<p class="greeting-contents">
					&nbsp;80여년 전통의  ICT 병원은 우리나라 의학계의 선구자이며 애국자이셨던 백인제 박사에 의해 1941년 서울시 중구 저동에 첫 문을 열었습니다. 현재는 나라의 장래를 책임질 인재육성을 목표로 설립한 한국대학교를 비롯하여  총 3,000 여 병상을 운영하고 있습니다.	<br><br>
					&nbsp;경기 서북부에 위치한 저희 ICT 병원은 1999년 12월에 개원하였으며 지역주민 여러분의 끊임없는 사랑으로 성장을 거듭하여 오늘날에는 서울지역 의료서비스에 중추적 역할을 담당하고 있습니다. 
					그 간의 많은 연구성과와 최신장비, 진료결과를 인정받아 지난 2009년 1월 1일 최상급 병원인 종합전문요양기관으로 승격하였으며 증축이 완료되어 단기입원병동을 새롭게 운영하고 당일수술센터와 통합암센터를 활성화하여 병원을 방문하시는 고객여러분이 더욱 쾌적한 공간에서 편리하게 이용하실 수 있을 것입니다.<br><br>
					&nbsp;저희  ICT 병원은 유능한 교수진과 최첨단 의료장비, 전산시스템을 바탕으로한 수준 높은 의료서비스로 병원을 찾아주시는 모든 분들이 양질의 의료혜택을 받는데 소홀함이 없도록 최선의 노력을 다 하겠으며, 동북아시아를 넘어 세계적 수준의 병원이 되기 위해 꾸준히 노력 할 것을 약속드립니다.<br><br>
					&nbsp;방문해주신 홈페이지는 일상에서 여러분께서 궁금해 하시는 의학정보와 건강상담 등을 보다 쉽게 이해할 수 있도록 운영하고 있습니다. 앞으로도 지속적으로 수정, 보완함으로서 보다 유익한 정보를 보다 신속하게 제공하도록 최선을 다하겠습니다.<br><br>
					&nbsp;끝으로, ICT 병원을 이용하시면서 불편하셨던 점이나 건의하시는 부분에 대하여 항상 기울여 더욱 친절하고 편리한 병원이 될 것을 약속드리며, 여러분의 가정에 건강한 웃음이 넘치는 하루하루 되시길 기원합니다. 감사합니다.
				</p>
				
				
			</div>
			
			
			
			<div class="intro-body2 clearfix">
				<h1 class="headTitle">병원 개요</h1>
				<div class="hospital-article">
					<div class="introMain">
						<p class="introMain-sentence">
							&nbsp;仁術濟世(인술제세) “인술로써 세상을 구한다”
							<br>
							&nbsp;仁德濟世(인덕제세) “어짊과 덕으로 세상을 구한다”
						</p>
					</div>
					<div>	
						<p class="introMain-contents">
							&nbsp;창립자 백인제 박사는 우리나라 근대 의학의 개척자이자 애국자였습니다. 백인제 박사는 6·25 전쟁으로 납북되기 전까지 신국가 건설을 위한 다양한 활동을 전개하였으며,
							&nbsp;특히, 의학, 교육, 연구, 외과 수술 분야에서 탁월한 업 적을 남겼습니다. 특히, 1937년 상부장관의 감압술 성공사례 7례를 세계 최 초로 보고하였습니다.<br><br>
							&nbsp;1941년 1월 24일 경성의학전문학교(경성의전)를 사임하고 ‘ICT 병원’을 개업한 후 백인제 박사의 뛰어난 의술과 명성으로 인해 ICT 병원은 만주를 비롯한 전국에서 몰려든 환자로 인해 언제나 북새통을 이루었습니다.<br><br>
							&nbsp;또한 경성의전 외과 주임교수로 재직하면서 많은 후학들을 길러냈으며, 그 제자들의 의해 오늘날의 신촌 ICT 병원이 완성 되었습니다.
						</p>
					</div>
				</div>
				
				<div>
					<div>
						<img src="">병원 전경1
						<img src="">병원 전경2
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

<script>
	const msg = '${showBody}';
	console.log(msg);
	if(msg == 1){
		$('.intro-body1').css("display", "none");
	} else {
		$('.intro-body2').css("display", "none");
	}
	
</script>


        