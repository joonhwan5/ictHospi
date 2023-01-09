<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="container user-withdrawal">
	<%@include file="../include/myPageSide.jsp"%>
	
	<form action="${pageContext.request.contextPath}/myPage/userWithdrawal" id="deleteForm" method="post" class="form-horizontal">
		<h1 class="h1-div">
			회&nbsp;원&nbsp;탈&nbsp;퇴
		</h1>
		<div class="form-group">
			<div class="col-sm-offset-4">
				<select name="reason" class="col-sm-4">
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
				<textarea cols="100" rows="8" name="content" class="col-sm-9 userwithdrawal-textarea" placeholder="탈퇴사유를 적어주세요!!!!"></textarea>
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
		$('#withdrawalBtn').click(function() {
			if(confirm('정말로 탈퇴하시겠습니까?'))
			$('#deleteForm').submit();
		});
	});
</script>