<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<div class="container-fulid col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<form id="userFindIdForm" class="form-horizontal">
		<h1 class="col-sm-offset-4" style="margin-top: 20vh;">
			아이디 찾기
		</h1>
		
		<div class="form-group form-group-lg">
			<label for="email" class="col-sm-offset-2 col-sm-1 control-label" style="line-height: 5vh">이메일</label>
			<div class="col-sm-4">
				<input type="text" id="userEmail" class="form-control" placeholder="이메일을 입력해주세요.">
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<div class="col-sm-offset-3 col-sm-4">
				<button type="button" id="userFindIdBtn" class="btn btn-lg btn-block btn-info">찾기</button>
			</div>
			<div class="col-sm-offset-5"></div>
		</div>
		
	</form>
	
	<div id="succId">
		<div class="row">
			<h1 class="col-sm-offset-4" style="margin-top: 15vh;">
				아이디 찾기
			</h1>
			<div class="col-sm-8"></div>
		</div>
		<div class="row">
			<p id="ex" class="col-sm-offset-3"></p>
			<div class="col-sm-9"></div>		
		</div>
		<div class="row">
			<button id="userFindIdLoginBtn" class="col-sm-offset-5 btn btn-lg btn-info">로그인</button>
			<div class="col-sm-offset-7"></div>
		</div>
		<div class="row">
			<a href="<c:url value='/user/userFindPw' />" class="col-sm-offset-4">비밀번호를 잊으셨나요?</a>
			<div class="col-sm-8"></div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	
	let id = '';
	
	$(document).ready(function() {
		
		$('#succId').hide();
		$('#userEmail').focus();
		
		function userFindIdAj() {
			const email = $('#userEmail').val();
			
			if($('#userEmail').val().trim() === '') {
				alert('이메일을 입력해주세요.');
				$('#userEmail').focus();
				return;
			}
			
			if(!$('#userEmail').val().includes('@')) {
				alert('이메일을 정확히 입력해주세요.');
				$('#userEmail').val('');
				$('#userEmail').focus();
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/user/findId',
				type: 'POST',
				contentType: 'application/json',
				data: email,
				success: function(result) {
					if(result.length === 0) {
						alert('아이디가 없습니다. 이메일을 다시 입력해주세요.');
					} else {
						for(let i=0; i<result.length; i++) {
							id += result[i].userId + ' ';
						}
						$('#userEmail').parents('#userFindIdForm').css('display', 'none');
						exHtmlText = '해당 이메일의 아이디는 '+ id +'입니다.' ;
						$('#ex').text(exHtmlText);
						$('#succId').show();
					}
				},
				error: function() {
					console.log('통신오류');
				}
			});
		}
		
		$('#userFindIdBtn').click(function() {
			
			userFindIdAj();
			
		});

		$('#userFindIdForm').on('keydown', 'input', function(e) {
			if(e.keyCode === 13) {
				e.preventDefault();
				
				userFindIdAj();
			}
		});
		
	});
</script>