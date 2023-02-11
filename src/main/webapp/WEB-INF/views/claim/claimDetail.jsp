<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<section>
	<div class="container-fluid">
		<div class="row">

			<%@ include file="../include/noticeSide.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
				<h1>고객의 소리</h1>
				<hr>
				<form action="<c:url value='/claim/claimModify' />" method="post" name="mainForm">
					<div>
						<label>등록시간</label>
						<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="writer" value="${article.userId}" readonly>
						<input type="hidden" name="bno" value="${article.bno}">
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="title" value="${article.title}" readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea style="resize: none;" class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
					</div>
					<c:if test="${login == article.userId || admin != null}">
						<button type="submit" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
						<button type="button" id="delBtn" class="btn btn-info right">삭제</button>
					</c:if>
					<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/claim/claimMain?pageNum=${p.pageNum}&keyword=${p.keyword}&condition=${p.condition}'">목록</button>
					<input type="hidden" name="pageNum" value="${p.pageNum}" >
                    <input type="hidden" name="condition" value="${p.condition}" >
                    <input type="hidden" name="keyword" value="${p.keyword}" >
				</form>
				
				<c:if test="${admin != null}">
					<form class="reply-wrap">
						<!--form-control은 부트스트랩의 클래스입니다-->
						<div class="reply-content">
							<textarea style="resize: none;" class="form-control" rows="3" id="content" placeholder="댓글을 입력하세요"></textarea>
							<div class="reply-group clearfix">
								<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
							</div>
						</div>
					</form>
				</c:if>
				<!--여기에 접근 반복-->
				<div class="adminAnswer">
					<label>관리자 답변</label>
				</div>
				<div id="replyList">
					
				</div>
				<button type="button" class="form-control" id="moreList">더보기(페이징)</button>
				<div class="claim-group clearfix">
					<div class="claimContentListBox clearfix">
						<hr>
						<p class="claimBackContent">
							▲ 이전글: <c:if test="${articlePrev == null}">
										이전 게시글이 없습니다.
									</c:if>
									<c:if test="${articlePrev != null}">
										<a href="${pageContext.request.contextPath}/claim/claimDetail/${articlePrev.bno}">${articlePrev.title}</a>
									</c:if>
						</p>
						<hr>
						<p class="claimNextContent">
							▼ 다음글: <c:if test="${articleNext == null}">
										다음 게시글이 없습니다.
									</c:if>
									<c:if test="${articleNext != null}">
										<a href="${pageContext.request.contextPath}/claim/claimDetail/${articleNext.bno}">${articleNext.title}</a>
									</c:if>
						</p>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 모달 -->
