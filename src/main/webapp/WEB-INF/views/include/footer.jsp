<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@media(max-width: 550px) {
	.text-right {
		display: none;
	}
}
</style>


<footer class="footer">
	<div class="container footer-container clearfix">
		<div class="col-md-8 col-sm-12 left">
			<div class="copyright">
				<a href=""></a>
				<br> 
				ICT병원 | 대표자 : 김준환 | E-MAIL : info&#64;info.com <br> 
				주소 : 서울 마포구 백범로 23 | 개인정보보호책임자 : 홍길동 | 대표전화 : 010-7507-8157 <br> 
				<br>
				<address>&copy;Copyright(c) 2020 ICT Medical Center. All rights reserved</address>
				<br>
			</div>
		</div>
		<div class="col-md-4 col-sm-12 text-right right">
		<br>
			<ul class="footer-menu text-right">
				<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
				<li><a href="${pageContext.request.contextPath}/util/clientService">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/util/clientAgree">이용약관</a></li>
			</ul>
		</div>
	</div>
</footer>

</body>
</html>