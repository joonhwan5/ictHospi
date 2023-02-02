<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="hihi" style="text-align: center;">
		<div class="fourZeroFiveImg">
			<img alt="" src="${pageContext.request.contextPath}/img/fourZeroFive.png">
		</div>
		
		<div class="fourZeroFiveButton">
			<button type="button" class="fiveErrorBackGo">뒤로가기</button>
		</div>	
	</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
	$(document).ready(function() {
		
		$('.fiveErrorBackGo').click(function() {
			history.back();
		});
	});
	
	
</script>