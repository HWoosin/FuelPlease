<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  
	<title>Fuel Please</title>
	<meta content="" name="description">
	<meta content="" name="keywords">

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
			<div class="col-lg-6 col-md-9 col-sm-12 join-form">
				<div class="titlebox">회원가입</div>
				<form action="${pageContext.request.contextPath}/user/userJoin"
					method="post" name="joinForm">
					<div class="form-group">
						<label for="id">아이디</label>
						<div class="input-group">
							<input type="text" name="userId" class="form-control" id="userId"
							placeholder="아이디를 (영문포함 4~12자 이상)">
							<div class="input-group-addon">
								<button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
							</div>
						</div>
						<span id="msgId"></span>
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							name="userPw" class="form-control" id="userPw"
							placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)"> <span
							id="msgPw"></span>
					</div>
					<div class="form-group">
						<label for="password-confrim">비밀번호 확인</label> <input
						type="password" class="form-control" id="pwConfirm"
							placeholder="비밀번호를 확인해주세요."> <span id="msgPw-c"></span>
					</div>
					<div class="form-group">
						<label for="name">이름</label> <input type="text" name="userName"
							class="form-control" id="userName" placeholder="이름을 입력하세요.">
					</div>
					<div class="form-group">
						<label for="hp">휴대폰번호</label>
						<div class="input-group">
							<input type="text" name="userPhone1" class="form-control phone1"
								id="userPhone1" placeholder="ex)010"> <input type="text"
								name="userPhone2" class="form-control phone2" id="userPhone2"
								placeholder="번호를 입력해주세요">
							</div>
						</div>
					<div class="form-group email-form">
						<label for="email">이메일</label><br>
						<div class="input-group">
							<input type="text" name="userEmail1" class="form-control"
								id="userEmail1" placeholder="이메일"> <select
								name="userEmail2" class="form-control" id="userEmail2">
								<option>@naver.com</option>
								<option>@daum.net</option>
								<option>@gmail.com</option>
								<option>@hanmail.com</option>
								<option>@yahoo.co.kr</option>
							</select>
							<div class="input-group-addon">
								<button type="button" id="mail-check-btn"
									class="btn btn-primary">이메일 인증</button>
							</div>
						</div>
					</div>
					<div class="mail-check-box">
						<input type="text" class="form-control mail-check-input"
							placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
						<span id="mail-check-warn"></span>
					</div>


					<!--readonly 속성 추가시 자동으로 블락-->
					<div class="form-group">
						<label for="addr-num">주소</label>
						<div class="input-group">
							<input type="text" name="zipCd" class="form-control"
							id="zipCd" placeholder="우편번호" readonly>
							<div class="input-group-addon">
								<button type="button" class="btn btn-primary"
									onclick="searchAddress()">주소찾기</button>
								</div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" name="userAddr" class="form-control"
							id="userAddr" placeholder="기본주소">
					</div>
					<div class="form-group">
						<input type="text" name="addrDetail" class="form-control"
							id="addrDetail" placeholder="상세주소">
					</div>

					<!--button탭에 들어가서 버튼종류를 확인한다-->
					<div class="form-group">
						<button type="button" id="joinBtn"
						class="btn btn-lg btn-info btn-block">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		const loginId = '${login}'
		console.log(loginId);
		if(loginId !== '') {
			history.back();
			alert('이미 회원입니다. 로그아웃 후 이용해 주세요.');
		}
		
		let code = ''; //이메일 전송 인증번호 저장을 위한 변수
	let idFlag, pwFlag; // 유효성 검사 여부 판단.
	
	//아이디 중복체크
	document.getElementById('idCheckBtn').onclick = function() {
		const msg = document.getElementById('msgId');
	    const userId = document.getElementById('userId').value;
	    if(userId === ''){
			alert('아이디는 필수값입니다');
	        return;
	    }
	    else if(!idFlag){
	        alert('형식에 맞춰 입력해 주세요.');
	        return;
	    }
	    
	//비동기 요청 보내기
		fetch('${pageContext.request.contextPath}/user/idCheck', {
			
			 method: 'post',
		     headers: {
		        'Content-type':'text/plain'

		     },
		     body : userId
		})
		.then(res =>res.text())//요청 완료 후 응답 정보에서 텍스트만 빼기
		.then(data => {//텍스트만 뺀 Promise 객체로부터 data전달받음.
	            if(data ==='1'){
	            	msg.textContent = '중복된 아이디 입니다.';
	            }
	            else{
	                document.getElementById('userId').setAttribute('readonly',true);
	                //document.getElementById('idCheckBtn').setAttribute('disabled', true);
	                msg.textContent = '사용 가능한 아이디 입니다.';
	            }
	        });
	} //아이디 중복확인 끝
	
	//인증번호 이메일 전송
	document.getElementById('mail-check-btn').onclick = function(){
	const email = document.getElementById('userEmail1').value
	                + document.getElementById('userEmail2').value;
	
	console.log('완성된 email:' + email);   
	fetch('${pageContext.request.contextPath}/user/mailCheck?email='+email)
	    .then(res => res.text())
	    	.then(data => {
				console.log('인증번호: '+data);
	    		//비활성된 인증번호 입력창 활성화
	            document.querySelector('.mail-check-input').disabled = false;
	            code = data; //인증번호를 전역변수에 저장
	            alert('인증번호가 전송되었습니다. 확인후 입력란에 정확히 입력하세요.');
	    	});//비동기 끝.
	}; //인증번호 이벤트 끝.
	
	//인증번호 검증
	//blur -> focus가 벗어나는 경우 발생.
	document.querySelector('.mail-check-input').onblur = function(e){
	
	const inputCode = e.target.value; //사용자가 입력한 인증번호.
	const $resultMsg = document.getElementById('mail-check-warn');
	console.log('사용자가 입력한 값: ' + inputCode);
	
		if(inputCode === code){
		    $resultMsg.textContent ='인증번호가 일치합니다.';
		    $resultMsg.style.color = 'green';
		    document.getElementById('mail-check-btn').disabled = true;
		    document.getElementById('userEmail1').setAttribute('readonly',true);
		    document.getElementById('userEmail2').setAttribute('readonly',true);
		    e.target.style.display = 'none'; //인증번호 입력창 숨기기
			
		    const email2 = document.getElementById('userEmail2');
		
		    email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
		    email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
		}
		else{
		    $resultMsg.textContent ='인증번호를 다시 확인해 주세요.'
		    $resultMsg.style.color = 'red';
		    e.target.focus(); //다시 입력할 수 있도록 포커싱.
		}
	}//인증 번호 검증 끝
	
	//카카오 API
	function searchAddress() {
		new daum.Postcode({
			oncomplete: function(data) {
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
	
	//폼 데이터 검증 (회원 가입 버튼 눌렀을 시)
	document.getElementById('joinBtn').onclick = function() {
		
		if(idFlag && pwFlag){
			if(!document.getElementById('userId').getAttribute('readonly')){
				alert('아이디 중복체크는 필수 입니다.');
		    return;
		}
		if(document.getElementById('userPw').value != document.getElementById('pwConfirm').value){
			alert('비밀번호 확인란을 확인하세요!');
		    return;
		}
		if(document.getElementById('userName').value === ''){
		    alert('이름은 필수값 입니다.');
		    return;
		}
		if(!document.getElementById('mail-check-btn').disabled){
		    alert('이메일 인증을 완료해 주세요.');
		    return;
		}
		if(confirm('회원가입을 진행합니다.')){
		    document.joinForm.submit();
		}
		else return;
	}
	else {
		    alert('입력값을 다시 한 번 확인하세요!');
		}
	}
	
	/*아이디 형식 검사 스크립트*/
	var id = document.getElementById("userId");
	id.onkeyup = function() {
		
		var regex = /^[A-Za-z0-9+]{4,12}$/; 
	    if(regex.test(document.getElementById("userId").value )) {
	        document.getElementById("userId").style.borderColor = "green";
	        document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";
	        idFlag =true;
	    } else {
			document.getElementById("userId").style.borderColor = "red";
	        document.getElementById("msgId").innerHTML = "부적합한 아이디 입니다.";
	        idFlag =false;
	    }
	}
	
	/*비밀번호 형식 검사 스크립트*/
	var pw = document.getElementById("userPw");
	pw.onkeyup = function(){
	    var regex = /^[A-Za-z0-9+]{8,16}$/;
	     if(regex.test(document.getElementById("userPw").value )) {
	        document.getElementById("userPw").style.borderColor = "green";
	        document.getElementById("msgPw").innerHTML = "사용가능합니다";
	        pwFlag =true;
	    } else {
			document.getElementById("userPw").style.borderColor = "red";
	        document.getElementById("msgPw").innerHTML = "올바른 비밀번호를 입력하세요";
	        pwFlag =false;
	    }
	}
	
	/*비밀번호 확인검사*/
	var pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onkeyup = function() {
	    var regex = /^[A-Za-z0-9+]{8,16}$/;
	    if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
	        document.getElementById("pwConfirm").style.borderColor = "green";
	        document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
	    } else {
			document.getElementById("pwConfirm").style.borderColor = "red";
	        document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
	    }
	}   

</script>
	<%@ include file="../include/footer.jsp" %>