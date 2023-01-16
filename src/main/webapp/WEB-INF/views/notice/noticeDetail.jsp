<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.notice-delete-btn {
		float: right;
	}
	
	.notice-group {
		padding: 10px;
		display: block;
	}
	
	.noticeContentListBox {
		width: 100%;
		text-align: left;
	}

</style>

<div class="container-fluid">
	<div class="row">
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">공지사항</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>상세보기</p>
			</div>

			<form action="<c:url value='/notice/noticeModify' />" method="post" name="mainForm">
				<div>
					<label>등록일</label>
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
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
				</div>
				<div class="notice-group clearfix">
					<div class="noticeContentListBox clearfix">
						<hr>
						<p class="noticeBackContent">
							▲ 이전글: <c:if test="${articlePrev == null}">
										이전 게시글이 없습니다.
									</c:if>
									<c:if test="${articlePrev != null}">
										<a href="${pageContext.request.contextPath}/notice/noticeDetail/${articlePrev.bno}">${articlePrev.title}</a>
									</c:if>
						</p>
						<hr>
						<p class="noticeNextContent">
							▼ 다음글: <c:if test="${articleNext == null}">
										다음 게시글이 없습니다.
									</c:if>
									<c:if test="${articleNext != null}">
										<a href="${pageContext.request.contextPath}/notice/noticeDetail/${articleNext.bno}">${articleNext.title}</a>
									</c:if>
						</p>
						<hr>
					</div>
				</div>
				<c:if test="${admin!=null}">
					<button type="submit" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
					<button type="button" id="delBtn" class="btn btn-info notice-delete-btn">삭제</button>
				</c:if>
				<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/notice/noticeMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	$(function() {
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {
			if(confirm('정말 삭제하시것어여?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/notice/noticeDelete');
				$('form[name=mainForm]').submit();
			}
		});
	});
	
</script>



