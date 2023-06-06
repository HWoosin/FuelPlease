<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
          <!--
              <style>
                  @font-face {
                      font-family: 'KIMM_Bold';
                      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                      font-weight: 700;
                      font-style: normal;
      }
              </style>
      
          -->
          
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
                <div class="col-lg-6 col-md-7 col-xs-10 login-form">
                    <div class="titlebox">
                        Login
                    </div>
                    <form method="post" name="loginForm">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" name="userId" class="form-control" id="userId" placeholder="아이디">
                         </div>
                         <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" name="userPw" class="form-control" id="userPw" placeholder="비밀번호">
                         </div>
                         <div class="form-group">
                            <button type="button" id="loginBtn" class="btn btn-info btn-block">LOGIN</button>
                            <button type="button" id="joinBtn" class="btn btn-primary btn-block">JOIN OUR SERVICE</button>
                         </div>
                    </form>                
                </div>
            </div>
        </div>
    </section>
    
     <%@ include file="../include/footer.jsp" %>

<script>
    // const loginId = '${login}'
    // if(loginId !== '') {
    //     history.back();
    //     alert('이미 로그인 하셨습니다.');
    // }
    //회원 가입 완료 후 add FlashAttibute로 msg데이터가 전달되는 지 확인
    const msg = '${msg}';
    if(msg === 'joinSuccess'){
        alert('회원 가입이 완료되었습니다.');
    }
    else if(msg === 'loginFail'){
    	alert('로그인에 실패했습니다. ');
    }
    //입력란이 공백인지 아니지 확인한 수, 공백이 아니라면 Submit
    //요청 url은 //user/userLogin -> post로 간다.
    
    document.getElementById('loginBtn').onclick =function(){
        const id = document.getElementById("userId").value;
        const pw = document.getElementById("userPw").value;

        if(id === ''){
            alert('아이디를 입력해주세요');
            return;
        }
        if(pw === ''){
            alert("비밀번호를 입력해주세요")
            return;
        }
        
        document.loginForm.submit();
        
    }
    document.getElementById('joinBtn').onclick = () =>{
        location.href='${pageContext.request.contextPath}/user/userJoin';
    }


</script>