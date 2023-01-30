<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header" style="border-bottom: none">건강 컬럼</h1>
			<c:if test="${healthList.size()==0}">
				<h2>해당 게시판의 게시글이 없습니다.</h2>
			</c:if>
			<c:if test="${healthList.size()!=0}">
				<form id="select-form" class="clearfix" style="margin-bottom: 0px">
					<div class="search-wrap board-search-group clearfix search-main-box right">
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
					<div class="health-left">
						<a href="${pageContext.request.contextPath}/health/healthMain?order=desc">최신순</a>
						<span>|</span>
						<a href="${pageContext.request.contextPath}/health/healthMain?order=asc">오래된순</a>
					</div>
				</form>
				<hr style="margin-top: 0px;">
				<c:forEach var="vo" items="${healthList}">
				
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
									<a class="healthTitleA" href="${pageContext.request.contextPath}/health/healthDetail/${vo.bno}${pc.makeURI(pc.paging.pageNum)}">${vo.title}</a>
								</h2>
								<div class="healthContentDiv">${vo.content}</div>
							</div>
						</div>
					</div>
				
					<hr style="margin-top: 20px;">
				</c:forEach>
				
				<form action="<c:url value='/health/healthMain' />" name="pageForm">
					<div class="text-center">
						<ul id="pagination" class="pagination pagination-sm">
							<c:if test="${pc.prev}">
								<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
								<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
									href="#" data-pagenum="${num}">${num}</a></li>
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
				
			</c:if>

			<div class="health-group clearfix">
				<div class="healthBtnBox">
					<c:if test="${admin!=null}">
						<button type="button" class="btn btn-info health-write-btn" onclick="location.href='${pageContext.request.contextPath}/health/healthRegist'">글쓰기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

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