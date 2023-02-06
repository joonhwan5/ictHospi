<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container user-join-container">
	
	<h1 class="col-sm-offset-5 user-login-h1">
		회&nbsp;원&nbsp;가&nbsp;입
	</h1>
	
	<form action="<c:url value='/user/kakaoJoin' />" method="post" id="joinForm" class="form-horizontal">
		
		<div class="form-group form-group-lg">
			<label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
			<div class="col-sm-6">
				<input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력하세요." maxlength="5">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		
		<hr>
		
		
		<div class="form-group form-group-lg">
			<label for="birth" class="col-sm-offset-1 col-sm-3 control-label join-birth-label">생년월일</label>
			<div class="col-sm-2 join-birth">
				<input type="text" name="year" id="year" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1994">
			</div>
			<div class="col-sm-2 join-birth">
				<select name="month" id="month" class="form-control">
					<option>월</option>
					<c:forEach var="m" begin="1" end="12">
						<option>${m}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-2 join-birth">
				<input type="text" name="day" id="day" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2" placeholder="13">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		
		<hr>
		
		
		<div class="form-group form-group-lg">
			<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">주민등록번호 뒷자리</label>
			<div class="col-sm-2">
				<input type="text" name="userBirth2" class="form-control" id="userBirth2" oninput="this.value = this.value.replace(/[^1|2|3|4.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="1" placeholder="*">
			</div>
			<div class="col-sm-1">
				<label><strong>******</strong></label>
			</div>
			<div class="sol-sm-5"></div>
		</div>
		
	
		<hr>
		
		
		<div class="form-group form-group-lg">
			<label for="hp" class="col-sm-offset-1 col-sm-3 control-label">휴대폰번호</label>
			
				<div class="col-sm-2">
					<select class="form-control phone1" name="userPh1" id="userPh1">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>018</option>
					</select>
				</div>
				
				<div class="col-sm-2" id="div-userPh2">
					<input type="text" class="form-control" name="userPh2" id="userPh2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
				
				<div class="col-sm-2">
					<input type="text" class="form-control" name="userPh3" id="userPh3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
				<div class="col-sm-2"></div>
		</div>
		
		
		<hr>
				
		
		<div class="form-group form-group-lg">
			<label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">이메일 수신동의</label>
			<div class="col-sm-3">
				<div class="form-group" style="margin-left: 0px;">
					<div class="checkbox">
						<input type="checkbox" value="1" name="userMobileOk" id="userMobileOk"><label for="userMobileOk">모바일</label>
						<input type="checkbox" value="1" name="userEmailOk" id="userEmailOk"><label for="userEmailOk">이메일</label>
					</div>
				</div>
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		
		<hr>
		
		
		<div class="form-group form-group-lg">
			<label for="addr-num" class="col-sm-offset-1 col-sm-3 control-label">우편번호</label>
			<div class="col-sm-7">
				<div class="input-group">
					<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
					<span class="input-group-btn">
						<button type="button" id="addressBtn" class="btn btn-primary btn-lg" onclick="searchAddress()">주소찾기</button>
					</span>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-basic" class="col-sm-offset-1 col-sm-3 control-label">기본주소</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소" readonly>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-detail" class="col-sm-offset-1 col-sm-3 control-label">상세주소</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소" maxlength="30">
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<input type="hidden" name="userId" value="${kakaoId}">
		<input type="hidden" name="kakaoEmail" value="${kakaoEmail}">
		
		<div class="form-group join-btn-group clearfix">
			<div class="col-sm-offset-3 col-sm-7">
				<button type="button" id="userJoinRegistBtn" class="btn btn-lg btn-info col-sm-5">가입하기</button>
				<button type="button" id="userJoinClose" class="btn btn-lg btn-info col-sm-offset-1 col-sm-5">취소</button>
			</div>
			<div class="col-sm-2"></div>
		</div>

	</form>
	
</div>
<%@include file="../include/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$(document).ready(function() {
		
		// 회원가입 취소 버튼
		$('#userJoinClose').click(function() {
			history.back();
		});
		
		let now = new Date();
		
		$('input').keydown(function() {
			$(this).css('border-color', '#ccc');
		});
		
		function kakaoUserChooseJoinCheck() {
			
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
				$('#addrDetail').css('border-color', 'red');
				alert('주소를 다시 확인해주세요.');
				return;
			}
			
			if(confirm('회원가입을 하시겠습니까?')) {
				$('#joinForm').submit();
			}
		}
		
		$('#joinForm').on('keydown', 'input', function(e) {
			if(e.keyCode === 13) {
				kakaoUserChooseJoinCheck();
			}
		});
		
		/* 회원가입 체크 */
		$('#userJoinRegistBtn').click(function() {
			
			kakaoUserChooseJoinCheck();
			
		});
	});
	
	// 카카오 지도 api
	function searchAddress() {
		const width = 500;
		const height = 600;
		new daum.Postcode({
			oncomplete : function(data) {
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
</script>

