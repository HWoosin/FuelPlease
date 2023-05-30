<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fuelplease</title>
</head>
<body>


<section>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-9 write-wrap">
                <div class="titlebox">
                    <p>상세보기</p>
                </div>

                <form action="<c:url value='/infoboard/modify' />" method="post" name="modifyForm">
                    <div>
                        <label>DATE</label>
                        <c:if test="${article.UDate == null}">
                            <p>
                                <fmt:parseDate value="${article.WDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                    var="parsedDateTime" type="both" />
                                <fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
                            </p>
                        </c:if>
                        <c:if test="${article.UDate != null}">
                            <p>
                                <fmt:parseDate value="${article.UDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                    var="parsedDateTime" type="both" />
                                <fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
                            </p>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label>번호</label>
                        <input class="form-control" name="bno" value="${article.bno}" readonly>
                    </div>
                    <div class="form-group">
                        <label>작성자</label>
                        <input class="form-control" name="writer" value="${article.writer}" id="writer" readonly>
                    </div>
                    <div class="form-group">
                        <label>제목</label>
                        <input class="form-control" name="title" value="${article.title}" readonly>
                    </div>

                    <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
                    </div>

                    <button type="button" class="btn btn-primary" id="btn-modify" >변경</button>
                    <button type="button" class="btn btn-dark"
                        onclick="location.href='${pageContext.request.contextPath}/infoboard/boardList?pageNum=${p.pageNum}&cpp=${p.cpp}&keyword=${p.keyword}&condition=${p.condition}'">목록</button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- 댓글 영역 시작부분 -->
<section style="margin-top: 80px;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-9 write-wrap">
                <form class="reply-wrap">
                    <div class="reply-image">
                        <img src="${pageContext.request.contextPath}/img/profile.png">
                    </div>
                    <!--form-control은 부트스트랩의 클래스입니다-->
                    <div class="reply-content">
                        <textarea class="form-control" rows="3" id="reply"></textarea>
                        <div class="reply-group">
                            <div class="reply-input">
                                <input type="text" class="form-control" id="replyId" placeholder="이름">
                                <!-- <input type="password" class="form-control" id="replyPw" placeholder="비밀번호"> -->
                            </div>

                            <button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
                        </div>

                    </div>
                </form>

                <!--여기에 접근 반복-->
                <div id="replyList">

                    <!-- 자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현. -->
                            <div class='reply-wrap'>
                                <div class='reply-image'>
                                    <img src='${pageContext.request.contextPath}/img/profile.png'>
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
                            

                </div>
                <button type="button" class="form-control" id="moreList" style="display: none;">더보기(페이징)</button>
            </div>
        </div>
    </div>
</section>

<script>
    //상세보기 안 수정 버튼 권한 검사 로직
    const $form = document.modifyForm;

    
    document.getElementById('btn-modify').onclick = () => {
        if(confirm('변경 페이지로 이동합니다.')) {
            const id = '${login}';
            if(document.getElementById('writer').value === id) {
                $form.submit();
                alert('${login}');
            } else {
                alert('본인이 작성한 글만 수정할 수 있습니다.');
            }
        } else {
            return;
        }
    }




</script>

</body>
</html>