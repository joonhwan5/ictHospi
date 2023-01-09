<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
	
		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">건강 컬럼</h1>
			<div class="health-head-row clearfix">
				<div class="health-left"></div>
			</div>
			<form action="${pageContext.request.contextPath}/health/healthModify" method="POST" id="healthModifyFrom">
				<input type="hidden" name="bno" value="${article.bno}">
				<input type="hidden" name="title" value="${article.title}">
				<input type="hidden" name="adminId" value="${article.adminId}">
				<input type="hidden" name="regDate" value="${article.regDate}">
				<input type="hidden" name="file" value="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
				<input type="hidden" name="content" value="${article.content}">
			</form>
			<div class="health-detail-article-box clearfix">
			
				<div class="health-detail-content-group clearfix">
					<input type="hidden" name="bno" value="${article.bno}">
					<h2 class="content-title" id="healthDetailTitle">${article.title}</h2>
					<p>${article.adminId}</p>
					<p>${article.regDate}</p>
					<hr>
				</div>
				
				<div class="health-detail-article clearfix">
				
					<div class="health-detail-imgBox">
						<img class="health-detail-healthImg" alt="healthImg" src="${pageContext.request.contextPath}/health/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
					</div>
					
					<div class="health-detail-articleBox clearfix">
						<h4 class="healthContent">${article.content}</h4>
					</div>
				</div>
				
				<hr>
				
				<div class="health-group clearfix">
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

<%@include file="../include/footer.jsp" %>

<script>
	$('.health-list-btn')
			.click(
					function() {
						location.href = "${pageContext.request.contextPath}/health/healthMain?order=" + '${param.order}';
					});

	$('#healthModifyBtn').click(function() {
		$('#healthModifyFrom').submit();
	});

	$('.health-delete-btn')
			.click(
					function() {
						if (confirm('정말 삭제하시겠습니까?')) {
							$('#healthModifyFrom')
									.attr('action',
											'${pageContext.request.contextPath}/health/healthDelete/${article.bno}');
							$('#healthModifyFrom').submit();

						}
					});
</script>