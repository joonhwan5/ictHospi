<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container user-join-container">
	<%@include file="../include/myPageSide.jsp"%>
	<div class="h1-div">
		<h1>회&nbsp;원&nbsp;수&nbsp;정</h1>
	</div>
	<form action="<c:url value='/myPage/userModify' />" method="post" id="modifyForm" class="form-horizontal">
	
		<div class="form-group form-group-lg">
			<label for="id" class="col-sm-4 control-label">아이디</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="userId" class="form-control" id="userId" value="${user.userId}" placeholder="아이디를 (영문포함 4~12자 이상)">
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">중복체크</button>
					</span>
				</div>
				<!-- <input type="text" name="userId" class="form-control" id="userId" placeholder="아이디를 (영문포함 4~12자 이상)"> -->
			</div>
			<!-- <div class="col-sm-2">
				<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">중복체크</button>
			</div> -->
		</div>
		<div class="col-sm-offset-4 div-span-input-bottom">
			<span id="msgId" class="span-user-join"></span>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="name" class="col-sm-4 control-label">이름</label>
			<div class="col-sm-6">
				<input type="text" name="userName" class="form-control" id="userName" value="${user.userName}" placeholder="이름을 입력하세요." readonly>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="birth" class="col-sm-4 control-label">생년월일</label>
			<div class="col-sm-2">
				<input type="text" name="year" id="year" class="form-control" value="${year}" placeholder="출생년도">
			</div>
			<div class="col-sm-2">
				<select name="month" id="month" class="form-control">
					<c:forEach var="m" begin="1" end="12">
						<option ${m == month ? 'selected' : ''}>${m}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-2">
				<input type="text" name="day" id="day" class="form-control" value="${day}" placeholder="일">
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="gender" class="col-sm-4 control-label">주민등록번호 뒷자리</label>
			<div class="col-sm-1">
				<input type="text" name="userBirth2" class="form-control" id="userBirth2" value="${user.userBirth2}" maxlength="1" placeholder="*">
			</div>
			<div class="span-strong">
				<span><strong>******</strong></span>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="hp" class="col-sm-4 control-label">휴대폰번호</label>
			<div class="col-sm-6 input-group phone-group">
				<div class="col-sm-3">
					<select class="form-control phone1" name="userPh1" id="userPh1">
						<option ${user.userPh1 == '010' ? 'selected' : '' }>010</option>
						<option ${user.userPh1 == '011' ? 'selected' : '' }>011</option>
						<option ${user.userPh1 == '017' ? 'selected' : '' }>017</option>
						<option ${user.userPh1 == '018' ? 'selected' : '' }>018</option>
					</select>
				</div>
				<label for="hp" class="col-sm-1 control-label">—</label>
				<div class="col-sm-3" id="div-userPh2">
					<input type="text" class="form-control" name="userPh2" id="userPh2" value="${user.userPh2}" maxlength="4" placeholder="1234">
				</div>
				<label for="hp" class="col-sm-1 control-label">—</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="userPh3" id="userPh3" value="${user.userPh3}" maxlength="4" placeholder="1234">
				</div>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="email" class="col-sm-4 control-label">이메일</label>
			<div class="col-sm-8 input-group phone-group">
				<div class="col-sm-4">
					<input type="text" name="userEmail1" class="form-control" id="userEmail1" value="${user.userEmail1}" placeholder="이메일">
				</div>
				<div class="span-strong col-sm-1">
					<span><strong>@</strong></span>
				</div>
				<div class="col-sm-4">
					<select name="domain" class="form-control" id="userEmail2">
						<option ${user.userEmail2 == 'naver.com' ? 'selected' : ''}>naver.com</option>
						<option ${user.userEmail2 == 'daum.net' ? 'selected' : ''}>daum.net</option>
						<option ${user.userEmail2 == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
						<option ${user.userEmail2 == 'hanmail.com' ? 'selected' : ''}>hanmail.com</option>
					</select>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" id="mailCheckBtn">이메일인증</button>
				</div>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="emailCheck" class="col-sm-4 control-label">이메일 인증번호</label>
			<div class="mail-check-box col-sm-2">
				<input type="text" class="form-control mailCheckInput" placeholder="인증번호" maxlength="6" disabled="disabled">
			</div>
			<div class="span-email-check">
				<span id="mailCheckWarn" class="span-user-join"></span>		
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="emailCheck" class="col-sm-4 control-label">이메일 수신동의</label>
			<div class="col-sm-2 form-inline div-checkbox">
				<div class="form-group clearfix">
					<input type="checkbox" value="1" name="userMobileOk" id="userMobileOk" ${user.userMobileOk == '1' ? 'checked' : ''}>
					<label class="check-label">모바일</label>
				</div>
				<div class="form-group pull-right">
					<input type="checkbox" value="1" name="userEmailOk" id="userEmailOk" ${user.userEmailOk == '1' ? 'checked' : ''}>
					<label class="check-label">이메일</label>
				</div>
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-num" class="col-sm-4 control-label">우편번호</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" value="${user.addrZipNum}" placeholder="우편번호" readonly>
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" onclick="searchAddress()">주소찾기</button>
					</span>
				</div>
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-basic" class="col-sm-4 control-label">기본주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="addrBasic" id="addrBasic" value="${user.addrBasic}" placeholder="기본주소" readonly>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="addr-detail" class="col-sm-4 control-label">상세주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" value="${user.addrDetail}" placeholder="상세주소">
			</div>
		</div>
	
		<div class="form-group join-btn-group clearfix">
			<div class="col-sm-offset-4 col-sm-7">
				<button type="button" id="modifyBtn" class="btn btn-lg btn-block btn-info col-sm-5">수정하기</button>
			</div>
			
			
			
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
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
	
	let code = ''; //인증코드 저장
	
	//인증번호 이메일 전송
	$('#mailCheckBtn').click(function() {
		const email = $('#userEmail1').val() + '@' + $('#userEmail2').val();
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
	
	//수정 버튼을 눌렀을때 이벤트 발생
	$('#modifyBtn').click(function() {
		
		//사용자가 이메일을 변경했을 경우에만 인증번호 유효성 검사.
		if($('#userEmail1').val() !== '${user.userEmail1}' 
			|| $('#userEmail2').val() !== '${user.userEmail2}') {
			console.log('이메일을 바꿨습니다.');
			
			if(!$('#mailCheckBtn').attr('disabled')) {
				alert('이메일 인증을 완료해주세요.');
				return;
			}
		}
		
		if($('#userId').val() !== '${user.userId}' || $('#userId').val().trim() === '') {
			$('#userId').focus();
			alert('아이디 중복 체크 필수');
			return;
		}
		
		if($('#userBirth2').val().trim() === '') {
			$('#userBirth2').val('');
			$('#userBirth2').focus();
			alert('생년월일을 입력하세요.');
			return;
		}
		
		if($('#userPh2').val().trim() === '' || $('#userPh3').val().trim() === '') {
			$('#userPh2').val('');
			$('#userPh2').focus();
			alert('전화번호를 입력해주세요.');
			return;
		}
		
		if($('#addrZipNum').val().trim() === '' || $('#addrBasic').val().trim() === '' || $('#addrDetail').val().trim() === '') {
			$('#addrDetail').focus();
			alert('주소를 다시 확인해주세요.');
			return;
		}
		
		if(confirm('이대로 수정을 진행 하시겠습니까?')) {
			$('#modifyForm').submit();
		} else {
			return;
		}
		
	});
	
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
</script>


















