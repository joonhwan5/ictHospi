<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="fourZeroFourImg">
		<img alt="" src="${pageContext.request.contextPath}/img/fourZeroFour.png">
	</div>
	
	<div class="fourZeroFourButton">
		<button type="button" class="fourErrorBackGo">뒤로가기</button>
	</div>


<script>

	$('.fourErrorBackGo').click(function() {
		history.back();
	});
	
</script>