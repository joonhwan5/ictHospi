<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container">
	<form class="form-horizontal">
		<h1 class="h1-div" style="margin-top: 10%;">
			아이디 찾기
		</h1>
		
		<div class="form-group form-group-lg">
			<label for="email" class="col-sm-4 control-label">이메일</label>
			<div class="col-sm-4">
				<input type="text" id="userEmail" class="form-control" placeholder="이메일을 입력해주세요.">
			</div>
		</div>
		
		<div class="form-group form-group-lg" style="text-align: center;">
			<button type="button" id="userFindIdBtn" class="btn btn-lg btn-info" style="display: inline-block;">찾기</button>
		</div>
		
	</form>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {
		$('#userFindIdBtn').click(function() {
			const email = $('#userEmail').val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/user/findId',
				type: 'POST',
				contentType: 'application/json',
				data: email,
				success: function(result) {
					console.log(result);
				},
				error: function() {
					console.log('통신오류');
				}
				
			})
			
		});
		
	});
</script>