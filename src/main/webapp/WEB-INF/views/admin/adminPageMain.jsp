
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<%@include file="../include/adminSide.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main clearfix">
			<div class="intro-body1 clearfix">
				<form action="${pageContext.request.contextPath}/admin/deleteDoctor" method="post" id="doctorForm" class="clearfix">
					<h1 class="headTitle">의료진 관리</h1>
					<hr>
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
								<input type="checkbox" name="checkList" value="${i.doctorNo}">
							</div>
						</div>
					</c:forEach>
				</form>
					<div class="right clearfix">
						<button type="button" class="cancelBtn btn btn-primary">취소</button>
						<button type="button" class="deleteBtn1 btn btn-secondary">삭제하기</button> 
						<button type="button" class="deleteBtn2 btn btn-secondary">삭제하기</button> 
						<button type="button" class="modifyBtn btn btn-secondary">수정하기</button> 
						<button type="button" class="registBtn btn btn-primary">등록하기</button>
					</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>


<script>
	
	let msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	//let list = new Array();
	$('input[type=checkbox]').css('display', 'none');
	$('.deleteBtn2').css('display', 'none');
	$('.cancelBtn').css('display', 'none');
	$('.registBtn').click(function(){
		location.href = "${pageContext.request.contextPath}/admin/adminPageRegist";
	});
	
	
	//삭제하기 버튼 1
	$('.deleteBtn1').click(function(e) {
		$('input[type=checkbox]').css('display', 'block');
		$('.deleteBtn2').css('display', 'block');
		$('.cancelBtn').css('display', 'block');
		$('.registBtn').css('display', 'none');
		$('.modifyBtn').css('display', 'none');
		$(this).css('display', 'none');
	});
	
	//삭제하기 버튼 2
	$('.deleteBtn2').click(function(){
		$('#doctorForm').submit();
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
			
	

</script>