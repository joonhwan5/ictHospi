<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<%@include file="../include/adminSide.jsp"%>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">의료진 신규 등록</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			
			<form action="${pageContext.request.contextPath}/admin/registDoctor" method="post" enctype="multipart/form-data" id="insertDoctor">	
				<div class="form-group">
					<label>의사 이름</label> <input class="form-control" name="doctorName" id="doctorName" placeholder="의사 이름">
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
					<label>상세 진료</label> <input class="form-control" name="medicalCharge" id="medicalCharge" placeholder="상세 진료 내용">
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
		
		$('#doctorRegistBtn').click(function(){
			if($('#doctorName').val().trim() === ''){
				alert('이름은 필수 항목입니다.');
				$('#doctorName').focus();
				return;
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
	
	
	});
	/*의사 이름 형식 검사 스크립트*/




</script>