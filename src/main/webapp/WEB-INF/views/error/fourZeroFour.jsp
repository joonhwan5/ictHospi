<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="hi" style="text-align: center;">
		<div class="fourZeroFourImg">
			<img alt="" src="${pageContext.request.contextPath}/img/fourZeroFour.png">
		</div>
		
		<div class="fourZeroFourButton">
			<button type="button" class="fourErrorBackGo">뒤로가기</button>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>

	$('.fourErrorBackGo').click(function() {
		history.back();
	});
	
</script>