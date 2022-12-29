<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/header.jsp"%>
<main class="container">
	<div class="my-3 p-3 bg-body rounded shadow-sm">
		<div class="reservation clearfix">
			<div class="hospi-category left">
				<p>
					<a>가정의학과</a> | <a>방사능과</a> | <a>정신과</a>
				</p>
			</div>
			<div class="reserv-info left">
				<h4>진료예약 정보</h4>
				<hr>
				<h5>진료과</h5>
				<button type="button" id="reserv-next-btn">다음</button>
			</div>
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
				<img class="first-slide" src="<c:url value='img/logo.png' />" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>의사이름1</h1>
						<p>의사내용1</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="<c:url value='img/logo.png' />" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>의사이름2</h1>
						<p>의사내용2</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide" src="<c:url value='img/logo.png' />" alt="Third slide">
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
					<img src="<c:url value='img/logo.png' />" alt="">
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
					<form action="<c:url value='' />" method="post" id="joinForm" class="login-modal-form">
						<div class="form-group">
							<label for="id">아이디</label>
							<div class="input-group">
								<!--input2탭의 input-addon을 가져온다 -->
								<input type="text" name="userId" class="form-control" id="userId" placeholder="아이디를 (영문포함 4~12자 이상)">
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
								</div>
							</div>
							<span id="msgId"></span>
							<!--자바스크립트에서 중복 관련, 정규표현식 메세지 추가-->
						</div>
						<div class="form-group">
							<!--기본 폼그룹을 가져온다-->
							<label for="password">비밀번호</label>
							<input type="password" name="userPw" class="form-control" id="userPw" placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)">
							<span id="msgPw"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="password-confrim">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwConfirm" placeholder="비밀번호를 확인해주세요.">
							<span id="msgPw-c"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력하세요.">
						</div>
						<div class="form-group">
							<label for="birth">생년월일 6자리</label>
							<input type="text" name="userBirth1" class="form-control" id="userBirth1" placeholder="990515">
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
								</select> <input type="text" class="form-control phone2"
									name="userPhone2" id="userPhone2" placeholder="휴대폰번호를 입력하세요.">
								<input type="text" class="form-control phone3" name="userPhone3"
									id="userPhone3" placeholder="휴대폰번호를 입력하세요.">
							</div>
						</div>
						<div class="form-group">
							<label for="email">이메일</label><br>
							<div class="input-group email-group">
								<input type="text" name="userEmail1" class="form-control"
									id="userEmail1" placeholder="이메일"> <select
									name="userEmail2" class="form-control" id="userEmail2">
									<option>@naver.com</option>
									<option>@daum.net</option>
									<option>@gmail.com</option>
									<option>@hanmail.com</option>
								</select>
								<div class="input-group-addon">
									<button type="button" id="mail-check-btn"
										class="btn btn-primary">이메일 인증</button>
								</div>
							</div>
							<div class="mail-check-box">
								<input type="text" class="form-control mail-check-input"
									placeholder="인증번호 6자리를 입력하세요." maxlength="6"
									disabled="disabled"> <span id="mail-check-warn"></span>
							</div>
						</div>
						<div class="form-group">
							<label>이메일 수신동의</label> <br> <input type="checkbox" value="1"
								id="sendMobile" checked> <label>모바일</label> <br> <input
								type="checkbox" value="1" id="sendEmail" checked> <label>이메일</label>
						</div>

						<div class="form-group">
							<label for="addr-num">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" name="addrZipNum"
									id="addrZipNum" placeholder="우편번호" readonly>
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary"
										onclick="searchAddress()">주소찾기</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="addrBasic"
								id="addrBasic" placeholder="기본주소">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="addrDetail"
								id="addrDetail" placeholder="상세주소">
						</div>
						<div class="form-group join-btn-group clearfix">
							<button type="submit" id="join-Btn"
								class="btn btn-lg btn-info btn-block">가입하기</button>
							<button type="button" id="join-close"
								class="btn btn-lg btn-info btn-block">닫기</button>
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
						<button id="joinBtn" class="btn joinBtn" type="button">회원가입</button>
					</div>

					<div class="login-div">
						<form id="loginForm" action="">
							<div class="id-div">
								<span>아이디</span> <input type="text" id="loginId"
									placeholder="아이디를 입력해주세요">
							</div>
							<div class="pw-div">
								<span>비밀번호</span> <input type="text" name="loginPw" id="loginPw"
									placeholder="비밀번호를 입력해주세요">
							</div>
							<button type="submit" class="btn loginBtn">로그인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$('#loginModal').modal('show');
	
	$(document).ready(function() {
		
		let code = '';
		
		$('#joinBtn').click(function() {
			$('#loginModal').modal('hide');
			$('#joinModal').modal('show');
		}); //회원가입 버튼 클릭시 이동
		
		/* 아이디 중복 체크 */
		$('#idCheckBtn').click(function() {
			const userId = $('#userId').val();
			
			if(userId === '') {
				alert('아이디를 입력해주세요.');
				return;
			}
			
			console.log(userId);
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/user/idCheck" />',
				contentType: 'application/json',
				data: userId,
				success: function(data) {
					if(data === 'ok') {
						$('#userId').attr('readonly', true);
						$('#idCheckBtn').attr('disabled', true);
						$('#msgId').html('사용 가능한 아이디입니다.'); 
						$('#msgId').css('color', 'green');
					} else {
						$('#msgId').text('중복된 아이디 입니다.');
						$('#msgId').css('color', 'red');
					}
				},
				error: function() {
					console.log('연결 실패');
				}
			}); //ajax 끝
			
		}); //id 중복체크끝
		
		//인증번호 이메일 전송
		$('#mail-check-btn').click(function() {
			const email = $('#userEmail1').val() + $('#userEmail2').val();
			$.ajax({
				type: 'get',
				url: '<c:url value="/user/mailCheck?email=" />' + email,
				success: function(data) {
					console.log('컨트롤러가 전달한 인증번호: '+ data);
					$('.mail-check-input').attr('disabled', false); //비활성된 인증번호 입력창을 활성화.
					code = data; //인증번호를 전역변수에 저장.
					alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
				}
			}); //end ajax
			
		}); //이메일 전송 끝.
		
		/* $('.mail-check-input').blur(function() {
			const inputCode = $(this).val(); //사용자가 입력한 인증번호
			const $resultMsg = $('#mail-check-warn'); //span
			
			if(inputCode === code) {
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color', 'green');
				$('#mail-check-btn').attr('disabled', true); //이메일 인증을 더이상 못하게 버튼을 비활성.
				$('#userEmail1').attr('readonly', true);
				$('#userEmail2').attr('readonly', true);
				$(this).css('display', 'none');
				
				//초기값을 사용자가 선택한 값으로 무조건 설정하는 방법. (select에서 readonly 대용)
				//2개 같이 쓰셔야 해요.
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				
			} else {
				$resultMsg.html('인증번호를 다시 확인해 주세요.');
				$resultMsg.css('color', 'red');
				$(this).focus();
			}
			
		}); //인증번호 이벤트 끝.
		
		$('#join-Btn').click(function() {
			if($('#userId').val().trim() === '' || !$('#userId').attr('readonly')) {
				alert('아이디 중복 체크 필수');
				$('#userId').focus();
				return;
			}
			
			if(!check1 || !check2) {
				alert('비밀번호 확인 필요');
				return;
			}
			
			if($('#userName').val().trim() === '') {
				$('#userName').val('');
				$('#userName').focus();
				alert('이름값은 필수 입니다.');
				return;
			}
			
			if(!$('#userEmail1').attr('readonly') || $('#userEmail1').val().trim() === '') {
				$('#userEmail1').focus();
				alert('이메일 인증을 완료해주세요.');
				return;
			}
			
			if(confirm('회원가입을 하시겠습니까?')) {
				$('#joinForm').submit();
			}
		});
		
	}); */
	
	//다음 주소 API 사용해 보기
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addrZipNum').value = data.zonecode;
                document.getElementById('addrBasic').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrDetail').focus();
            }
        }).open();
    }
	
	/* 아이디 유효성 검사 */
	var id = document.getElementById("userId");
    id.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{4,12}$/;
        if(regex.test(document.getElementById("userId").value )) {
            document.getElementById("userId").style.borderColor = "green";
            document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다.";
        } else {
            document.getElementById("userId").style.borderColor = "red";
            document.getElementById("msgId").innerHTML = "영문과 숫자가 포함되게 작성해주세요.";
        }
    }
    let check1 = false;
    let check2 = false;
    /* 패스워드 유효성 검사 */
    var pw = document.getElementById("userPw");
    pw.onkeyup = function(){
        var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
         if(regex.test(document.getElementById("userPw").value )) {
            document.getElementById("userPw").style.borderColor = "green";
            document.getElementById("msgPw").innerHTML = "사용가능합니다";
            check1 = true;
        } else {
            document.getElementById("userPw").style.borderColor = "red";
            document.getElementById("msgPw").innerHTML = "특수문자, 문자, 숫자 최소 3가지 이상 조합하여 만드세요.";
            check1 = false;
        }
    }
    
    /* 비밀번호 확인검사 */
    var pwConfirm = document.getElementById("pwConfirm");
    pwConfirm.onkeyup = function() {
        if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
            document.getElementById("pwConfirm").style.borderColor = "green";
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            check2 = true;
        } else {
            document.getElementById("pwConfirm").style.borderColor = "red";
            document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            check2 = false;
        }
    } 
</script>
<%@include file="include/footer.jsp"%>