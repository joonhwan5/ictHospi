<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/myPageSide.jsp"%>

<div class="container user-join-container">
	<h1 class="col-sm-offset-5 user-login-h1">
		회&nbsp;원&nbsp;수&nbsp;정
	</h1>

	<form action="<c:url value='/myPage/userModify' />" method="post" id="modifyForm" class="form-horizontal">
		<c:if test="${kakao == null}">
			<div class="form-group form-group-lg">
				<label for="id" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" name="userId" class="form-control" id="userId" maxlength="12" value="${user.userId}" placeholder="아이디를 (영문포함 4~12자 이상)">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">중복체크</button>
						</span>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<div class="form-group form-group-lg">
				<div class="col-sm-offset-4 col-sm-6 div-span-input-bottom">
					<span id="msgId" class="span-user-join"></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</c:if>
		<c:if test="${kakao != null}">
			<input type="hidden" name="userId" value="${user.userId}">
		</c:if>
		
		<div class="form-group form-group-lg">
			<label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
			<div class="col-sm-6">
				<input type="text" name="userName" class="form-control" id="userName" value="${user.userName}" placeholder="이름을 입력하세요." maxlength="5">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="birth" class="col-sm-offset-1 col-sm-3 control-label join-birth-label">생년월일</label>
			<div class="col-sm-2 join-birth">
				<input type="text" name="year" id="year" class="form-control" value="${year}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1994">
			</div>
			<div class="col-sm-2 join-birth">
				<select name="month" id="month" class="form-control">
					<c:forEach var="m" begin="1" end="12">
						<option ${m == month ? 'selected' : ''}>${m}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-2 join-birth">
				<input type="text" name="day" id="day" class="form-control" value="${day}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2" placeholder="13">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">주민등록번호 뒷자리</label>
			<div class="col-sm-2">
				<input type="text" name="userBirth2" class="form-control" id="userBirth2" value="${user.userBirth2}" oninput="this.value = this.value.replace(/[^1|2|3|4.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="1" placeholder="*">
			</div>
			<div class="col-sm-1" style="padding-left: 0px;">
				<label><strong>******</strong></label>
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label class="col-sm-offset-1 col-sm-3 control-label">휴대폰번호</label>
				<div class="col-sm-2">
					<select class="form-control phone1" name="userPh1" id="userPh1">
						<option ${user.userPh1 == '010' ? 'selected' : '' }>010</option>
						<option ${user.userPh1 == '011' ? 'selected' : '' }>011</option>
						<option ${user.userPh1 == '017' ? 'selected' : '' }>017</option>
						<option ${user.userPh1 == '018' ? 'selected' : '' }>018</option>
					</select>
				</div>
				
				<div class="col-sm-2" id="div-userPh2">
					<input type="text" class="form-control" name="userPh2" id="userPh2" value="${user.userPh2}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="userPh3" id="userPh3" value="${user.userPh3}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
			<div class="col-sm-2 special-left">
				<input type="text" name="userEmail1" class="form-control" id="userEmail1" value="${user.userEmail1}" placeholder="이메일">
			</div>
			<div class="left">
				<strong>@&nbsp;</strong>
			</div>
			<div class="col-sm-4 special-right">
				<div class="input-group">
					<select name="domain" class="form-control" id="userEmail2">
						<option ${user.userEmail2 == 'naver.com' ? 'selected' : ''}>naver.com</option>
						<option ${user.userEmail2 == 'daum.net' ? 'selected' : ''}>daum.net</option>
						<option ${user.userEmail2 == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
					</select>
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" id="mailCheckBtn">이메일인증</button>
					</span>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">이메일 인증번호</label>
			<div class="mail-check-box col-sm-2">
				<input type="text" class="form-control mailCheckInput" placeholder="인증번호" maxlength="6" disabled="disabled">
			</div>
			<div class="span-email-check">
				<span id="mailCheckWarn" class="span-user-join"></span>		
			</div>
			<div class="col-sm-6"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">이메일 수신동의</label>
			<div class="col-sm-3">
				<div class="form-group" style="margin-left: 0px;">
					<div class="checkbox">
						<input type="checkbox" value="1" name="userMobileOk" id="userMobileOk" ${user.userMobileOk == '1' ? 'checked' : ''}><label>모바일</label>
						<input type="checkbox" value="1" name="userEmailOk" id="userEmailOk" ${user.userEmailOk == '1' ? 'checked' : ''}><label>이메일</label>
					</div>
				</div>
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-num" class="col-sm-offset-1 col-sm-3 control-label">우편번호</label>
			<div class="col-sm-7">
				<div class="input-group">
					<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" value="${user.addrZipNum}" placeholder="우편번호" readonly>
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" onclick="searchAddress()">주소찾기</button>
					</span>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-basic" class="col-sm-offset-1 col-sm-3 control-label">기본주소</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="addrBasic" id="addrBasic" value="${user.addrBasic}" placeholder="기본주소" readonly>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-detail" class="col-sm-offset-1 col-sm-3 control-label">상세주소</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" value="${user.addrDetail}" placeholder="상세주소" maxlength="30">
			</div>
			<div class="col-sm-1"></div>
		</div>
	
		<div class="form-group join-btn-group clearfix">
			<div class="col-sm-offset-3 col-sm-7">
				<button type="button" id="modifyBtn" class="btn btn-lg btn-info col-sm-5">수정하기</button>
				<button type="button" id="userJoinClose" class="btn btn-lg btn-info col-sm-offset-1 col-sm-5" onclick="history.back()">취소</button>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	let kakao = '${kakao}';
	let code = ''; //인증코드 저장
	let login = '${login}';
	let now = new Date();
	
	$(document).ready(function() {
		
		$('input').keydown(function() {
			$(this).css('border-color', '#ccc');
		});
		
		if(kakao === '') {
			/* 아이디 중복 체크 */
			$('#idCheckBtn').click(function() {
				const userId = $('#userId').val();
				
				if(userId === login) {
					alert('변경사항이 없습니다.');
					$('#msgId').text('');
					$('#userId').css('border-color', '#ccc');
					return;
				}
				
				if($('#userId').val().trim() === '') {
					$('#userId').val('');
					$('#userId').focus();
					alert('아이디를 반드시 입력해주세요.');
					return;
				}
				
				if($('#userId').val().length <= 3) {
					$('#userId').focus();
					alert('아이디를 정확히 입력해주세요.');
					return;
				}
				
				if($('#userId').val().length >= 13) {
					$('#userId').focus();
					alert('아이디를 정확히 입력해주세요.');
					return;
				}
				
				if(!($('#msgId').text() === '아이디 중복체크는 필수입니다.')) {
					$('#userId').focus();
					alert('아이디를 정확히 입력해주세요.');
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
		} // if문 끝
		
		//인증번호 이메일 전송
		$('#mailCheckBtn').click(function() {
			loading();
			
			if ($('#userEmail1').val() === '') {
				alert('이메일을 입력해주세요.');
				endLoading();
				return;
			}
			
			const email = $('#userEmail1').val() + '@' + $('#userEmail2').val();
			
			$.ajax({
				type: 'get',
				url: '<c:url value="/user/mailCheck?email=" />' + email,
				success: function(data) {
					endLoading();
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
		
		// 수정 버튼을 눌렀을때 이벤트 발생
		$('#modifyBtn').click(function() {
			
			//사용자가 이메일을 변경했을 경우에만 인증번호 유효성 검사.
			if($('#userEmail1').val() !== '${user.userEmail1}' || $('#userEmail2').val() !== '${user.userEmail2}') {
				console.log('걸렸네');
				if(!$('#mailCheckBtn').attr('disabled')) {
					console.log('disabled');
					alert('이메일 인증을 완료해주세요.');
					$('#userEmail1').css('border-color', 'red');
					return;
				}
			}
			
			if(kakao === '') {
				// 아이디 체크
				if($('#userId').val() !== '${user.userId}' || $('#userId').val().trim() === '') {
					$('#userId').focus();
					$('#userId').css('border-color', 'red');
					alert('아이디를 변경하셨습니다. 중복 체크는 필수입니다.');
					return;
				}
			}
			
			// 이름 체크
			if($('#userName').val().trim() === '') {
				$('#userName').val('');
				$('#userName').focus();
				$('#userName').css('border-color', 'red');
				alert('이름은 필수입니다.');
				return;
			} else {
				if($('#userName').val().length <= 1) {
					$('#userName').focus();
					$('#userName').css('border-color', 'red');
					alert('이름을 정확히 입력해주세요.');
					return;
				}
				
				for(let i=0; i<$('#userName').val().length; i++) {
					let nch = $('#userName').val().substring(i, i+1);
					if(nch.match(/[0-9]|[a-z]|[A-Z]/)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/([^가-힣\x20])/i)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/[\s]/)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('글자 사이 공백이 있습니다.');
						return;
					}
				}
			}
			
			// 출생년도 체크
			if($('#year').val().trim() === '') {
				$('#year').val('');
				$('#year').focus();
				$('#year').css('border-color', 'red');
				alert('출생년도는 필수입니다.');
				return;
			} else {
				if($('#year').val().length <= 3) {
					$('#year').focus();
					$('#year').css('border-color', 'red');
					alert('출생년도를 정확히 입력해주세요.');
					return;
				}
				
				if(+$('#year').val() === 0) {
					$('#year').focus();
					$('#year').css('border-color', 'red');
					alert('출생년도를 정확히 입력해주세요.');
					return;
				}
				
				if(!(+$('#year').val() >= 1903 && +$('#year').val() <= 2023)) {
					$('#year').focus();
					$('#year').css('border-color', 'red');
					alert('출생년도를 정확히 입력해주세요.');
					return;
				}
			}
			
			// 월 체크
			if($('#month').val() === '월') {
				$('#month').focus();
				$('#month').css('border-color', 'red');
				alert('월을 선택해주세요.');
				return;
			} else {
				if(+$('#year').val() === 2023) {
					if(+$('#month').val() > now.getMonth()+1) {
						$('#month').focus();
						$('#month').css('border-color', 'red');
						alert('월을 정확하게 입력해주세요.');
						return;
					}
				}
			}
			
			// 일 체크
			if($('#day').val().trim() === '') {
				$('#day').val('');
				$('#day').focus();
				$('#day').css('border-color', 'red');
				alert('출생일는 필수입니다.');
				return;
			} else {
				if(+$('#day').val() === 0) {
					$('#day').focus();
					$('#day').css('border-color', 'red');
					alert('출생일을 정확하게 입력해주세요.');
					return;
				}
				
				if(+$('#day').val() > 31) {
					console.log($('#day').val());
					$('#day').focus();
					$('#day').css('border-color', 'red');
					alert('출생일을 정확하게 입력해주세요.');
					return;
				}
				
				if(+$('#month').val() === 2) {
					if($('#day').val() > 29) {
						$('#day').focus();
						$('#day').css('border-color', 'red');
						alert('출생일을 정확하게 입력해주세요.');
						return;
					}
				}
				
				if(+$('#year').val() === 2023) {
					if(+$('#month').val() === now.getMonth()+1) {
						if(+$('#day').val() > now.getDate()) {
							$('#day').focus();
							$('#day').css('border-color', 'red');
							alert('출생일을 정확하게 입력해주세요.');
							return;
						}
					}
				}
			}
			
			// 주민번호뒷자리 체크
			if($('#userBirth2').val().trim() === '') {
				$('#userBirth2').val('');
				$('#userBirth2').focus();
				$('#userBirth2').css('border-color', 'red');
				alert('주민등록번호 뒷자리를 반드시 입력해주세요.');
				return;
			} else {
				if(+$('#userBirth2').val() === 0) {
					$('#userBirth2').focus();
					$('#userBirth2').css('border-color', 'red');
					alert('주민등록번호 뒷자리를 정확하게 입력해주세요.');
					return;
				}
				
				if(+$('#userBirth2').val() >= 1 && +$('#userBirth2').val() <= 2) {
					if(!(+$('#year').val() >= 1900 && +$('#year').val() <= 1999)) {
						$('#userBirth2').focus();
						$('#userBirth2').css('border-color', 'red');
						alert('주민등록번호 뒷자리를 정확하게 입력해주세요.');
						return;
					}
				}
				
				if(+$('#userBirth2').val() >= 3 && +$('#userBirth2').val() <= 4) {
					if(!(+$('#year').val() >= 2000 && +$('#year').val() <= 2099)) {
						$('#userBirth2').focus();
						$('#userBirth2').css('border-color', 'red');
						alert('주민등록번호 뒷자리를 정확하게 입력해주세요.');
						return;
					}
				}
			}
			
			// 휴대전화번호 체크
			if($('#userPh2').val().trim() === '' || $('#userPh3').val().trim() === '') {
				if($('#userPh2').val().trim() === '') {
					$('#userPh2').val('');
					$('#userPh2').focus();
					$('#userPh2').css('border-color', 'red');
					alert('휴대전화번호를 입력해주세요.');
					return;
				}
				
				if($('#userPh3').val().trim() === '') {
					$('#userPh3').val('');
					$('#userPh3').focus();
					$('#userPh3').css('border-color', 'red');
					alert('휴대전화번호를 입력해주세요.');
					return;
				}
				
			} else {
				if($('#userPh2').val().length <= 3) {
					$('#userPh2').focus();
					$('#userPh2').css('border-color', 'red');
					alert('휴대전화번호를 정확히 입력해주세요.');
					return;
				}
				
				if($('#userPh3').val().length <= 3) {
					$('#userPh3').focus();
					$('#userPh3').css('border-color', 'red');
					alert('휴대전화번호를 정확히 입력해주세요.');
					return;
				}
			}
			
			// 주소 체크
			if($('#addrZipNum').val().trim() === '' || $('#addrBasic').val().trim() === '' || $('#addrDetail').val().trim() === '') {
				$('#addrDetail').focus();
				alert('주소를 다시 확인해주세요.');
				return;
			}
			
			if(confirm('이대로 수정을 진행 하시겠습니까?')) {
				$('#modifyForm').submit();
			}
			
		}); // 수정 버튼 끝.
	});
	
	// 카카오 주소
	function searchAddress() {
		const width = 500;
		const height = 600;
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var addr = '';
	            var extraAddr = '';
	
	            if (data.userSelectedType === 'R') {
	                addr = data.roadAddress;
	            } else {
	                addr = data.jibunAddress;
	            }
	
	            document.getElementById('addrZipNum').value = data.zonecode;
	            document.getElementById('addrBasic').value = addr;
	            document.getElementById('addrDetail').focus();
	        }
	    }).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2)
		});
	}

	/* 아이디 유효성 검사 */
	if(kakao === '') {
		var id = document.getElementById("userId");
		id.onkeyup = function() {
		    var regex = /(?=.*\d)(?=.*[a-z]).{4,12}/;
		    if(regex.test(document.getElementById("userId").value )) {
		        document.getElementById("userId").style.borderColor = "green";
		        document.getElementById("msgId").innerHTML = "아이디 중복체크는 필수입니다.";
		        document.getElementById("msgId").style.color = "black";
		    } else {
		        document.getElementById("userId").style.borderColor = "red";
		        document.getElementById("msgId").innerHTML = "영문과 숫자가 포함되게 작성해주세요.";
		        document.getElementById("msgId").style.color = "red";
		    }
		}
	}
	
	// 로딩창 열기
	function loading() {
		const windowWidth = window.document.body.clientWidth;
		const windowHeight = $(document).height;
		const $loadingBackground = '<div id="loadingBackground" style="position: fixed; left: 0; top: 0; z-index: 500000000; background: #808080; display=none;"></div>';
		
		let $loadingImg = '';
		$loadingImg += '<div id="loadingImg" style="position: fixed; top: 50%; left: 50%; width: 100%; transform: translate(-50%, -50%); z-index: 99999;">';
		$loadingImg += `<img src="<c:url value='/img/loadingGif.gif' />" style="position: relative; display: block; margin: 0 auto;" />`;
		$loadingImg += '</div>';
					 
		$('body').append($loadingBackground).append($loadingImg);
		
		$('#loadingBackground').css({
			'width' : windowWidth,
			'height' : windowHeight,
			'opacity' : '0.5'
		});
		
		$('#loadingBackground').show();
		$('#loadingImg').show();
	}
	
	// 로딩창 닫기
	function endLoading() {
		$('#loadingBackground, #loadingImg').hide();
	}

</script>


















