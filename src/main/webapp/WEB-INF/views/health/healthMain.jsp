<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
  
<style>
	.search-main-box {
		margin-bottom: 10px;
	}
</style>

<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">건강 컬럼</h1>
			<div class="health-head-row clearfix">
				<div class="health-left"></div>
				<div class="health-right">
					<a href="${pageContext.request.contextPath}/health/healthMain?order=desc">최신순</a>
					<a href="${pageContext.request.contextPath}/health/healthMain?order=asc">오래된순</a>
				</div>
			</div>
			<hr>
			<div class="row placeholders search-main-box">
				<div class="col-xs-6 col-sm-3 placeholder search-main-box">
					<form id="select-form search-main-box">
						<div class="search-wrap board-search-group clearfix search-main-box">
							<button type="submit" id="search-btn" class="btn btn-info search-btn board-search-btn">검색</button>
							<input type="text" name="keyword" class="form-control search-input board-search-input" value="${pc.paging.keyword}" placeholder="검색어">
							<select name="condition" class="form-control search-select board-search-select">
								<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
								<option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
								<option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
								<option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
							</select>
						<input type="hidden" name="order" value="${param.order == null ? 'desc' : param.order}">
						</div>
					</form>
				</div>
			</div>
			<c:forEach var="vo" items="${healthList}">
				<hr>
				<div class="health-group clearfix">
					<div class="bnoBox">
						<input class="bnoHidden" type="hidden" value="${vo.bno}">
					</div>
					<div class="imgBox">
						<img class="healthImg" alt="healthImg" src="${pageContext.request.contextPath}/health/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileName}">
					</div>
					<div class="health-article">
						<div class="article-content">
							<h2>
								<a href="${pageContext.request.contextPath}/health/healthDetail/${vo.bno}${pc.makeURI(pc.paging.pageNum)}">${vo.title}</a>
							</h2>
							<h4>${vo.content}</h4>
						</div>
					</div>
				</div>
			</c:forEach>
			<form action="<c:url value='/health/healthMain' />" name="pageForm">
				<div class="text-center">
					<hr>
					<ul id="pagination" class="pagination pagination-sm">
						<c:if test="${pc.prev}">
							<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : ''}">
								<a href="#" data-pagenum="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pc.next}">
							<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
				<input type="hidden" name="cpp" value="${pc.paging.cpp}">
				<input type="hidden" name="condition" value="${pc.paging.condition}">
				<input type="hidden" name="keyword" value="${pc.paging.keyword}">
				<input type="hidden" name="order" value="${param.order == null ? 'desc' : param.order}">
			</form>
			<div class="news-group clearfix">
				<div class="healthBtnBox">
					<c:if test="${admin!=null}">
						<button type="button" class="btn btn-info health-write-btn" onclick="location.href='${pageContext.request.contextPath}/health/healthRegist'">글쓰기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

<script>

	$(function() {

		const msg = '${msg}';
		if (msg !== '') {
			alert(msg);
		}

		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			const value = $(this).data('pagenum');
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();

		});

	});
</script>