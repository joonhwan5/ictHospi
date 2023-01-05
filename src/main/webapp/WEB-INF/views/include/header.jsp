<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/offcanvas.css" rel="stylesheet">
	
	
	<link href="${pageContext.request.contextPath}/resources/css/myCss.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>

	<style>

	</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container header-container">
        <div class="navbar-header header-navbar-header clearfix">
          <button type="button" class="navbar-toggle collapsed right" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">ict-병원</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/introduce/introMain/1">병원소개</a></li>
            <li><a href="${pageContext.request.contextPath}/news/newsMain?selectA=newList">소식</a></li>
            <li><a href="${pageContext.request.contextPath}/notice/noticeMain">게시판</a></li>
            <c:if test="${login!=null}">
            	<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">마이페이지</a></li>
            </c:if>
            <c:if test="${admin!=null}">
            	<li><a href="${pageContext.request.contextPath}/admin/adminPageMain">관리자</a></li>
            </c:if>
          </ul>
          <form class="navbar-form navbar-right">
            
            <div class="form-group login-form-group">
            	<c:if test="${login==null && admin==null}">
          			<a id="login" href="#">&emsp;&emsp;로그인</a>
          		</c:if>
            	<c:if test="${login!=null || admin!=null}">
          			<a id="logout" href="#">&emsp;&emsp;로그아웃</a>
          		</c:if>
          	</div>
          </form>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
    
