<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7 col-xs-10 login-form">
                    <div class="titlebox">
                       	회원탈퇴
                    </div>
                    <form method="post" name="deleteForm">
                         <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" name="userPw" class="form-control" id="userPw" placeholder="비밀번호">
                         </div>
                         <span id="msgId"></span>
                         <div class="form-group">
                            <button type="button" id="delBtn" class="btn btn-info btn-block">탈퇴</button>
                         </div>
                    </form>                
                </div>
            </div>
        </div>
    </section>
	<%@ include file="../include/footer.jsp" %>
<script>
	// const loginId = '${login}'
    // console.log(loginId);
    // if(loginId === '') {
    //     history.back();
    //     alert('로그인 후 이용가능합니다.');
    // }
	
	const msg = document.getElementById('msgId');
    document.getElementById('delBtn').onclick =function(){
        const pw = document.getElementById("userPw").value;
        if(pw === ''){
            alert("비밀번호를 입력해주세요")
            return;
        }
        else{

            fetch('${pageContext.request.contextPath}/user/userDelete', {
                method: 'post',
                headers: {
                'Content-type':'text/plain'
                },
                body : pw
            })
            .then(res =>res.text())//요청 완료 후 응답 정보에서 텍스트만 빼기
                .then(data => {//텍스트만 뺀 Promise 객체로부터 data전달받음.
                    if(data === '1'){
                        if(confirm('정말 탈퇴하시겠습니까?')) {
                            console.log(data);
                            alert("탈퇴가 완료되었습니다.");
                            location.href='${pageContext.request.contextPath}/';
                        }
                    }
                    else{
                        console.log(data);
                        console.log(pw);
                        document.getElementById("userPw").value = '';
                        msg.textContent = '비밀번호 불일치';
                    }
                });
        }
        
        
                
        
        
    }

</script>