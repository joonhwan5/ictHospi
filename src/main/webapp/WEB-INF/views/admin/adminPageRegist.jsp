<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<%@include file="../include/adminSide.jsp"%>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">			
			<h1>의료진 신규 등록</h1>
			<hr>
			<form action="${pageContext.request.contextPath}/admin/registDoctor" method="post" enctype="multipart/form-data" id="insertDoctor">	
				<div class="form-group">
					<label>의사 이름</label>
					<input class="form-control" name="doctorName" id="doctorName" placeholder="의사 이름" maxlength="5">
				</div>
				<div class="form-group">
					<label>진료 과목</label> 
					<select class="form-control" name="medicalDepartment" id="medicalDepartment">
						<option value="" disabled selected style="display: none;">과를 선택해주세요</option>
						<option>내과</option>
						<option>외과</option>
						<option>피부과</option>
					</select>
				</div>
				<div class="form-group">
					<label>상세 진료</label> <input class="form-control" name="medicalCharge" id="medicalCharge" placeholder="상세 진료 내용" maxlength="33">
				</div>
				<div class="form-group">
					<label>진료 소개</label>
					<textarea class="form-control" name="medicalIntro" id="medicalIntro" style="resize:none" placeholder="소개 내용"></textarea>
				</div>
				
				<!-- 파일 업로드 폼입니다 -->
					<div class="reply-content">
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지업로드</label> 
								<input type="file" name="file" id="file">
							</div>
							<div class="doctorRegistByte right">
								<span id="doctorContentByte">0</span><span>/ 1000</span>
							</div>
						</div>
					</div>
					<br><br>
				<!-- 파일 업로드 폼 끝 -->
				<div class="buttons">
					<button type="button" id="doctorRegistBtn" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/adminPageMain'">취소</button>
				</div>
			</form>	
				
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>



<script>
	$(function(){
		let departFlag = false;
		let imgFlag = false;
		
		$('#medicalCharge').keyup(function() {
			if($(this).val().length > 33) {
				alert('상세 진료는 최대 33자 까지 가능합니다.');
				$(this).focus();
				return;
			}
		});
		
		$('#doctorRegistBtn').click(function(){
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#medicalIntro').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			// 이름 체크
			if($('#doctorName').val().trim() === '') {
				$('#doctorName').val('');
				$('#doctorName').focus();
				alert('이름은 필수입니다.');
				return;
			} else {
				if($('#doctorName').val().length <= 1) {
					$('#doctorName').focus();
					alert('이름을 정확히 입력해주세요.');
					return;
				}
				
				for(let i=0; i<$('#doctorName').val().length; i++) {
					let nch = $('#doctorName').val().substring(i, i+1);
					if(nch.match(/[0-9]|[a-z]|[A-Z]/)) {
						$('#doctorName').focus();
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/([^가-힣\x20])/i)) {
						$('#doctorName').focus();
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/[\s]/)) {
						$('#doctorName').focus();
						alert('글자 사이 공백이 있습니다.');
						return;
					}
				}
			}
			
			if($('#medicalCharge').val() === ''){
				alert('상세 진료 내용을 입력해주세요.')
				$('#medicalCharge').focus();
				return;
			}
			if($('#medicalIntro').val() === ''){
				alert('진료 소개 내용을 입력해주세요.')
				$('#medicalIntro').focus();
				return;
			}
			if(contentByteLength > 1000) {
				alert('진료 소개는 1000 Byte를 넘을 수 없습니다.');
				$('#medicalIntro').focus();
				return;
			}
			
			if(!departFlag) {
				alert('과 선택은 필수');
				return;
			}
			if(!imgFlag) {
				alert('이미지 선택은 필수');
				imgFlag = false;
				return;
			}
			let file = $('#file').val();
			
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp'){
				alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
				$('#file').val('');
				imgFlag = false;
				return;
			}
					
			$('#insertDoctor').submit();
		});
		
		
		$('#medicalDepartment').change(function() {
			departFlag = true;
		});
		
		$('#file').click(function(){
			imgFlag = true;
		});
		
		$('#medicalIntro').keyup(function() {
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#medicalIntro').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			$('#doctorContentByte').text(contentByteLength);
		});
		
		
	
	});
	




</script>