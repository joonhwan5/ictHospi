<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container user-agree-container">
	<div class="row">
		<h1>ICTHospital 이용약관 동의</h1>
	</div>
	
	<div class="row all-agree-checkbox">
		<input type="checkbox" id="allCheckBox">
		<span>전체 약관에 동의합니다.</span>
	</div>
	
	<div class="row">
		<h4 class="title05">이용약관 <span class="hotPink">(동의필수)</span></h4>
		<ul class="list_type_01 ml15">
			<li>이용약관에 동의하셔야만 회원가입을 하실 수 있습니다.</li>
		</ul>
	</div>

	<div class="row agree-div">
		<h3>ICT병원 홈페이지 회원가입 약관</h3>
		<h4 class="title05" id="rull_01">제 1조 (목적)</h4>
		<p class="pl10 pt5 line16">
			본 약관은 고려대학병원(이하
	 "병원"라 합니다)에서 운영하는 인터넷 홈페이지에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)의 이용에 관한 사항을 규정함을 목적으로 합니다.  
        </p>
        <h4 class="title05 mt10" id="rull_02">제 2조 (정의)</h4>
        <ol class="pl10 pt5 line16">
	        <li>① 이용자 : '이용자'란 서비스에 접속하여 본 약관에 따라 병원이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
	        <li>② 회원 : '회원'이란 병원이 회원으로 적합하다고 인정하는 일반 개인으로 본 약관에 동의하며 서비스의 회원가입양식을 작성하고 아이디와 비밀번호를 이용하여 서비스를 제공받는 사람을 말합니다.</li>
	        <li>③ 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 병원에서 선정한 사람</li>
	        <li>④ 연결사이트 : 홈페이지와 하이퍼링크 방식(하이퍼링크의 대상에는 문자, 정지 및 동화상 등이 포함됨) 등으로 연결된 웹 사이트를 말합니다.</li>
	        <li>⑤ 개인정보 : 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 특정 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 인식할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함한다)를 말합니다.</li>
	        <li>⑥ 해지 : 이용자가 서비스 개통 후 이용계약을 해약하는 것 </li>
	    </ol>
	   	<h4 class="title05 mt10" id="rull_03">제3조 (약관의 게시 및 변경)</h4>
	   	<ol class="pl10 pt5 line16">
	       <li>① 병원은 본 약관의 내용과 상호, 병원 소재지, 전자우편 주소 등을 이용자가 알 수 있도록 홈페이지에 게시합니다.</li>
	       <li>② 병원은 불가피한 사정이 있는 경우 관계법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
	       <li>③ 병원은 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</li>
	       <li>④ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 상관례에 따릅니다.</li>
	       <li>⑤ "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. "이용자"가 거부하는 경우 "병원"은 당해 "이용자"와의 계약을 해지할 수 있습니다. 만약 "이용자"가 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다. </li>
        </ol>
        <h4 class="title05 mt10" id="rull_04">제4조 (회원 가입) </h4>
		<ol class="pl10 pt5 line16">
			<li>① 회원가입계약의 성립시기는 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를
				한 다음 회원가입신청을 하고, "병원"이 이러한 신청에 대하여 승낙함으로써 체결됩니다.</li>
			<li>② "병원"은 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "병원"은
				다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
				<ol class="pl20">
					<li>1. 가입신청자가 본 약관 제7조 제2항에 의거하여 이전에 회원 자격을 상실한 적이 있는 경우</li>
					<li>2. 실명이 아니거나 타인의 명의를 이용한 경우</li>
					<li>3. 허위의 정보를 기재하거나, "병원"이 제시하는 내용을 기재하지 않은 경우</li>
					<li>4. 14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우</li>
					<li>5. 기타 회원으로 등록하는 것이 병원의 기술상 또는 업무 수행상 현저히 지장이 있다고 판단되는 경우</li>
					<li>6. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
					<li>7. "병원"이 정한 회원가입요건이 미비 되었을 때</li>
				</ol>
			</li>
			<li>③ 제1항에 따른 신청에 있어 "병원"은 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을
				요청할 수 있습니다.</li>
			<li>④ "병원"은 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을
				세분하여 이용에 차등을 둘 수 있습니다.</li>
		</ol>
		<h4 class="title05 mt10" id="rull_05">제5조 (회원 탈퇴 및 자격의 상실등)  </h4>
		<ol class="pl10 pt5 line16">
			<li>① "회원"은 병원에 언제든지 탈퇴를 요청할 수 있으며 "병원"은 즉시 회원탈퇴를 처리합니다. 단, 탈퇴의
				요청은 전자메일 또는 서면으로 하여야 하며, 요청하는 자의 이름, 주민등록번호, 비밀번호, 전화번호, 해지사유등을
				기재하여야 합니다.</li>
			<li>② "회원"이 "탈퇴"할 경우, 관련법 및 개인정보처리방침에 따라 "병원"이 회원정보를 보유하는 경우를
				제외하고는 탈퇴 즉시 "회원"의 모든 데이터는 소멸됩니다.</li>
			<li>③ "회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 고객의소리, 상담, 커뮤니티 등과 같은
				"게시물" 일체는 삭제되지 않을 수 있으니 사전에 삭제 후 탈퇴하시기 바랍니다.</li>
			<li>④ 회원이 다음 각호의 사유에 해당하는 경우, "병원"은 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬
				수 있습니다.
				<ol class="pl20">
					<li>1. 등록 신청 시에 허위 내용을 등록한 경우</li>
					<li>2. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 질서를 위협하는 경우</li>
					<li>3. 병원 내에 제공되는 정보를 변경하는 등 홈페이지 운영을 방해한 경우</li>
					<li>4. 사이트를 이용하여 법령 및 본 약관, 공서양속에 반하는 행위를 하는 경우</li>
					<li>5. 기타 회원으로서의 자격을 지속시키는 것이 부적절하다고 판단되는 경우</li>
				</ol>
			</li>
			<li>⑤ 홈페이지를 통하여 진료예약을 한 후 정당한 사유 없이 2회 이상 진료예약을 포기하거나 예약한 진료를 받지
				않은 경우 홈페이지에서의 진료예약에 대한 자격을 3개월간 제한합니다.</li>
		</ol>
		<h4 class="title05 mt10" id="rull_06">제6조 (회원에 대한 통지)  </h4>
		<ol class="pl10 pt5 line16">
			<li>① "병원"이 "회원"에 대한 통지를 하는 경우 이용자가 회원 가입시 기재한 e-mail 또는 핸드폰 문자
				등으로 할 수 있습니다.</li>
			<li>② "병원"이 불특정다수 이용자에 대한 통지를 하는 경우 "병원" 홈페이지에 사전 게시함으로써 제1항의
				통지에 갈음할 수 있습니다.</li>
		</ol>
		<h4 class="title05 mt10" id="rull_07">제7조 (회원정보의 수정)  </h4>
		<ol class="pl10 pt5 line16">
			<li>① "회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만,
				서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.</li>
			<li>② "회원"은 회원가입신청시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로
				"병원"에 대하여 그 변경사항을 알려야 합니다.</li>
			<li>③ 제2항의 변경사항을 "병원"에 알리지 않아 발생한 불이익에 대하여 "병원"은 책임지지 않습니다.</li>
		</ol>
	</div>
	
	<div class="row all-agree-checkbox">
		이용약관에 동의합니다. &nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="cbox" class="onebox" id="checkBoxOne" onclick="checkOnlyOne(this)">&nbsp;&nbsp;동의함&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="noCheckBoxOne" class="onebox" onclick="checkOnlyOne(this)">&nbsp;&nbsp;동의안함
	</div>
	
	<div class="row">
		<h4 class="title05 mt30">개인정보 수집 및 이용목적 <span class="hotPink">(동의필수)</span></h4>
		<ul class="list_type_01 ml15">
			<li>개인정보 수집 및 이용목적에 동의하셔야만 회원가입을 하실 수 있습니다.</li>
		</ul>
	</div>
	
	<div class="row agree-div">
		<h3 class="title04">개인정보 수집 및 이용목적</h3>
		<p class="pl10 pt16 line16">
			병원은 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br> 이용자가 제공한 모든 정보는 하기 목적에 필요한
			용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.
		</p>
		<ol class="pt20 line18 pl10">
			<li>① 서비스제공<br> 진료 및 건진 예약, 예약조회 및 회원제 서비스 이용에 따른 본인 확인 절차에
				이용<br> 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보
			</li>
			<li>② 회원관리</li>
			<li>③ 소비자 기본법 제52조에 의거한 소비자 위해 정보 수집</li>
		</ol>
	</div>
	
	<div class="row all-agree-checkbox">
		위 수집하는 개인정보의 이용목적에 동의합니다.&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="cbox" class="twobox" id="checkBoxTwo" onclick="checkOnlyTwo(this)">&nbsp;&nbsp;동의함&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="noCheckBoxTwo" class="twobox" onclick="checkOnlyTwo(this)">&nbsp;&nbsp;동의안함
	</div>
	
	<c:choose>
		<c:when test="${kakaoId != null}">
			<div class="row">
				<form action="${pageContext.request.contextPath}/user/kakaoUserJoin" method="post" id="agreeForm">
					<input type="hidden" name="success" value="true">
					<button type="button" id="userAgreeJoinBtn">회원가입</button>
					<button type="button" onclick="history.back()">취소</button>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<form action="${pageContext.request.contextPath}/user/userJoin" method="post" id="agreeForm">
					<input type="hidden" name="success" value="true">
					<button type="button" id="userAgreeJoinBtn">회원가입</button>
					<button type="button" onclick="history.back()">취소</button>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	let msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}

	$(document).ready(function() {
		
		$('#allCheckBox').click(function() {
			if($("#allCheckBox").is(':checked')) {
				$("#checkBoxOne").prop("checked", true);
				$("#checkBoxTwo").prop("checked", true);
				$("#checkBoxThr").prop("checked", true);
				$("#noCheckBoxOne").prop("checked", false);
				$("#noCheckBoxTwo").prop("checked", false);
				$("#noCheckBoxThr").prop("checked", false);
			} else {
				$("#checkBoxOne").prop("checked", false);
				$("#checkBoxTwo").prop("checked", false);
				$("#checkBoxThr").prop("checked", false);
			}
		});
		
		$(document).on("click", "input[type=checkbox]", function(e) {
			
			var chks = document.getElementsByName("cbox");
			var chksChecked = 0;
			
			for(var i=0; i<chks.length; i++) {
				var cbox = chks[i];
				
				if(cbox.checked) {
					chksChecked++;
				}
			}
			
			if(chks.length == chksChecked){
				$("#allCheckBox").prop("checked", true);
			}else{
				$("#allCheckBox").prop("checked",false);
			}
			
		});
		
		$('#userAgreeJoinBtn').click(function() {
			
			if(!$('#checkBoxOne').is(':checked')) {
				alert('이용약관에 동의를 하셔야만 회원가입이 가능합니다.');
				$('#checkBoxOne').focus();
				return;
			}
			
			if(!$('#checkBoxTwo').is(':checked')) {
				alert('개인정보 수집 및 이용목적에 동의를 하셔야만 회원가입이 가능합니다.');
				$('#checkBoxTwo').focus();
				return;
			}
			
			$('#agreeForm').submit();
			
		});
	});
	
	function checkOnlyOne(element) {
		 const checkboxes = document.querySelectorAll('.onebox');
		 
		 checkboxes.forEach((cb) => {
		   cb.checked = false;
		 })
		 
		 element.checked = true;
	}
	
	function checkOnlyTwo(element) {
		 const checkboxes = document.querySelectorAll('.twobox');
		 
		 checkboxes.forEach((cb) => {
		   cb.checked = false;
		 })
		 
		 element.checked = true;
	}
</script>