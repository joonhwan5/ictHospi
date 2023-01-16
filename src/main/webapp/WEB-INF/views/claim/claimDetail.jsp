<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<style>

	.claim-group {
		padding: 10px;
		display: block;
	}
	
	.claimContentListBox {
		width: 100%;
		text-align: left;
	}

</style>

<section>
	<div class="container-fluid">
		<div class="row">

			<%@ include file="../include/noticeSide.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">고객의 소리</h1>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="titlebox">
					<p>상세보기</p>
				</div>
				<form action="<c:url value='/claim/claimModify' />" method="post" name="mainForm">
					<div>
						<label>등록일</label>
						<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="user" value="${article.userId}" readonly>
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
					<c:if test="${login == article.userId}">
						<button type="submit" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
						<button type="button" id="delBtn" class="btn btn-info claim-delete-btn">삭제</button>
					</c:if>
					<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/claim/claimMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				</form>
				
				<hr>
				
				<c:if test="${admin!=null}">
					<form class="reply-wrap">
						<!--form-control은 부트스트랩의 클래스입니다-->
						<div class="reply-content">
							<textarea class="form-control" rows="3" id="content"></textarea>
							<div class="reply-group">
								<div class="reply-input">
									<input type="text" class="form-control" id="adminId" placeholder="아이디">
									<input type="password" class="form-control" id="adminPw" placeholder="비밀번호">
								</div>
								<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
							</div>
						</div>
					</form>
				</c:if>
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
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
							<input type="hidden" id="modalRno">
							<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
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
			if(confirm('정말 삭제하시것어여?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/claim/claimDelete');
				$('form[name=mainForm]').submit();
			}
		});
	})

	$(document).ready(function() {
		$('#replyRegist').click(function() {
			const bno = '${article.bno}';
			const content = $('#content').val();
			const adminId = $('#adminId').val();
			const adminPw = $('#adminPw').val();
			
			if(content === '' || adminId === '' || adminPw === '') {
				alert('아이디, 비밀번호, 내용을 입력하세요!');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/replyRegist" />',
				data: JSON.stringify({
					"bno": bno,
					"content": content,
					"adminId": adminId,
					"adminPw": adminPw
				}),
				dataType: 'text',
				contentType: 'application/json',
				success: function(data) {
					console.log('통신 성공!: ' + data);
					$('#content').val('');
					$('#adminId').val('');
					$('#adminPw').val('');
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
							 	<div class='reply-content'>
							 		<div class='reply-group'>
							 			<strong class='left'>` + replyList[i].adminId + `</strong>
							 			<small class='left'>` + timeStamp(replyList[i].regDate) + `</small>
							 			<c:if test="${admin!=null}">
							 				<a href='` + replyList[i].rno + `' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a> &nbsp;
							 				<a href='` + replyList[i].rno + `' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>
							 			</c:if>
							 		</div>
							 		<p class='clearfix'>` + replyList[i].content + `</p>
							 	</div>
							 </div>`;
					}
					
					$('#replyList').html(strAdd);
				}
			); //end getJSON
		} //end getList()
		
		//수정, 삭제
		$('#replyList').on('click', 'a', function(e) {
			e.preventDefault();
			
			const rno = $(this).attr('href');
			$('#modalRno').val(rno);
			
			const content = $(this).parent().next().text();
			//console.log(content);
			
			if($(this).hasClass('replyModify')) {
				$('.modal-title').html('댓글 수정');
				$('#modalReply').css('display', 'inline');
				$('#modalReply').val(content);
				$('#modalModBtn').css('display', 'inline');
				$('#modalDelBtn').css('display', 'none');
				$('#replyModal').modal('show');
			} else {
				$('.modal-title').html('댓글 삭제');
				$('#modalReply').css('display', 'none');
				$('#modalModBtn').css('display', 'none');
				$('#modalDelBtn').css('display', 'inline');
				$('#replyModal').modal('show');
			}
		}); //수정 or 삭제 버튼 클릭 이벤트 끝
		
		//수정 처리 함수
		$('#modalModBtn').click(function() {
			const content = $('#modalReply').val();
			const rno = $('#modalRno').val();
			const adminPw = $('#modalPw').val();
			
			if(content === '' || adminPw === '') {
				alert('내용, 비밀번호를 확인하세요!');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/replyUpdate" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'content': content,
					'rno': rno,
					'adminPw': adminPw
				}),
				success: function(result) {
					if(result === 'modSuccess') {
						alert('정상 수정되었습니다.');
						$('#modalReply').val('');
						$('#modalPw').val('');
						$('#replyModal').modal('hide');
						getList(1, true);
					} else {
						alert('비밀번호를 확인하세요.');
						$('#modalPw').val('');
						$('#modalPw').focus();
					}
				},
				error: function() {
					alert('수정에 실패했습니다. 관리자에게 문의하세요!');
				}
			}) //end ajax 수정
		}); //수정 처리 끝
		
		//삭제 처리 함수
		$('#modalDelBtn').click(function() {
			const rno = $('#modalRno').val();
			const adminPw = $('#modalPw').val();
			
			if(adminPw === '') {
				alert('비밀번호를 확인하세요!');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/replyDelete" />',
				data: JSON.stringify({
					'rno': rno,
					'adminPw': adminPw
				}),
				contentType: 'application/json',
				success: function(data) {
					if(data === 'delSuccess') {
						alert('댓글이 삭제되었습니다.');
						$('#modalPw').val('');
						$('#replyModal').modal('hide');
						getList(1, true);
					} else {
						alert('비밀번호가 틀렸습니다.');
						$('#modalPw').val('');
						$('#modalPw').focus();
					}
				},
				error: function() {
					alert('수정에 실패했습니다. 관리자에게 문의하세요!');
				}
			}) //end ajax
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


