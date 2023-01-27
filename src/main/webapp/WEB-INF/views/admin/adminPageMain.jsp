
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
.doctorDiv {
	width: 300px;
	height: 400px;
	margin: 20px 35px 60px 20px;
	float: left;
}

.doctor-img-box {
	height: 90%;
	margin-bottom: 20px;
}

	.doctor-img-box > img {
		width: 300px;
		height: 360px;
		border-radius: 30px;
	}
		
		
	.doctorSelect > span {
		font-size: 2rem;
		margin-right: 10px;
		display: block;
	}
	
	.doctorSelect > input {
		width: 18px;
		height: 18px;
		display: block;
	}

	
</style>


<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>관리자 게시판</h2></li>
				<li class="active"><a href="#">의료진 관리<span class="sr-only">(current)</span></a></li>

			</ul>
		</div>
		<div
			class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main clearfix">
			<h1 class="page-header">의료진 관리</h1>

			<c:if test="${doctorList.size()==0}">
				<div id="getListNone">
					<h2>의료진 정보가 없습니다.</h2>
				</div>
			</c:if>

			<c:forEach var="i" items="${doctorList}">
				<div class="doctorDiv">
					<div class="doctor-img-box">
						<img alt="" src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
					</div>
					<div class="doctorSelect clearfix">
						<span>&nbsp;의료진 : ${i.doctorName}</span>
						<input type="checkbox" name="${i.doctorNo}">
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="clearfix">
			<button class="cancelBtn btn btn-primary">취소</button>
			<button class="deleteBtn1 btn btn-secondary">삭제하기</button> 
			<button class="deleteBtn2 btn btn-secondary">삭제하기</button> 
			<button class="modifyBtn btn btn-secondary">수정하기</button> 
			<button class="registBtn btn btn-primary">등록하기</button>
		</div>

	</div>
</div>
<%@include file="../include/footer.jsp"%>


<script>
	
	let list = new Array();
	$('input[type=checkbox]').css('display', 'none');
	$('.deleteBtn2').css('display', 'none');
	$('.cancelBtn').css('display', 'none');
	$('.registBtn').click(function(){
		location.href = "${pageContext.request.contextPath}/admin/adminPageRegist";
	});
	
	$('input:checkbox').change(function(e) {
		for(let i = 0; i < list.length; i++) {
			if(list[i] == e.target.getAttribute('name')) {
				list.splice(i, 1);
				return;
			}
		}
		list.push(e.target.getAttribute('name'));
	});
	
	//삭제하기 버튼
	$('.deleteBtn1').click(function(e) {
		$('input[type=checkbox]').css('display', 'block');
		$('.deleteBtn2').css('display', 'block');
		$('.cancelBtn').css('display', 'block');
		$('.registBtn').css('display', 'none');
		$('.modifyBtn').css('display', 'none');
		$(this).css('display', 'none');
	});
	
	//취소버튼
	$('.cancelBtn').click(function(e) {
		$('input[type=checkbox]').css('display', 'none');
		$('.deleteBtn1').css('display', 'block');
		$('.deleteBtn2').css('display', 'none');
		$('.registBtn').css('display', 'block');
		$('.modifyBtn').css('display', 'block');
		$(this).css('display', 'none');
		
		$('input[type=checkbox]').attr('checked', false);
	});
	
	//수정하기 버튼
	$('.modifyBtn').click(function() {
		location.href = '${pageContext.request.contextPath}/admin/adminPageModify';
	});
	
	
	$('.deleteBtn2').click(function(e) {
		let cnt = list.length;
		
		if(cnt == 0){
			alert('선택된 항목이 없습니다.');
		}
		else{			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/deleteDoctor',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					'listMap': list
				}),
				success: function(result){
					if(result=='success'){
						alert('삭제 처리가 정상적으로 진행되었습니다.');
						location.href = '${pageContext.request.contextPath}/admin/adminPageMain';
					}
				},
				error: function(){
					alert('삭제에 실패했습니다. 다시 한번 시도해주세요.');
				}
			});
		}
		
	});//삭제 기능 끝

</script>