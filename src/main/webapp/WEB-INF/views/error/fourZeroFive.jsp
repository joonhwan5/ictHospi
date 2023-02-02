<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="fourZeroFiveImg">
		<img alt="" src="${pageContext.request.contextPath}/img/fourZeroFive.png">
	</div>
	
	<div class="fourZeroFiveButton">
		<button type="button" class="fiveErrorBackGo">뒤로가기</button>
	</div>


<script>

	$('.fiveErrorBackGo').click(function() {
		history.back();
	});
	
</script>