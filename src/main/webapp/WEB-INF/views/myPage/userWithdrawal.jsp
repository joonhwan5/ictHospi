<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@include file="../include/myPageSide.jsp"%>

<div class="container user-join-container">
	<h1 class="col-sm-offset-5 user-login-h1">
		회&nbsp;원&nbsp;탈&nbsp;퇴
	</h1>
	
	<c:if test="${kakao == null}">
		<div id="userCheckPwForm">
			<div class="form-group form-group-lg div-oldpw">
				<label for="pw" class="col-sm-offset-2 col-sm-2 col-md-offset-2 col-md-2 col-xs-offset-2 col-xs-2 control-label">현재비밀번호</label>
				<div id="userCheckPwDiv" class="col-sm-4 col-md-4 col-xs-4">
					<input type="password" name="oldPw" id="oldPw" class="form-control"	placeholder="현재 비밀번호를 입력해주세요." maxlength="14">
					<input type="hidden" name="userId" id="userId" value="${login}">
				</div>
				<div class="col-sm-2 col-md-2 col-xs-2">
					<button type="button" id="userCheckPwBtn" class="btn btn-lg btn-block btn-info">탈퇴</button>
				</div>
				<div class="col-sm-2 col-md-2 col-xs-2"></div>
			</div>
		</div>
	
	
		<form action="${pageContext.request.contextPath}/myPage/userWithdrawal" id="deleteForm" method="post" class="form-horizontal" style="display: none;">
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-md-offset-3 col-sm-7 col-md-7">
					<select name="reason" id="reason" class="col-sm-4">
						<option>선택</option>
						<option>정보변경</option>
						<option>병원서비스 불만</option>
						<option>개인정보 노출우려</option>
						<option>이사로 인한 병원이용 불필요</option>
						<option>사이트 이용불편</option>
						<option>기타</option>
					</select>
				</div>
			</div>
			<div class="form-group reason-text" style="display: none;">
				<div class="col-sm-offset-3 col-md-offset-3 col-sm-7 col-md-7">
					<textarea cols="100" rows="8" name="content" id="userWithdrawalTextarea" class="userwithdrawal-textarea" placeholder="탈퇴사유를 적어주세요." style="width: 100%;"></textarea>
					<input type="hidden" value="${login}" name="userId">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-md-10" style="text-align: right;">
					<span id="userWithContentByte"></span><span>/ 2000</span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-md-offset-3 col-sm-7 col-md-7">
					<button type="button" id="withdrawalBtn" class="btn btn-block btn-info">탈퇴</button>
				</div>
			</div>
		</form>
	</c:if>
	
	<c:if test="${kakao != null }">
		<form action="${pageContext.request.contextPath}/myPage/userWithdrawal"	id="deleteForm" method="post" class="form-horizontal">
			<div class="form-group">
				<div class="col-sm-offset-4">
					<select name="reason" id="reason" class="col-sm-4">
						<option>선택</option>
						<option>정보변경</option>
						<option>병원서비스 불만</option>
						<option>개인정보 노출우려</option>
						<option>이사로 인한 병원이용 불필요</option>
						<option>사이트 이용불편</option>
						<option>기타</option>
					</select>
				</div>
			</div>
			<div class="form-group reason-text" style="display: none;">
				<div class="col-sm-offset-4">
					<textarea cols="100" rows="8" id="userWithdrawalTextarea" name="content" class="col-sm-9 userwithdrawal-textarea" placeholder="탈퇴사유를 적어주세요!!!!"></textarea>
					<input type="hidden" value="${login}" name="userId">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-md-10" style="text-align: right;">
					<span id="userWithContentByte"></span><span>/ 2000</span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-1 col-sm-offset-9">
					<button type="button" id="withdrawalBtn" class="btn btn-block btn-info">탈퇴</button>
				</div>
			</div>
		</form>
	</c:if>
</div>
<%@include file="../include/footer.jsp" %>
<script>
	
	// 처음 0 / 2000을 표현
	let firstContent = $('#userWithdrawalTextarea').val();
	let firstContentByteLength = 0;
	firstContentByteLength = (function(s,b,i,c) {
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b
	})(firstContent);
	$('#userWithContentByte').html(firstContentByteLength+ ' ');
	
	$('#reason').change(function(){
		if($(this).val() == '기타') {
			$('.reason-text').css('display', 'block');
		} else {
			$('.reason-text').css('display', 'none');
		}
	});
	
	$(document).ready(function() {
		let kakao = '${kakao}';
		$('#oldPw').focus();
		let contentByteLength = 0;
		
		$('#userWithdrawalTextarea').keyup(function() {
			//글자수 바이트 체크를 위한 변수 선언
			let content = $(this).val();
			let contentLength = content.length;
			
			contentByteLength = (function(s,b,i,c){
			    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			$('#userWithContentByte').text(contentByteLength);
		});
		
		$('#withdrawalBtn').click(function() {
			
			if($('#reason').val() === '선택') {
				$('#reason').focus();
				alert('회원탈퇴 이유를 선택해주세요.');
				return;
			}
			
			if(contentByteLength > 2000) {
				alert('내용은 2000 Byte를 넘을 수 없습니다.');
				$('#userWithdrawalTextarea').focus();
				return;
			}
			
			if(confirm('정말로 탈퇴하시겠습니까?'))
			$('#deleteForm').submit();
		});
		
		function oldPwValidation() {
			const pw = $('#oldPw').val();
			const id = $('#userId').val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/myPage/userCheckPw',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					'id': id,
					'pw': pw
				}),
				success: function(result) {
					if(result === 'success') {
						$('#userCheckPwForm').attr('style', 'display: none;');
						$('#deleteForm').attr('style', 'display: block;')
					} else {
						alert('현재 비밀번호가 틀렸습니다. 다시 입력해주세요.');
					}
				},
				error: function() {
					alert('통신오류');
				}
			});
		}
		
		// 현재 비밀번호 확인
		$('#userCheckPwBtn').click(function() {
			oldPwValidation();
		});
		
		$('#userCheckPwForm').on('keydown', 'input', function(e) {
			console.log(e.keyCode);
			if(e.keyCode === 13) {
				oldPwValidation();
			}
		});
		
	});
</script>