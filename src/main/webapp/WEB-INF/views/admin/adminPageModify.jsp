<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<%@include file="../include/adminSide.jsp"%>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">의료진 수정</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			
			<form action="${pageContext.request.contextPath}/admin/modifyDoctor" method="post" enctype="multipart/form-data" id="modifyDoctor">	
				<div class="form-group">
					<label>의사 이름</label>
					<select class="form-control" name="doctorName" id="doctorName">
						<option>의사를 선택하세요</option>
						<c:forEach var="cdocName" items="${doctorList}">
							<option class="${cdocName.fileName}">${cdocName.doctorName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>진료 과목</label> 
					<select class="form-control" name="medicalDepartment" id="medicalDepartment" disabled>
						<option>내과</option>
						<option>외과</option>
						<option>피부과</option>
					</select>
				</div>
				<div class="form-group">
					<label>상세 진료</label> <input class="form-control" name="medicalCharge" id="medicalCharge" disabled>
				</div>
				<div class="form-group">
					<label>진료 소개</label>
					<textarea class="form-control" name="medicalIntro" id="medicalIntro" style="resize:none" disabled></textarea>
				</div>
				
				<!-- 파일 업로드 폼입니다 -->
					<div class="reply-content">
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지업로드</label> 
								<input type="file" name="file" id="file" disabled>
							</div>
						</div>
					</div>
					<!-- 파일 이름 -->
			<div class="doctorBlind" style="background: white; position: absolute; left: 104px; top: 360px; z-index: 50000;"></div>
					<br><br>
				<!-- 파일 업로드 폼 끝 -->
				<div class="buttons">
					<button type="button" id="doctorModifyBtn" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/adminPageMain'">취소</button>
				</div>
				<input class="doctorNumber" name="doctorNo" type="hidden">
			</form>	
				
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>



<script>

	const msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}
	$('#medicalDepartment').val('');

	$('#doctorName').change(function(e){
		
		if($('#doctorName').val() === '의사를 선택하세요'){
			$('#medicalDepartment').attr('disabled', true);
			$('#medicalDepartment').val('');
			$('#medicalCharge').val('');
			$('#medicalCharge').attr('disabled', true);
			$('#medicalIntro').val('');
			$('#medicalIntro').attr('disabled', true);
			$('.doctorBlind').html('');
			$('.doctorNumber').val('');
			$('#file').attr('disabled', true);
			return;
		}
		$('#medicalDepartment').attr('disabled', false);
		$('#medicalCharge').attr('disabled', false);
		$('#medicalIntro').attr('disabled', false);
		$('#file').attr('disabled', false);
		
		let medicalDepartment = '';
		let medicalCharge = '';
		let medicalIntro = '';
		let fileName = '';
		let doctorNo = '';
		
		let flag = true;
		
		
		<c:forEach items="${doctorList}" var="item">	
			if($(this).val() == "${item.doctorName}" || flag) {
				medicalDepartment = "${item.medicalDepartment}";
				medicalCharge = "${item.medicalCharge}";
				medicalIntro = "${item.medicalIntro}";
				fileName = "${item.fileName}";
				doctorNo = "${item.doctorNo}";
				
				flag = false;
			}
		</c:forEach>
		$('#medicalDepartment').val(medicalDepartment);
		$('#medicalCharge').val(medicalCharge);
		$('#medicalIntro').val(medicalIntro);
		
		$('.doctorBlind').html(fileName);
		$('.doctorNumber').val(doctorNo);
		return;
	});

	$(function(){
		let flag = false;
		
		$('#doctorModifyBtn').click(function(){
			if($('#doctorName').val() === '의사를 선택하세요'){
				alert('의사를 선택하세요');
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
					
			$('#modifyDoctor').submit();
		});
		
		
		$('#file').change(function() {
			flag = true;
		});
		
		$('#file').click(function(){
			let file = $('#file').val();
			console.log(file);
			
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			console.log(file);
			
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp'){
				alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
				$('#file').val('');
				return;
			}						
		});
	
		
	});
	/*의사 이름 형식 검사 스크립트*/




</script>