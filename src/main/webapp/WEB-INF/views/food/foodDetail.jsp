<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 식단</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			
			<form action="<c:url value='/food/foodModify' />" method="post" name="mainForm" enctype="multipart/form-data">
				<div>
					<label>등록시간</label>
					<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="admin" value="${article.adminId}" readonly>
					<input type="hidden" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" value="${article.title}" readonly>
				</div>
				<div class="form-group">
					<label>식단</label><br>
					<a href="${pageContext.request.contextPath}/food/download?fileLoca=${article.fileLoca}&fileName=${article.fileName}&fileRealName=${article.fileRealName}"><span class="glyphicon glyphicon-floppy-disk"></span> 파일 다운로드</a>
					<br><br>
					<img class="img-responsive foodBigLook" alt="foodImg" src="${pageContext.request.contextPath}/food/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}&fileRealName=${article.fileRealName}">
					<input type="hidden" name="fileLoca" value="${article.fileLoca}">
					<input type="hidden" name="fileName" value="${article.fileName}">
					<input type="hidden" name="fileRealName" value="${article.fileRealName}">
				</div>
					
				<div class="foodSizeSet clearfix">
					<button type="button" class="foodMinusBtn btn btn-primary right">-</button>
					<button type="button" class="foodPlusBtn btn btn-primary right">+</button>
				</div>
				<div class="food-group clearfix">
					<div class="foodContentListBox clearfix">
						<hr>
						<p class="foodBackContent">
							▲ 이전글: <c:if test="${articlePrev == null}">
										이전 게시글이 없습니다.
									</c:if>
									<c:if test="${articlePrev != null}">
										<a href="${pageContext.request.contextPath}/food/foodDetail/${articlePrev.bno}">${articlePrev.title}</a>
									</c:if>
						</p>
						<hr>
						<p class="foodNextContent">
							▼ 다음글: <c:if test="${articleNext == null}">
										다음 게시글이 없습니다.
									</c:if>
									<c:if test="${articleNext != null}">
										<a href="${pageContext.request.contextPath}/food/foodDetail/${articleNext.bno}">${articleNext.title}</a>
									</c:if>
						</p>
						<hr>
					</div>
				</div>
				<c:if test="${admin!=null}">
					<button type="submit" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
					<button type="button" id="delBtn" class="btn btn-info right">삭제</button>
				</c:if>
				<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/food/foodMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				<input type="hidden" name="pageNum" value="${param.pageNum}" >
                <input type="hidden" name="cpp" value="${param.cpp}" >
                <input type="hidden" name="condition" value="${param.condition}" >
                <input type="hidden" name="keyword" value="${param.keyword}" >
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

	<div class="modal fade" id="foodDetailModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="foodModalContent modal-content container">
				<div class="foodModalBody modal-body row">
					
				</div>
			</div>
		</div>
	</div>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	$(function() {
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {

			if(confirm('정말 삭제하시겠습니까?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/food/foodDelete/${article.bno}');

				$('form[name=mainForm]').submit();
			}
		});
		
		//한눈에 보기 이벤트 처리
		$('.foodBigLook').click(function() {

			let bno = 0;
			if('${article.bno}' ===  '') {
				alert('잘못된 접근입니다.');
				location.href = history.back();
				return;
			} else {
				bno = '${article.bno}';
			}
			
			$.getJSON(
				'${pageContext.request.contextPath}/food/getDetail/' + bno,
				function(article) {
					const foodModalContent = `<div class="food-modal-content-group clearfix">
												<input type="hidden" name="bno" value="` + article.bno + `">
											  	<h3 class="food-modal-title" id="modalTitle">` + article.title + `</h3>
											  	<hr>
											  </div>
											  <div class="food-modal-article clearfix">
											  	<div class="food-modal-imgBox">
											  	  <img class="food-modal-foodImg" alt="foodImg" src="<c:url value='/food/display?fileLoca=` + article.fileLoca + `&fileName=` + article.fileName + `' />">
											  	</div>
											  </div>
											  <button type="button" class="btn btn-primary foodModalClose" data-dismiss="modal">닫기</button>`;
					$('.foodModalBody').html(foodModalContent);
				}
			); //end getJSON
			$('#foodDetailModal').modal('show');
		});
		
	});
	
	let imgWidth = 50;
	
	$('.foodPlusBtn').click(function(){
		if(imgWidth==100) {
			return;
		}
		imgWidth += 5;
		$('.foodBigLook').css('width', imgWidth+'vw');
	});
	
	$('.foodMinusBtn').click(function(){
		if(imgWidth==5) {
			return;
		}
		imgWidth -= 5;
		$('.foodBigLook').css('width', imgWidth+'vw');
	});
		
</script>



