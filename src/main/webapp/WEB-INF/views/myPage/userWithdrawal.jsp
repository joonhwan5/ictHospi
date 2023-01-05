<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<%@include file="../include/myPageSide.jsp"%>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="${pageContext.request.contextPath}/myPage/userWithdrawal" id="deleteForm" method="post">
				<div class="col-md-12">
					<select name="reason">
						<option>선택</option>
						<option>정보변경</option>
						<option>병원서비스 불만</option>
						<option>개인정보 노출우려</option>
						<option>이사로 인한 병원이용 불필요</option>
						<option>사이트 이용불편</option>
						<option>기타</option>
					</select>
				</div>
				<div class="col-md-6">
					<textarea cols="100" name="content" style="resize: none;" placeholder="탈퇴사유를 적어주세요!!!!"></textarea>
				</div>
				<input type="hidden" value="${login}" name="userId">
				<div class="col-md-5 col-md-offset-5">
					<button id="withdrawalBtn" type="button" class="btn btn-info">탈퇴</button>
				</div>
			</form>
		</div>
	</div>
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