<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 board-main main">
			<h1>건강 컬럼</h1>
			<hr>
			
			<form action="${pageContext.request.contextPath}/health/healthModify" method="POST" id="healthModifyFrom">
				<input type="hidden" name="bno" value="${article.bno}">
				<input type="hidden" name="title" value="${article.title}">
				<input type="hidden" name="adminId" value="${article.adminId}">
				<input type="hidden" name="regDate" value="${article.regDate}">
				<input type="hidden" name="fileLoca" value="${article.fileLoca}">
				<input type="hidden" name="fileName" value="${article.fileName}">
				<input type="hidden" name="content" value="${article.content}">
				<input type="hidden" name="pageNum" value="${p.pageNum}">
				<input type="hidden" name="keyword" value="${p.keyword}">
				<input type="hidden" name="condition" value="${p.condition}">
				<input type="hidden" name="order" value="${p.order}">
			</form>
			
			<div class="health-detail-article-box clearfix">

				<div class="health-detail-content-group clearfix">
					<input type="hidden" name="bno" value="${article.bno}">
					<h2 class="content-title" id="healthDetailTitle">${article.title}</h2>
					<p>${admin}</p>
					<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
					<hr style="margin-top: 30px;">
				</div>

				<div class="health-detail-article clearfix">

					<div class="health-detail-imgBox">
						<img class="health-detail-healthImg" alt="healthImg"
							src="${pageContext.request.contextPath}/health/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
					</div>

					<div class="health-detail-articleBox clearfix">
						<textarea class="form-control detailContent healthDetailContent" style="background-color: white; cursor: default;" name="content" readonly>${article.content}</textarea>
					</div>
					<!--div class="healthSizeSet clearfix">
						<button type="button" class="healthPlusBtn btn btn-primary">+</button>
						<button type="button" class="healthMinusBtn btn btn-primary">-</button>
						<button type="button" class="btn btn-primary" id="healthBigLook">한눈에 보기</button>
					</div>-->
				</div>

				<hr style="margin-top: 10px;">

				<div class="clearfix">
					<div class="healthContentListBox clearfix">
						<p class="healthBackContent">
							▲ 이전글:
							<c:if test="${articlePrev == null }">
										이전 게시글이 없습니다.
							</c:if>
							<c:if test="${articlePrev != null }">
								<a href="${pageContext.request.contextPath}/health/healthDetail/${articlePrev.bno}?order=${order}">${articlePrev.title}</a>
							</c:if>
						</p>
						<hr>
						<p class="healthNextContent">
							▼ 다음글:
							<c:if test="${articleNext == null }">
										다음 게시글이 없습니다.
							</c:if>
							<c:if test="${articleNext != null }">
								<a href="${pageContext.request.contextPath}/health/healthDetail/${articleNext.bno}?order=${order}">${articleNext.title}</a>
							</c:if>
						</p>
						<hr>
					</div>

					<div class="healthBtnBox">
						<c:if test="${admin!=null}">
							<button type="button" id="healthModifyBtn" class="btn btn-primary health-modify-btn">수정</button>
						</c:if>
						<button type="button" class="btn btn-dark health-list-btn">목록</button>
						<c:if test="${admin!=null}">
							<button type="button" class="btn btn-primary health-delete-btn">삭제</button>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<div class="modal fade" id="healthDetailModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="healthModalContent modal-content container">
			<div class="healthModalBody modal-body row"></div>
		</div>
	</div>
</div>

<script>
	
	let textHeight= $('.detailContent').prop('scrollHeight');
	$('.detailContent').css('height', (+textHeight+5) + 'px');
	
	$('.health-list-btn').click(function() {
		location.href = "${pageContext.request.contextPath}/health/healthMain?pageNum=${p.pageNum}&keyword=${p.keyword}&condition=${p.condition}&order=${p.order}";
	});

	$('#healthModifyBtn').click(function() {
		$('#healthModifyFrom').submit();
	});

	$('.health-delete-btn').click(function() {
		if (confirm('정말 삭제하시겠습니까?')) {
			$('#healthModifyFrom').attr('action','${pageContext.request.contextPath}/health/healthDelete/${article.bno}');
			$('#healthModifyFrom').submit();
		}
	});
	
	$(document).ready(function() {
		
		let msg = '${msg}';
		if(msg !== '') {
			alert(msg);
		}
		
		let bno = 0;
		if('${article.bno}' ===  '') {
			alert('잘못된 접근입니다.');
			location.href = history.back();
			return;
		} else {
			bno = '${article.bno}';
		}
		
/*		$('#healthBigLook').click(function(e) { 
			
			$.getJSON(
				'${pageContext.request.contextPath}/health/getDetail/' + bno,		
				function(article) {
					const healthModalContent = `<div class="health-modal-content-group clearfix">
											<input type="hidden" name="bno" value=" ` + article.bno + `">
											<h2 class="health-modal-title" id="modalTitle">` + article.title + `</h2>
											<p>` + article.adminId + `</p>
											<p><fmt:formatDate value="${article.regDate}" pattern="yyyy년 MM월 dd일" /></p>
											<hr>
										  </div>
										  <div class="health-modal-article clearfix">
											<div class="health-modal-imgBox">
											 <img class="health-modal-healthImg" alt="healthImg" src="<c:url value='/health/display?fileLoca=` + article.fileLoca + `&fileName=` + article.fileName + `' />">
											</div>
											<div class="health-modal-articleBox clearfix">
												<textarea class="healthModalContent">` + article.content + `</textarea>
											</div>
										</div>
										<button type="button" class="btn btn-primary healthModalClose" data-dismiss="modal">닫기</button>`;
					$('.healthModalBody').html(healthModalContent);
					
				}		
						
			); // end getJSON
			$('#healthDetailModal').modal('show');
		}); */

	});
	

	
/*	$('.healthPlusBtn').click(function() {
		let fz = $('.detailContent').css('font-size');
		fz = fz.substring(0, fz.indexOf('p'));
		$('.detailContent').css('font-size', Number(fz) + 5 + 'px');
	});
	
	$('.healthMinusBtn').click(function() {
		let fz = $('.detailContent').css('font-size');
		fz = fz.substring(0, fz.indexOf('p'));
		$('.detailContent').css('font-size', Number(fz) - 5 + 'px');
	}); */
</script>