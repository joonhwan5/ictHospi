<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 소식</h1>
			<div class="news-head-row clearfix">
				<div class="news-left"></div>
			</div>
			<form action="${pageContext.request.contextPath}/news/newsModify" method="POST" id="newsModifyFrom">
				<input type="hidden" name="bno" value="${article.bno}">
				<input type="hidden" name="title" value="${article.title}">
				<input type="hidden" name="adminId" value="${article.adminId}">
				<input type="hidden" name="regDate" value="${article.regDate}">
				<input type="hidden" name="fileLoca" value="${article.fileLoca}">
				<input type="hidden" name="fileName" value="${article.fileName}">
				<input type="hidden" name="content" value="${article.content}">
			</form>
			<div class="news-detail-article-box board-main clearfix">
			
				<div class="news-detail-content-group clearfix">
					<input type="hidden" name="bno" value="${article.bno}">
					<h2 class="content-title" id="newsDetailTitle">${article.title}</h2>
					<p>${admin}</p>
					<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
					<hr>
				</div>
				
				<div class="news-detail-article clearfix">
				
					<div class="news-detail-imgBox">
						<img class="news-detail-newsImg" alt="newsImg" src="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
					</div>
					
					<div class="news-detail-articleBox clearfix">
						<textarea class="form-control detailContent" style="background-color: white; cursor: default;" name="content" readonly>${article.content}</textarea>
					</div>
					<div class="newsSizeSet right clearfix">
						<button type="button" class="newsPlusBtn btn btn-primary">+</button>
						<button type="button" class="newsMinusBtn btn btn-primary">-</button>
						<button type="button" class="btn btn-primary" id="newsBigLook">한눈에 보기</button>
					</div>
				</div>
				
				<hr style="margin-top: 10px;">
				
				<div class="clearfix">
					<div class="newsContentListBox clearfix">
						<p class="newsBackContent">
							▲ 이전글: <c:if test="${articlePrev == null}">
										이전 게시글이 없습니다.
									</c:if>
									<c:if test="${articlePrev != null }">
										<a href="${pageContext.request.contextPath}/news/newsDetail/${articlePrev.bno}?order=${order}">${articlePrev.title}</a>
									</c:if>
						</p>
						<hr>
						<p class="newsNextContent">
							▼ 다음글: 
							<c:if test="${articleNext == null }">
								다음 게시글이 없습니다.
							</c:if>
							<c:if test="${articleNext != null }">
								<a href="${pageContext.request.contextPath}/news/newsDetail/${articleNext.bno}?order=${order}">${articleNext.title}</a>
							</c:if>
						</p>
						<hr>
					</div>
				
					<div class="newsDetailBtnBox">
						<c:if test="${admin!=null}">
							<button type="button" id="newsModifyBtn" class="btn btn-primary news-modify-btn">수정</button>
						</c:if>	
							<button type="button" class="btn btn-dark news-list-btn">목록</button>
						<c:if test="${admin!=null}">	
							<button type="button" class="btn btn-primary news-delete-btn right">삭제</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp" %>

	<div class="modal fade" id="newsDetailModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="newsModalContent modal-content container">
				<div class="newsModalBody modal-body row">
					
				</div>
			</div>
		</div>
	</div>

<script>
	let textHeight= $('.detailContent').prop('scrollHeight');
	$('.detailContent').css('height', textHeight);
	
	$('.news-list-btn').click(function() {
		location.href = "${pageContext.request.contextPath}/news/newsMain?order=" + '${param.order}';	
	});

	$('#newsModifyBtn').click(function() {
		$('#newsModifyFrom').submit();
	});

	$('.news-delete-btn').click(function() {
		if(confirm('정말 삭제하시겠습니까?')) {
			$('#newsModifyFrom').attr('action', '${pageContext.request.contextPath}/news/newsDelete/${article.bno}');
			$('#newsModifyFrom').submit();
		}
	});

	$('#newsBigLook').click(function(e) { 
		const bno = ${article.bno};
		
		$.getJSON(
			'${pageContext.request.contextPath}/news/getDetail/' + bno,		
			function(article) {
				const newsModalContent = `<div class="news-modal-content-group clearfix">
										<input type="hidden" name="bno" value=" ` + article.bno + `">
										<h2 class="news-modal-title" id="modalTitle">` + article.title + `</h2>
										<p>` + article.adminId + `</p>
										<p><fmt:formatDate value="${article.regDate}" pattern="yyyy년 MM월 dd일" /></p>
										<hr>
									  </div>
									  <div class="news-modal-article clearfix">
										<div class="news-modal-imgBox">
										 <img class="news-modal-newsImg" alt="newsImg" src="<c:url value='/news/display?fileLoca=` + article.fileLoca + `&fileName=` + article.fileName + `' />">
										</div>
										<div class="news-modal-articleBox clearfix">
											<h4 class="newsModalContent">` + article.content + `</h4>
										</div>
									</div>
									<button type="button" class="btn btn-primary newsModalClose" data-dismiss="modal">닫기</button>`;
				$('.newsModalBody').html(newsModalContent);
				
			}		
					
		); // end getJSON
		$('#newsDetailModal').modal('show');
	});
	
	$('.newsPlusBtn').click(function() {
		let fz = $('.detailContent').css('font-size');
		fz = fz.substring(0, fz.indexOf('p'));
		$('.detailContent').css('font-size', Number(fz) + 5 + 'px');
	});
	
	$('.newsMinusBtn').click(function() {
		let fz = $('.detailContent').css('font-size');
		fz = fz.substring(0, fz.indexOf('p'));
		$('.detailContent').css('font-size', Number(fz) - 5 + 'px');
	});
	
</script>