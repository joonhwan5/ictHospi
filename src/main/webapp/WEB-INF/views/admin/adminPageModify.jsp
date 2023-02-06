<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<%@include file="../include/adminSide.jsp"%>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main clearfix">
			<h1>의료진 수정</h1>
			<hr>
			<form action="${pageContext.request.contextPath}/admin/modifyDoctor" method="post" enctype="multipart/form-data" id="modifyDoctor">	
				<div class="form-group doctor-div">
					<label>의사 이름</label>
					<select class="form-control" name="doctorName" id="doctorName">
						<option>의사를 선택하세요</option>
						<c:forEach var="cdocName" items="${doctorList}">
							<option>${cdocName.doctorName}</option>
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
						<div class="right">
							<span id="doctorContentByte">0</span><span> / 1000</span>
						</div>
					</div>
				</div>
					<!-- 파일 이름 -->
				<div class="doctorBlind"></div>
					<br><br>
				<!-- 파일 업로드 폼 끝 -->
				<input class="doctorNumber" name="doctorNo" type="hidden">
				<input class="doctorUploadPath" name="uploadPath" type="hidden">
				<input class="doctorFileName" name="fileName" type="hidden">
			</form>	
			<div class="buttons right">
				<button type="button" id="doctorModifyBtn" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/adminPageMain'">취소</button>
			</div>
				
			
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>



<script>

	let imgFlag = false;
	let noneImg = false;
	let msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}
	
	let contentByteLength = 0;
	
	let file = $('.doctorBlind').html();
	$('#file').change(function(){
		$('.doctorBlind').html('');
		file = $(this).val();
		imgFlag = true;
		noneImg = false;
	});
	
	$('#medicalDepartment').val('');

	$('#doctorName').change(function(e){
		
		$('.doctor-div').on('change', 'select', function() {
			console.log('선택');
			let firstContent = $('#medicalIntro').val();
			let firstContentByteLength = 0;
			firstContentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(firstContent);
			$('#doctorContentByte').html(firstContentByteLength + ' ');
		});
		
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
			$('#file').val('');
			
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
		let uploadPath = '';
		let doctorNo = '';
		
		let flag = true;
		
		
		<c:forEach items="${doctorList}" var="item">	
			if($(this).val() == "${item.doctorName}" || flag) {
				medicalDepartment = "${item.medicalDepartment}";
				medicalCharge = "${item.medicalCharge}";
				medicalIntro = "${item.medicalIntro}";
				fileName = "${item.fileName}";
				uploadPath = "${item.uploadPath}";
				doctorNo = "${item.doctorNo}";
				
				flag = false;
			}
		</c:forEach>
		$('#medicalDepartment').val(medicalDepartment);
		$('#medicalCharge').val(medicalCharge);
		$('#medicalIntro').val(medicalIntro);
		
		$('.doctorBlind').html(fileName);
		$('.doctorNumber').val(doctorNo);
		$('.doctorUploadPath').val(uploadPath);
		$('.doctorFileName').val(fileName);
		return;
	});

	$(function(){
		
		$('#medicalIntro').keyup(function() {
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#medicalIntro').val();
			let contentLength = content.length;
			
			contentByteLength = (function(s,b,i,c){
			    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			$('#doctorContentByte').text(contentByteLength);
		});
		
		$('#doctorModifyBtn').click(function(){
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
			if (contentByteLength > 1000) {
				alert('내용은 1000 Byte를 넘을 수 없습니다.');
				$('#medicalIntro').focus();
				return;
			}
			
			if(noneImg) {
				alert('사진을 등록해주세요');
				return;
			}
			if(imgFlag){
				file = file.slice(file.lastIndexOf('.') + 1).toLowerCase();
				if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp'){
					alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
					$('#file').val('');
					noneImg = true;
					imgFlag = false;
					return;
				}
			}
			$('#modifyDoctor').submit();
		});
		
		
	});
	/*의사 이름 형식 검사 스크립트*/




</script>