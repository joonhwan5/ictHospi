<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>관리자 게시판</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/admin/adminPageMain">의료진 관리<span class="sr-only">(current)</span></a></li>
				
			</ul>
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">의료진 신규 등록</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			
				
				<div class="form-group">
					<label>의사 이름</label> <input class="form-control" name="doctorName" id="doctorName">
				</div>
				<div class="form-group">
					<label>진료 과목</label> <input class="form-control" name="medicalDepartment" id="medicalDepartment">
				</div>
				<div class="form-group">
					<label>상세 진료</label> <input class="form-control" name="medicalCharge" id="medicalCharge">
				</div>
				<div class="form-group">
					<label>진료 소개</label> <input class="form-control" name="medicalIntro" id="medicalIntro">
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
				<!-- 파일 업로드 폼 끝 -->
				
				<button type="button" id="registBtn" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/adminPageMain'">취소</button>
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>



<script>
	
	$(function(){
		
		$('#registBtn').click(function(){
			regist();
		});//등록하기 버튼 끝
		
		
		function regist() {
			let file = $('#file').val();
			console.log(file);
			
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			console.log(file);
			
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp'){
				alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
				$('#file').val('');
				return;
			} 
				
		const formData = new FormData();
		const data = $('#file');
		
		console.log('폼 데이터: ' + formData);
		console.log('data: ' + data);
		console.log(data[0]);
		console.log(data[0].files);
		
		formData.append('file', data[0].files[0]);
		
		const doctorName = $('#doctorName').val();
		const medicalDepartment = $('#medicalDepartment').val();
		const medicalCharge = $('#medicalCharge').val();
		const medicalIntro = $('#medicalIntro').val();
		
		formData.append('doctorName', doctorName);
		formData.append('medicalDepartment', medicalDepartment);
		formData.append('medicalCharge', medicalCharge);
		formData.append('medicalIntro', medicalIntro);
		
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/registDoctor',
			type: 'post',
			data: formData,
			contentType: false,
			processData: false,
			success: function(result){
				alert('의사 등록이 완료되었습니다!');
				location.href='${pageContext.request.contextPath}/admin/adminPageMain';
			},
			error: function(request, status, error) {
				alert('업로드에 실패했습니다. 다시 시도해주세요.')
			}
		});//end ajax
			
			
		}//end function
		
		
		
		
		
		
		
		
		
		
	});




</script>