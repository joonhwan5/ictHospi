<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

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
			<form action="${pageContext.request.contextPath}/myPage/userWithdrawal" id="deleteForm" method="post">
				<div class="col-md-12">
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>
				</div>
				<div class="col-md-6">
					<textarea cols="100" style="resize: none;" placeholder="탈퇴사유를 적어주세요!!!!"></textarea>
				</div>
				<input type="hidden" value="${id}" name="userId">
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