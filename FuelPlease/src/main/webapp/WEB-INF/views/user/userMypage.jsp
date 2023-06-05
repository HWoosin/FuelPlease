<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp" %>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  
	<title>Fuel Please</title>
	<meta content="" name="description">
	<meta content="" name="keywords">

<<<<<<< HEAD
=======
	<!--css-->
  
>>>>>>> feat/hwang
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">
  
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
        <style>
            @font-face {
                font-family: 'KIMM_Bold';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                font-weight: 700;
                font-style: normal;
			}
        </style>



<section>
	<div class="container-fluid">

	<!-- Vendor CSS Files -->
	<!--  <link href="/vendor/aos/aos.css" rel="stylesheet">-->
	<link href="${pageContext.request.contextPath }/vendor/aos/aos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
	<!-- Template Main CSS File -->
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
  
	<!-- =======================================================
	* Template Name: MyResume
	* Updated: Mar 10 2023 with Bootstrap v5.2.3
	* Template URL: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->
  </head>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-9 col-sm-12 myInfo">
					<div class="titlebox">MEMBER INFO</div>

					<!-- <ul class="nav nav-tabs tabs-style">
						<li class="active"><a data-toggle="tab" href="#info">내정보</a></li>
						<li><a data-toggle="tab" href="#myBoard">내글</a></li>
						<li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
					</ul> -->
					<div class="tab-content">
						<div id="info" class="tab-pane in active">

							<!-- <p>*표시는 필수 입력 표시입니다</p> -->
							<form action="${pageContext.request.contextPath}/user/updateUser" method="post"
								name="updateForm">
								<table class="table-fluid">
									<tbody class="m-control">
										<tr>
											<td class="m-title">*ID</td>
											<td><input class="form-control input-sm" name="userId" value="${login}"
													readonly></td>
										</tr>
										<tr>
											<td class="m-title">*이름</td>
											<td><input class="form-control input-sm" name="userName"
													value="${userInfo.userName }"></td>
										</tr>
										<tr>
											<td class="m-title">*비밀번호</td>
											<td><input type="password" class="form-control input-sm text-black" name="userPw" id="userPw">
											<span id="msgPw"></span></td>
										</tr>
										<tr>
											<td class="m-title">*비밀번호확인</td>
											<td><input type="password" class="form-control input-sm" name="userPwChk" id="userPwChk">
												<span id="msgPw-c"></span></td>
										</tr>
										<tr>
											<td class="m-title">*E-mail</td>
											<td><input class="form-control input-sm" id="userEmail1" name="userEmail1"
													value="${userInfo.userEmail1}"> <select
													class="form-control input-sm sel" id="userEmail2" name="userEmail2">
													<option ${userInfo.userEmail2=='@naver.com' ? 'selected' : '' }>
														@naver.com</option>
													<option ${userInfo.userEmail2=='@gmail.com' ? 'selected' : '' }>
														@gmail.com</option>
													<option ${userInfo.userEmail2=='@daum.net' ? 'selected' : '' }>
														@daum.net</option>
												</select>
												<button type="button" id="mail-check-btn" class="btn btn-primary">이메일
													인증</button></td>
										</tr>
										<tr id="mailAuth">
											<td>인증번호 입력란</td>
											<td><input type="text" class="form-control mail-check-input"
													placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
												<button type="button" id="mail-auth-btn" class="btn btn-primary"
													disabled="disabled">인증
													확인</button></td>
										</tr>
										<tr>
											<td class="m-title">*휴대폰</td>
											<td><select class="form-control input-sm sel" name="userPhone1">
													<option ${userInfo.userPhone1=='010' ? 'selected' : '' }>010
													</option>
													<option ${userInfo.userPhone1=='011' ? 'selected' : '' }>011
													</option>
													<option ${userInfo.userPhone1=='017' ? 'selected' : '' }>017
													</option>
													<option ${userInfo.userPhone1=='018' ? 'selected' : '' }>018
													</option>
												</select> <input class="form-control input-sm" name="userPhone2"
													value="${userInfo.userPhone2}">
											</td>
										</tr>
										<tr>
											<td class="m-title">*우편번호</td>

											<td><input class="form-control input-sm" name="zipCd" id="zipCd"
													value="${userInfo.zipCd}" readonly>
												<button type="button" class="btn btn-primary" id="addBtn"
													onclick="searchAddress()">주소찾기</button>
											</td>
										</tr>
										<tr>
											<td class="m-title">*주소</td>

											<td><input class="form-control input-sm add" name="userAddr" id="userAddr"
													value="${userInfo.userAddr}">
											</td>
										</tr>
										<tr>
											<td class="m-title">*상세주소</td>
											<td><input class="form-control input-sm add" name="addrDetail"
													id="addrDetail" value="${userInfo.addrDetail}"></td>
										</tr>
									</tbody>
								</table>
								<div class="titlefoot">
									<button class="btn btn-primary" id="updateBtn">수정</button>
									<button class="btn btn-primary" id="listBtn" onclick="location.href='${pageContext.request.contextPath}/user/userDelete'">회원탈퇴</button>
	
								</div>
							</form>
						</div>
						<!-- 첫번째 토글 끝 -->

						<!-- 두번째 토글 메뉴 시작 -->
						<%-- <div id="myBoard" class="tab-pane fade">
							<p>*내 게시글 관리</p>
							<form>
								<table class="table">
									<thead>
										<tr>
											<td>번호</td>
											<td>제목</td>
											<td>작성일</td>
										</tr>
									</thead>
									<tbody>

										<c:if test="${fn:length(userInfo.userBoardList) > 0}">
											<c:forEach var="vo" items="#">
												<tr>
													<td>${vo.bno}</td>
													<td><a href="##">${vo.title}</a></td>
													<td><fmt:parseDate value="${vo.regDate}"
															pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"
															type="both" /> <fmt:formatDate value="${parsedDate}"
															pattern="yyyy년 MM월 dd일 HH:mm" /></td>
												</tr>
											</c:forEach>
											<div class="text-center">
												<hr>
												<ul id="pagination" class="pagination pagination-sm">
													<c:if test="${pc.prev}">
														<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
													</c:if>

													<c:forEach var="num" begin="${pc.beginPage}"
														end="${pc.endPage}">
														<li class="${pc.paging.pageNum == num ? 'active' : '' }">
															<a href="#" data-pagenum="${num}">${num}</a>
														</li>
													</c:forEach>

													<c:if test="${pc.next}">
														<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
													</c:if>
												</ul>
											</div>
										</c:if>

										<c:if test="${fn:length(userInfo.userBoardList) <= 0}">
											<h2>작성된 글이 없습니다.</h2>
										</c:if>
									</tbody>
								</table>
							</form>
						</div>
						<!-- 두번째 토글 끝 -->
						
						<div id="menu2" class="tab-pane fade">
							<h3>Menu 2</h3>
							<p>Some content in menu 2.</p>
						</div> --%>

					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		console.log('${login}');
		let code = '';
		let pwFlag;

		//인증번호 이메일 전송
		document.getElementById('mail-check-btn').onclick = function () {
			document.getElementById('mail-auth-btn').disabled = false;
			const email = document.getElementById('userEmail1').value +
				document.getElementById('userEmail2').value;

			console.log('완성된 email:' + email);
			fetch('${pageContext.request.contextPath}/user/mailCheck?email=' + email)
				.then(res => res.text())
				.then(data => {
					console.log('인증번호: ' + data);
					//비활성된 인증번호 입력창 활성화
					document.querySelector('.mail-check-input').disabled = false;
					code = data; //인증번호를 전역변수에 저장
					alert('인증번호가 전송되었습니다. 확인후 입력란에 정확히 입력하세요.');
				}); //비동기 끝.
		}; //인증번호 이벤트 끝.

		//인증번호 검증
		document.getElementById('mail-auth-btn').onclick = function () {

			const inputCode = document.querySelector('.mail-check-input').value; //사용자가 입력한 인증번호.

			console.log('사용자가 입력한 값: ' + inputCode);

			if (inputCode === code) {
				alert('인증번호가 일치합니다.');

				document.querySelector('.mail-check-input').disabled = true;
				document.getElementById('mail-auth-btn').disabled = true;
				document.getElementById('userEmail1').setAttribute('readonly', true);
				document.getElementById('userEmail2').setAttribute('readonly', true);

				const email2 = document.getElementById('userEmail2');

				email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
				email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
			} else {
				alert('인증번호를 다시 확인해주세요');
				document.querySelector('.mail-check-input').focus(); //다시 입력할 수 있도록 포커싱.
			}
		} //인증 번호 검증 끝


		//카카오 API
		function searchAddress() {
			new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('zipCd').value = data.zonecode;
					document.getElementById("userAddr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("addrDetail").focus();
				}
			}).open();
		} //주소찾기 api끝

		// 수정 버튼 클릭
		document.getElementById('updateBtn').onclick = function () {
			// 비밀번호 변경 안 할 경우
			let userPw = document.getElementById('userPw').value;
			let confirmPw = document.getElementById('userPwChk').value;
			console.log(userPw);
			console.log(confirmPw);

			if(userPw === '') {
				alert('비밀번호를 확인 해주세요');
				return;
			}
			
			if(confirmPw === ''){
				alert('비밀번호확인란을 확인 해주세요');
				return;
			}

			if(userPw !== confirmPw) {
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}

			// 이메일 변경했는데 인증 안한 경우
			let email1 = document.getElementById('userEmail1').value;
			let email2 = document.getElementById('userEmail2').value;
			let userEmail1 = '${userInfo.userEmail1}';
			let userEamil2 = '${userInfo.userEmail2}';

			// console.log(userEmail1);
			// console.log(email1);

			if (email1 !== userEmail1 || email2 !== userEmail2) {
				if (!document.getElementById('mail-auth-btn').disabled) {
					alert('이메일 인증을 해주세요');
					return;
				}
			}

			if (confirm('정보 수정을 진행합니다.')) {
				document.updateForm.submit();
			} else return;
		}

		/*비밀번호 형식 검사 스크립트*/
		var pw = document.getElementById("userPw");
		pw.onkeyup = function () {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (regex.test(document.getElementById("userPw").value)) {
				document.getElementById("userPw").style.borderColor = "green";
				document.getElementById("msgPw").innerHTML = "사용가능합니다";
				pwFlag = true;
			} else {
				document.getElementById("userPw").style.borderColor = "red";
				document.getElementById("msgPw").innerHTML = "올바른 비밀번호를 입력하세요";
				document.getElementById("userPw").focus();
				pwFlag = false;
			}
		}

		/*비밀번호 확인검사*/
		var pwConfirm = document.getElementById("userPwChk");
		pwConfirm.onkeyup = function () {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (document.getElementById("userPwChk").value == document.getElementById("userPw").value) {
				document.getElementById("userPwChk").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";				
			} else {
				document.getElementById("userPwChk").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			}
		}
		

		






	</script>



