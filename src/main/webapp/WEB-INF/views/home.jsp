<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="include/header.jsp"%>





<main class="container">
	<div class="my-3 p-3 bg-body rounded shadow-sm">
		<div class="reservation clearfix">
			<div class="hospi-category left">
				<p><a>가정의학과</a> | <a>방사능과</a> | <a>정신과</a></p>
			</div>
			<div class="doctor-list left">
				<div class="doctor">홍길동</div>
				<div class="doctor">이순신</div>
				<div class="doctor">곽두팔</div>
			</div>
			<div class="reserv-calendar left">
				<input type="date" class="reserv-date-input">
				
				<select class="reserv-time-select">
					<optgroup label="오전 시간">
						<option>오전 9시</option>
						<option>오전 10시</option>
						<option>오전 11시</option>
						<option>오후 12시</option>
					</optgroup>
					<optgroup label="오후 시간">
						<option>오후 2시</option>
						<option>오후 3시</option>
						<option>오후 4시</option>
						<option>오후 5시</option>
					</optgroup>
				</select>
			</div>
			<form class="reserv-info left">
				<h4 class="page-header">진료예약 정보</h4>
				<h5 class="page-header subject">진료과:<span></span></h5>
				<h5 class="page-header doctor-name">담당의사:<span></span></h5>
				<h5 class="page-header reserve-date">진료날짜:<span></span></h5>
				<h5 class="page-header reserve-time">진료시간:<span></span></h5>
				<button type="button" id="reserv-next-btn">예약하기</button>
			</form>
		</div>
	</div>

<div id="hospi-carousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>의사이름1</h1>
              <p>의사내용1</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>의사이름2</h1>
              <p>의사내용2</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>의사이름3</h1>
              <p>의사내용3</p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#hospi-carousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#hospi-carousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>


	
	<div class="my-3 p-3 bg-body rounded shadow-sm">
		<div class="focus">
	        <h1>병원 소식</h1>
	        <div class="main-news-div clearfix">
	            <div class="focus-img">
	                <img src="img/logo.png" alt="">
	            </div>
	            <div class="focus-news">
	                <h2>주요기사</h2>
	                <h2>주요기사</h2>
	                <h2>주요기사</h2>
	                <h2>주요기사</h2>
	                <h2>주요기사</h2>
	            </div>
	        </div>
	    </div>
	</div>
</main>