<!-- 회원가입 모달 -->
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
					<form action="<c:url value='/user/join' />" method="post" id="joinForm" class="login-modal-form">
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
							<input type="password" name="userPw" class="form-control" id="userPw" placeholder="8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.">
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
							<input type="text" name="userBirth1" class="form-control" id="userBirth1" maxlength="6" placeholder="990515">
							<input type="text" name="userBirth2" class="form-control" id="userBirth2" maxlength="1" placeholder="1******">
						</div>


						<div class="form-group">
							<label for="hp">휴대폰번호</label>
							<div class="input-group phone-group">
								<select class="form-control phone1" name="userPh1" id="userPhone1">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>018</option>
								</select>
								<input type="text" class="form-control phone2" name="userPh2" id="userPhone2" maxlength="4" placeholder="휴대폰번호를 입력하세요.">
								<input type="text" class="form-control phone3" name="userPh3" id="userPhone3" maxlength="4" placeholder="휴대폰번호를 입력하세요.">
							</div>
						</div>
						<div class="form-group">
							<label for="email">이메일</label><br>
							<div class="input-group email-group">
								<input type="text" name="userEmail1" class="form-control" id="userEmail1" placeholder="이메일">
								<select name="userEmail2" class="form-control" id="userEmail2">
									<option>@naver.com</option>
									<option>@daum.net</option>
									<option>@gmail.com</option>
									<option>@hanmail.com</option>
								</select>
								<div class="input-group-addon">
									<button type="button" id="mailCheckBtn" class="btn btn-primary">이메일 인증</button>
								</div>
							</div>
							<div class="mail-check-box">
								<input type="text" class="form-control mailCheckInput" placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
								<span id="mailCheckWarn"></span>
							</div>
						</div>
						<div class="form-group">
							<label>이메일 수신동의</label> <br>
							<input type="checkbox" value="1" name="userMobileOk" id="userMobileOk">
							<label>모바일</label> <br>
							<input type="checkbox" value="1" name="userEmailOk" id="userEmailOk">
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
							<input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소" readonly>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소">
						</div>
						<div class="form-group join-btn-group clearfix">
							<button type="button" id="headerRegistBtn" class="btn btn-lg btn-info btn-block col-md-6">가입하기</button>
							<button type="button" id="joinClose" class="btn btn-lg btn-info btn-block col-md-6">닫기</button>
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
				<div class="modal-body">
					<div class="row">
						<form id="loginForm" action="<c:url value='/user/login' />" method="post">
							<div class="header-login-div">
								<h1>로그인</h1>
								<hr>
								<input type="text" name="userId" id="loginId" placeholder="아이디"> <br>
								<input type="password" name="userPw" id="loginPw" placeholder="비밀번호">
							</div>
							<div class="check-div">
								<input type="checkbox" id="auto-login" name="autoLogin">
								<label>&nbsp;&nbsp;로그인 상태 유지</label>
							</div>
							<button type="button" id="loginBtn" class="btn btn-block btn-info">로그인</button>
							<button type="button" id="joinBtn" class="btn btn-block btn-info">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(document).ready(function() {
		
		// a 태그 로그인
		$('#login').click(function() {
			event.preventDefault();
			$('#loginModal').modal('show');
		});
		
		// a 태그 로그아웃
		$('#logout').click(function() {
			event.preventDefault();
			location.href='${pageContext.request.contextPath}/user/logout';
		});
		
		//회원가입 버튼 클릭시 이동
		$('#joinBtn').click(function() {
			$('#loginModal').modal('hide');
			$('#joinModal').modal('show');
		}); 
		
		/* 아이디 중복 체크 */
		$('#idCheckBtn').click(function() {
			const userId = $('#userId').val();
			
			if(userId === '') {
				alert('아이디를 입력해주세요.');
				return;
			}
			
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
		
		let code = ''; //인증코드 저장
		
		//인증번호 이메일 전송
		$('#mailCheckBtn').click(function() {
			const email = $('#userEmail1').val() + $('#userEmail2').val();
			$.ajax({
				type: 'get',
				url: '<c:url value="/user/mailCheck?email=" />' + email,
				success: function(data) {
					console.log('컨트롤러가 전달한 인증번호: '+ data);
					$('.mailCheckInput').attr('disabled', false); //비활성된 인증번호 입력창을 활성화.
					code = data; //인증번호를 전역변수에 저장.
					alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
				}
			}); //end ajax
			
		}); //이메일 전송 끝.
		
		/* 인증번호 체크 */
		$('.mailCheckInput').blur(function() {
			const inputCode = $(this).val();
			const $resultMsg = $('#mailCheckWarn');
			
			if(inputCode === code) {
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color', 'green');
				$('#mailCheckBtn').attr('disabled', true);
				$('#userEmail1').attr('readonly', true);
				$('#userEmail2').attr('readonly', true);
				$(this).css('display', 'none');
				
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				
			} else {
				$resultMsg.html('인증번호를 다시 확인해 주세요.');
				$resultMsg.css('color', 'red');
				$(this).focus();
			}
			
		}); //인증번호 이벤트 끝.
		
		/* 회원가입 체크 */
		$('#headerRegistBtn').click(function() {
			if($('#userId').val().trim() === '' || !$('#userId').attr('readonly')) {
				$('#userId').focus();
				alert('아이디 중복 체크 필수');
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
			
			if($('#userBirth1').val().trim() === '' || $('#userBirth2').val().trim() === '') {
				$('#userBirth1').val('');
				$('#userBirth1').focus();
				alert('생년월일을 입력하세요.');
				return;
			}
			
			if($('#userPhone2').val().trim() === '' || $('#userPhone3').val().trim() === '') {
				$('#userPh2').val('');
				$('#userPh2').focus();
				alert('전화번호를 입력해주세요.');
				return;
			}
			
			if(!$('#userEmail1').attr('readonly') || $('#userEmail1').val().trim() === '') {
				$('#userEmail1').focus();
				alert('이메일 인증을 완료해주세요.');
				return;
			}
			
			if($('#addrZipNum').val().trim() === '' || $('#addrBasic').val().trim() === '' || $('#addrDetail').val().trim() === '') {
				$('#addrDetail').focus();
				alert('주소를 다시 확인해주세요.');
				return;
			}
			
			if(confirm('회원가입을 하시겠습니까?')) {
				$('#joinForm').submit();
			}
			
		});
		
		//로그인
		$('#loginBtn').click(function() {
			if($('#loginId').val().trim() === '') {
				$('#loginId').focus();
				alert('아이디를 입력해주세요.');
				return;
			}
			
			if($('#loginPw').val().trim() === '') {
				$('#loginPw').focus();
				alert('비밀번호를 입력해주세요.');
				return;
			}
			$('#loginForm').submit();
		});
		
	});

	//다음 주소 API 사용해 보기
	function searchAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
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
		if (regex.test(document.getElementById("userId").value)) {
			document.getElementById("userId").style.borderColor = "green";
			document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다.";
			document.getElementById("msgId").style.color = "black";
		} else {
			document.getElementById("userId").style.borderColor = "red";
			document.getElementById("msgId").innerHTML = "영문과 숫자가 포함되게 작성해주세요.";
			document.getElementById("msgId").style.color = "red";
		}
	}

	let check1 = false;
	let check2 = false;
	/* 패스워드 유효성 검사 */
	var pw = document.getElementById("userPw");
	pw.onkeyup = function() {
		var regex = /^.*(?=^.{8,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (regex.test(document.getElementById("userPw").value)) {
			document.getElementById("userPw").style.borderColor = "green";
			document.getElementById("msgPw").innerHTML = "사용가능합니다";
			document.getElementById("msgPw").style.color = "black";
			check1 = true;
		} else {
			document.getElementById("userPw").style.borderColor = "red";
			document.getElementById("msgPw").innerHTML = "8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.";
			document.getElementById("msgPw").style.color = "red";
			check1 = false;
		}
	}

	/* 비밀번호 확인검사 */
	var pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onkeyup = function() {
		if (document.getElementById("pwConfirm").value == document
				.getElementById("userPw").value) {
			document.getElementById("pwConfirm").style.borderColor = "green";
			document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
			document.getElementById("msgPw-c").style.color = "black";
			check2 = true;
		} else {
			document.getElementById("pwConfirm").style.borderColor = "red";
			document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			document.getElementById("msgPw-c").style.color = "red";
			check2 = false;
		}
	}
</script>