<div class="modal fade" id="replyModal" role="dialog">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
				<h4 class="modal-title">댓글수정</h4>
			</div>
			<div class="modal-body">
				<!-- 수정폼 id값을 확인하세요-->
				<div class="reply-content">
					<textarea style="resize: none; margin-bottom: 10px;" class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group clearfix">
						<input type="hidden" id="modalRno">
						<button type="button" class="right btn btn-info" id="modalModBtn">수정하기</button>
					</div>
				</div>
				<!-- 수정폼끝 -->
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}
	
	$(function() {
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {
			if(confirm('정말 삭제하시겠습니까?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/claim/claimDelete');
				$('form[name=mainForm]').submit();
			}
		});
		
		let bno = 0;
		if('${article.bno}' ===  '') {
			alert('잘못된 접근입니다.');
			location.href = history.back();
			return;
		} else {
			bno = '${article.bno}';
		}
	})

	$(document).ready(function() {
		$('#content').keyup(function() {
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#content').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
		});
		
		$('#modalReply').keyup(function() {
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#modalReply').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
		});
		
		
		$('#replyRegist').click(function() {
			const bno = '${article.bno}';
			const content = $('#content').val();
			const adminId = '${admin}';
			
			
			//글자수 바이트 체크를 위한 변수 선언
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			if(content === '') {
				alert('내용을 입력하세요!');
				$('#content').focus();
				return;
			} else if(contentByteLength >= 2000) {
				alert('내용은 2000 Byte를 넘을 수 없습니다.');
				$('#content').focus();
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/replyRegist" />',
				data: JSON.stringify({
					"bno": bno,
					"content": content,
					"adminId": adminId
				}),
				dataType: 'text',
				contentType: 'application/json',
				success: function(data) {
					console.log('통신 성공!: ' + data);
					$('#content').val('');
					getList(1, true);
				},
				error: function() {
					alert('등록에 실패했습니다. 관리자에게 문의하세요!');
				}
			}); //댓글 등록 비동기 통신 끝.
		}); //댓글 등록 이벤트 끝
		
		//더보기 버튼 처리
		$('#moreList').click(function() {
			getList(++page, false);
		});
		
		//목록 요청
		let page = 1;
		let strAdd = '';
		
		getList(1, true);
		
		function getList(pageNum, reset) {	
			const bno = '${article.bno}';
			$.getJSON(
				"<c:url value='/reply/getList/' />" + bno + "/" + pageNum,
				function(data) {
					console.log(data);
					
					let total = data.total;
					let replyList = data.list;
					
					if(reset) {
						strAdd = '';
						page = 1;
					}
					
					console.log('현재 페이지: ' + page);
					if(total <= page * 5) {
						$('#moreList').css('display', 'none');
					} else {
						$('#moreList').css('display', 'block');
					}
					
					if(replyList.length <= 0) return;
					
					for(let i=0; i<replyList.length; i++) {
						strAdd +=
							`<div class='reply-wrap'>
							 	<div class='reply-content clearfix'>
							 		<div class='reply-img left'>
							 			<img src="${pageContext.request.contextPath}/resources/img/ogu-logo.PNG">
							 		</div>
							 		<div class='reply-group left'>
							 			<strong class='left'>` + replyList[i].adminId + `</strong>
							 			<small class='left'>&emsp;` + timeStamp(replyList[i].regDate) + `</small>
							 		</div>
						 			<c:if test="${admin!=null}">
						 			<div class='right'>
						 				<a href='` + replyList[i].rno + `' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>
						 				<a href='` + replyList[i].rno + `' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>
						 			</div>
						 			</c:if>
						 			<br>
						 			<br>
							 		<p class='clearfix'>` + replyList[i].content + `</p>
							 	</div>
							 </div>`;
					}
					
					$('#replyList').html(strAdd);
				}
			); //end getJSON
		} //end getList()
		
		//수정, 삭제
		$('#replyList').on('click', 'a.replyModify', function(e) {
			e.preventDefault();
			
			const rno = $(this).attr('href');
			$('#modalRno').val(rno);
			
			const content = $(this).parent().next().next().next().text();
			$('#modalReply').html(content);
			
		
			$('#replyModal').modal('show');
			
		}); //수정 or 삭제 버튼 클릭 이벤트 끝
		
		//수정 처리 함수
		$('#modalModBtn').click(function(e) {
			e.preventDefault();
			if(confirm('댓글을 수정하시겠습니까?')) {
				const content = $('#modalReply').val();
				const rno = $('#modalRno').val();
				
				//글자수 바이트 체크를 위한 변수 선언
				let contentLength = content.length;
				let contentByteLength = 0;
				
				contentByteLength = (function(s,b,i,c) {
					for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
				    return b
				})(content);
				
				if(content === '') {
					alert('내용을 확인하세요!');
					return;
				} else if(contentByteLength >= 2000) {
					alert('내용은 2000 Byte를 넘을 수 없습니다.');
					$('#modalReply').focus();
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/reply/replyUpdate" />',
					contentType: 'application/json',
					data: JSON.stringify({
						'content': content,
						'rno': rno
					}),
					success: function(result) {
						alert('정상 수정되었습니다.');
						$('#modalReply').val('');
						$('#replyModal').modal('hide');
						getList(1, true);
					},
					error: function() {
						alert('수정에 실패했습니다. 관리자에게 문의하세요!');
					}
				}) //end ajax 수정
			}
		}); //수정 처리 끝
		
		//삭제 처리 함수
		$('#replyList').on('click', '.replyDelete',function(e) {
			e.preventDefault();
			if(confirm('댓글을 삭제하시겠습니까?')) {
				const rno = $(this).attr('href');
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/reply/replyDelete" />',
					data: rno,
					contentType: 'application/json',
					success: function(data) {
						alert('댓글이 삭제되었습니다.');
						getList(1, true);
						return;
					},
					error: function() {
						alert('수정에 실패했습니다. 관리자에게 문의하세요!');
					}
				}) //end ajax
			}
		}); //삭제 처리 끝
		
		//날짜 처리 함수
		function timeStamp(millis) {
			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간 차
			const gap = date.getTime() - millis;
			
			let time; //리턴할 시간
			if(gap < 60 * 60 * 24 * 1000) { //1일 미만일 경우
				if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
					time = '방금 전';
				} else {
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				}
			} else { //1일 이상인 경우
				const regDate = new Date(millis);
				const year = regDate.getFullYear(); //년
				const month = regDate.getMonth() + 1; //월
				const day = regDate.getDate(); //일
				
				time = year + '년' + month + '월' + day + '일';
			}
			
			return time;
		} //날짜 처리 끝
	}); //end jQuery
	
</script>