<!-- 모달 -->
<section>
	<div class="modal fade" id="joinModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원가입</h4>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form action="#" method="post" id="signInForm" class="login-modal-form">
						<div class="form-group">
							<label for="id">아이디</label>
							<div class="input-group">
								<!--input2탭의 input-addon을 가져온다 -->
								<input type="text" name="userId" class="form-control"
									id="userId" placeholder="아이디를 (영문포함 4~12자 이상)">
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
								</div>
							</div>
							<span id="msgId"></span>
							<!--자바스크립트에서 중복 관련, 정규표현식 메세지 추가-->
						</div>
						<div class="form-group">
							<!--기본 폼그룹을 가져온다-->
							<label for="password">비밀번호</label> <input type="password"
								name="userPw" class="form-control" id="userPw"
								placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)"> <span
								id="msgPw"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="password-confrim">비밀번호 확인</label> <input
								type="password" class="form-control" id="pwConfirm"
								placeholder="비밀번호를 확인해주세요."> <span id="msgPw-c"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="name">이름</label> <input type="text" name="userName"
								class="form-control" id="userName" placeholder="이름을 입력하세요.">
						</div>
						<div class="form-group">
							<label for="birth">생년월일 6자리</label> <input type="text"
								name="userBirth" class="form-control" id="userBirth"
								placeholder="990515">
						</div>
						<div class="form-group">
							<label for="hp">휴대폰번호</label>
							<div class="input-group phone-group">
								<select class="form-control phone1" name="userPhone1"
									id="userPhone1">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>018</option>
								</select>
								<input type="text" class="form-control phone2" name="userPhone2" id="userPhone2" placeholder="휴대폰번호를 입력하세요.">
								<input type="text" class="form-control phone3" name="userPhone3" id="userPhone3" placeholder="휴대폰번호를 입력하세요.">
							</div>
						</div>
						<div class="form-group">
							<label for="email">이메일</label><br>
							<div class="input-group email-group">
								<input type="text" name="userEmail1" class="form-control"
									id="userEmail1" placeholder="이메일">
								<select
									name="userEmail2" class="form-control" id="userEmail2">
									<option>@naver.com</option>
									<option>@daum.net</option>
									<option>@gmail.com</option>
									<option>@hanmail.com</option>
								</select>
								<div class="input-group-addon">
									<button type="button" id="mail-check-btn" class="btn btn-primary">이메일 인증</button>
								</div>
							</div>
							<div class="mail-check-box">
								<input type="text" class="form-control mail-check-input"
									placeholder="인증번호 6자리를 입력하세요." maxlength="6"
									disabled="disabled"> <span id="mail-check-warn"></span>
							</div>
						</div>
						<div class="form-group">
							<label>이메일 수신동의</label> <br>
						  <input type="checkbox" value="" id="sendMobile" checked>
						  <label>모바일</label> <br>
						  <input type="checkbox" value="" id="sendEmail" checked>
						  <label>이메일</label>
						</div>
						
						<div class="form-group">
							<label for="addr-num">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary" onclick="searchAddress()">주소찾기</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소">
						</div>
						<div class="form-group join-btn-group clearfix">
							<button type="submit" id="join-Btn" class="btn btn-lg btn-info btn-block">가입하기</button>
							<button type="button" id="join-close" class="btn btn-lg btn-info btn-block">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog modal-md-4">
			<div class="modal-content">
				<div class="modal-body clearfix">
					<div class="join-div">
                        <h1>처음이신가요?</h1>
                        <button class="btn joinBtn" type="button">회원가입</button>
                    </div>

                    <div class="login-div">
                        <form id="loginForm" action="">
                            <div class="id-div">
                                <span>아이디</span>
                                <input type="text" id="loginId" placeholder="아이디를 입력해주세요">
                            </div>
                            <div class="pw-div">    
                                <span>비밀번호</span>
                                <input type="text" name="loginPw" id="loginPw" placeholder="비밀번호를 입력해주세요">
                            </div>
                            <button type="submit" class="btn loginBtn">로그인</button>
                        </form>
                    </div>
				</div>
			</div>
		</div>
    </div>
	
</section>

<script>
	
	//jQuery 시작
	$(document).ready(function() {
		
		//join modal
		$('#joinModal').modal('show');
		
		
		//예약 시스템
		$('.hospi-category > p').on('click', 'a', function(e) {
			e.preventDefault();
			const subject = $(this).html();
			$('.reserv-info > .subject > span').html(subject);
			$('.hospi-category').css('display', 'none');
			$('.doctor-list').css('display', 'block');
		});
		
		$('.doctor-list').on('click', 'div', function(e) {
			$('.doctor-name > span').html($(this).html());
			
			$('.doctor-list').css('display', 'none');
			$('.reserv-calendar').css('display', 'block');

			const time = new Date();
			const year = time.getFullYear();
			const month = time.getMonth() + 1;
			const date = time.getDate();
			const nowTime = year + '-' + month + '-' + date;
			const limitTime = (year + 1) + '-' + month + '-' + date;
			$('.reserv-date-input').attr('value', nowTime);
			$('.reserv-date-input').attr('min', nowTime);
			$('.reserv-date-input').attr('max', limitTime);
		});
		
		$('.reserv-date-input').change(function() {
			$('.reserve-date > span').html($(this).val());
		});
		
		$('.reserv-time-select').change(function() {
			$('.reserve-time > span').html($(this).val());
			$('#reserv-next-btn').css('display', 'block');
		});
		
		$('#reserv-next-btn').click(function() {
			if(confirm('예약하신 내용이 맞습니까?')) {
				
			}
		});
	});
	
</script>


<%@include file="include/footer.jsp"%>