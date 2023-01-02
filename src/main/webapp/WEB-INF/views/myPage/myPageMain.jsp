<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보 수정<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/myPage/userWithdrawal">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="${pageContext.request.contextPath}/myPage/userModify" id="modifyForm" method="post">
				<div class="form-group">
					<!--사용자클래스선언-->
					<label for="id">아이디</label>
					<div class="input-group">
						<!--input2탭의 input-addon을 가져온다 -->
						<input type="text" name="userId" class="form-control" id="userId" value="${user.userId}" placeholder="아이디를 (영문포함 4~12자 이상)">
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
						</div>
					</div>
					<span id="msgId"></span>
					<!--자바스크립트에서 중복 관련 메세지 추가-->
				</div>
				
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" name="userName" class="form-control" id="userName" value="${user.userName}" 
						placeholder="이름을 입력하세요." readonly>
				</div>
				
				<div class="form-group">
					<label for="birth">생년월일 6자리</label>
					<input type="text" name="userBirth1" class="form-control" id="userBirth1" maxlength="6" 
						value="${user.userBirth1}" placeholder="990515">
					<input type="text" name="userBirth2" class="form-control" id="userBirth2" maxlength="1" 
						value="${user.userBirth2}" placeholder="1******">
				</div>
				<div class="form-group">
					<label for="hp">휴대폰번호</label>
					<div class="input-group phone-group">
						<select class="form-control phone1" name="userPh1" id="userPhone1">
							<option ${user.userPh1 == '010' ? 'selected' : ''}>010</option>
							<option ${user.userPh1 == '011' ? 'selected' : ''}>011</option>
							<option ${user.userPh1 == '017' ? 'selected' : ''}>017</option>
							<option ${user.userPh1 == '018' ? 'selected' : ''}>018</option>
						</select>
						<input type="text" class="form-control phone2" name="userPh2" id="userPhone2" 
							value="${user.userPh2}" placeholder="휴대폰번호를 입력하세요.">
						<input type="text" class="form-control phone3" name="userPh3" id="userPhone3" 
							value="${user.userPh3}" placeholder="휴대폰번호를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="email">이메일</label><br>
					<div class="input-group email-group">
						<input type="text" name="userEmail1" class="form-control" value="${user.userEmail1}" id="userEmail1" placeholder="이메일">
						<select	name="userEmail2" class="form-control" id="userEmail2">
							<option ${user.userEmail2 == '@naver.com' ? 'selected' : ''}>@naver.com</option>
							<option ${user.userEmail2 == '@daum.net' ? 'selected' : ''}>@daum.net</option>
							<option ${user.userEmail2 == '@gmail.com' ? 'selected' : ''}>@gmail.com</option>
							<option ${user.userEmail2 == '@hanmail.com' ? 'selected' : ''}>@hanmail.com</option>
						</select>
						<div class="input-group-addon">
							<button type="button" id="mail-check-btn" class="btn btn-primary">이메일인증</button>
						</div>
					</div>
					<div class="mail-check-box">
						<input type="text" class="form-control mail-check-input"
							placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
						<span id="mail-check-warn"></span>
					</div>
				</div>
				<div class="form-group">
					<label>이메일 수신동의</label> <br>
					<input type="checkbox" value="${user.userMobileOk}" name="userMobileOk" id="userMobileOk" ${user.userMobileOk == 1 ? 'checked' : ''}> <label>모바일</label> <br>
					<label>모바일</label> <br>
					<input type="checkbox" value="${user.userEmailOk}" name="userEmailOk" id="userEmailOk" ${user.userEmailOk == 1 ? 'checked' : ''}> <label>이메일</label>
					<label>이메일</label>
				</div>

				<div class="form-group">
					<label for="addr-num">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" 
							value="${user.addrZipNum}" placeholder="우편번호" readonly>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary"onclick="searchAddress()">주소찾기</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrBasic" id="addrBasic" 
						value="${user.addrBasic }" placeholder="기본주소" readonly>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrDetail" id="addrDetail" 
						value="${user.addrDetail}" placeholder="상세주소">
				</div>

				<div class="form-group">
					<button type="button" id="modifyBtn"
						class="btn btn-lg btn-info btn-block">수정하기</button>
				</div>
			</form>
		</div>
	</div>
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
	
	//수정 버튼을 눌렀을때 이벤트 발생
	$('#modifyBtn').click(function() {
		
		//사용자가 이메일을 변경했을 경우에만 인증번호 유효성 검사.
		if($('#userEmail1').val() !== '${user.userEmail1}' 
			|| $('#userEmail2').val() !== '${user.userEmail2}') {
			console.log('이메일을 바꿨습니다.');
			
			if(!$('#mail-check-btn').attr('disabled')) {
				alert('이메일 인증을 완료해주세요.');
				return;
			}
		}
		
		if($('#userId').val() !== '${user.userId}' || $('#userId').val().trim() === '') {
			$('#userId').focus();
			alert('아이디 중복 체크 필수');
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


















