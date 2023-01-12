<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
				<input type="hidden" name="file" value="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
				<input type="hidden" name="content" value="${article.content}">
			</form>
			<div class="news-detail-article-box clearfix">
			
				<div class="news-detail-content-group clearfix">
					<input type="hidden" name="bno" value="${article.bno}">
					<h2 class="content-title" id="newsDetailTitle">${article.title}</h2>
					<p>${article.adminId}</p>
					<p>${article.regDate}</p>
					<hr>
				</div>
				
				<div class="news-detail-article clearfix">
				
					<div class="news-detail-imgBox">
						<img class="news-detail-newsImg" alt="newsImg" src="${pageContext.request.contextPath}/news/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}">
					</div>
					
					<div class="news-detail-articleBox clearfix">
						<h4 class="newsDetailContent">${article.content}</h4>
					</div>
				</div>
				
				<hr>
				
				<div class="news-group clearfix">
					<div class="newsDetailBtnBox">
						<c:if test="${admin!=null}">
							<button type="button" id="newsModifyBtn" class="btn btn-primary news-modify-btn">수정</button>
						</c:if>	
							<button type="button" class="btn btn-dark news-list-btn">목록</button>
						<c:if test="${admin!=null}">	
							<button type="button" class="btn btn-primary news-delete-btn">삭제</button>
						</c:if>
							<button type="button" class="btn btn-primary" id="bigLook">크게 보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

	<div class="modal fade" id="newsDetailModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content container">
				<div class="modal-body row" style="margin-top:200px;">
					
				</div>
			</div>
		</div>
	</div>

<script>
	
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
	
	$('#bigLook').click(function(e) { 
		console.log('click');
		const bno = ${article.bno};
		
		$.getJSON(
			'${pageContext.request.contextPath}/news/getDetail/' + bno,		
			function(article) {
				const modalContent = `<div class="news-detail-content-group clearfix">
										<input type="hidden" name="bno" value=" ` + article.bno + `">
										<h2 class="content-title" id="modalTitle">` + article.title + `</h2>
										<p>` + article.adminId + `</p>
										<p>` + article.regDate + `</p>
										<hr>
									  </div>
									  <div class="news-modal-article clearfix">
										<div class="news-modal-imgBox">
											<img class="news-modal-newsImg" alt="newsImg" src="` + {pageContext.request.contextPath} + `/news/display?fileLoca=` + article.fileLoca + `&fileName=` + article.fileName + `">
										</div>
										<div class="news-modal-articleBox clearfix">
											<h4 class="modalContent">` + article.content + `</h4>
										</div>
									</div>`;
				$('.modal-body').html(modalContent);
				
			}		
					
		); // end getJSON
		$('#newsDetailModal').modal('show');
	});
	
</script>