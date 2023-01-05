<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><h2>병원 소개</h2></li>
		<li class="side"><a href="#">개요</a></li>
		<li class="side"><a href="#">원장의 말</a></li>
		<li class="side"><h2>의료진 소개</h2></li>
		<li class="side"><a href="${pageContext.request.contextPath}/introduce/introInternalMain?subject=내과">내과</a></li>
		<li class="side"><a href="${pageContext.request.contextPath}/introduce/introSurgeryMain?subject=외과">외과</a></li>
		<li class="side"><a href="${pageContext.request.contextPath}/introduce/introSkinMain?subject=피부과">피부과</a></li>
		<li><h2>기타</h2></li>
		<li class="side"><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
	</ul>
</div>

<script>

	/*
	$(".side").click(function(e) {
		var el = $(e.target).closest('li')
		el.siblings('li').removeClass("active");
		el.addClass("active");
	});
	*/
	
	$(".side").click(function() {
		$(".side").removeClass("active");
		$(this).addClass("active");
	});
	
</script>