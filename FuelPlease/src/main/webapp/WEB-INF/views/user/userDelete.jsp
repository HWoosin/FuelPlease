<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                         <div class="form-group">
                            <button type="button" id="delBtn" class="btn btn-info btn-block">탈퇴</button>
                         </div>
                    </form>                
                </div>
            </div>
        </div>
    </section>
    
<script>
    
    document.getElementById('delBtn').onclick =function(){
        const pw = document.getElementById("userPw").value;
        
        if(pw === ''){
            alert("비밀번호를 입력해주세요")
            return;
        }
        
        document.deleteForm.submit();
        
    }

</script>