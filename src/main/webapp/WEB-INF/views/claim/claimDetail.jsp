<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<section>
	<div class="container-fluid">
		<div class="row">
		
			<%@ include file="../include/noticeSide.jsp" %>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">고객의 소리</h1>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="titlebox">
					<p>상세보기</p>
				</div>
				<form action="<c:url value='/claim/claimModify' />" method="post" name="mainForm">
					<div>
						<label>DATE</label>
						<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
					</div>
					<div class="form-group">
						<label>번호</label>
						<input class="form-control" name="bno" value="${article.bno}" readonly>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="userId" value="${article.userId}" readonly>
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="title" value="${article.title}" readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name="content" readonly>${article.content }</textarea>
					</div>
					<button type="submit" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
					<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/claim/claimMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				</form>
				<hr>
				<form class="reply-wrap">
					<!--form-control은 부트스트랩의 클래스입니다-->
					<div class="reply-content">
						<textarea style="resize: none;" class="form-control" rows="3" id="reply"></textarea>
						<div class="reply-group">
							<div class="reply-input">
								<!-- <input type="text" class="form-control" id="replyId" placeholder="이름"> -->
								<input type="password" class="form-control" id="replyPw" placeholder="비밀번호">
							</div>
							<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
						</div>
					</div>
				</form>
				<!--여기에 접근 반복-->
				<div id="replyList">
					<!-- 자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현. 
                        <div class='reply-wrap'>
                            <div class='reply-image'>
                                <img src="<c:url value='/img/profile.png' />">
                            </div>
                            <div class='reply-content'>
                                <div class='reply-group'>
                                    <strong class='left'>honggildong</strong> 
                                    <small class='left'>2019/12/10</small>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                                </div>
                                <p class='clearfix'>여기는 댓글영역</p>
                            </div>
                        </div>
                        -->
				</div>
				<button type="button" class="form-control" id="moreList">더보기(페이징)</button>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
</script>


