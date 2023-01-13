<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="container user-withdrawal">
	<%@include file="../include/myPageSide.jsp"%>
	
	<form action="#" id="userCheckPwForm" class="form-horizontal">
		<h1 class="h1-div">
			회&nbsp;원&nbsp;탈&nbsp;퇴
		</h1>

		<div class="form-group form-group-lg div-oldpw">
			<label for="pw" class="col-sm-6 control-label">현재비밀번호</label>
			<div class="col-sm-4">
				<input type="password" name="oldPw" id="oldPw" class="form-control"	placeholder="현재 비밀번호를 입력해주세요.">
				<input type="hidden" name="userId" id="userId" value="${login}">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-1 col-sm-offset-9" id="userwithdrawalTextarea">
				<button type="button" id="userCheckPwBtn" class="btn btn-block btn-info">탈퇴</button>
			</div>
		</div>
	</form>
	
	<form action="${pageContext.request.contextPath}/myPage/userWithdrawal" id="deleteForm" method="post" class="form-horizontal" style="display: none;">
		<h1 class="h1-div">
			회&nbsp;원&nbsp;탈&nbsp;퇴
		</h1>
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
		<div class="form-group">
			<div class="col-sm-offset-4">
				<textarea cols="100" rows="8" name="content" id="userWithdrawalTextarea" class="col-sm-9 userwithdrawal-textarea" placeholder="탈퇴사유를 적어주세요!!!!"></textarea>
				<input type="hidden" value="${login}" name="userId">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1 col-sm-offset-9" id="userwithdrawalTextarea">
				<button type="button" id="withdrawalBtn" class="btn btn-block btn-info">탈퇴</button>
			</div>
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp" %>
<script>
	$(document).ready(function() {
		
		$('#userWithdrawalTextarea').keyup(function() {
			const maxByte = 2000;
			const textVal = $(this).val();
			const textLen = $(this).val().length;
			
			let totalByte = 0;
			for(let i=0; i<textLen; i++) {
				const eachChar = textVal.charAt(i);
				const uniChar = escape(eachChar);
				if(uniChar.length > 4) {
					totalByte += 2;
					console.log(totalByte);
				} else {
					totalByte += 1;
				}
			}
			
			if(totalByte >= maxByte) {
				alert('최대 20000byte까지만 입력가능합니다.');
				$(this).val(cutByLen(textVal, 2000));
			}
			
		});
		
		$('#withdrawalBtn').click(function() {
			
			if($('#reason').val() === '선택') {
				$('#reason').focus();
				alert('회원탈퇴 이유를 선택해주세요.');
				return;
			}
			
			if(confirm('정말로 탈퇴하시겠습니까?'))
			$('#deleteForm').submit();
		});
		
		// 현재 비밀번호 확인
		$('#userCheckPwBtn').click(function() {
			
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
		});
	});
	
	 function cutByLen(str, maxByte) {

		 for(b=i=0;c=str.charCodeAt(i);) {

			 b+=c>>7?2:1;
	
			 if (b > maxByte) break;
	
			 i++;

		 }

		 return str.substring(0,i);

	 }
</script>