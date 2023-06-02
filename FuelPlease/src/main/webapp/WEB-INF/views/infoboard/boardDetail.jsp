<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
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
<hr>
<section style="margin-top: 80px;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-9 write-wrap">
                <div>
                    <p id="reply-titlebox">댓글</p>
                </div>
                <form class="reply-wrap">
                    <!--form-control은 부트스트랩의 클래스입니다-->
                    <div class="reply-content">
                        <div class="reply-group">
                            <div class="reply-input">
                                <input type="text" class="form-control" id="replyId" value="${login}" readonly>
                                <textarea class="form-control" rows="3" id="reply" placeholder="비방 및 욕설 등록 시 처벌 받을 수 있습니다."></textarea>
                                <!-- <input type="password" class="form-control" id="replyPw" placeholder="비밀번호"> -->
                            </div>

                            <button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
                        </div>

                    </div>
                </form>

                <!-- 댓글 리스트 -->
                <div id="replyList">

                    <!-- 
                            <div class='reply-wrap'>
                                <div class='reply-image'>
                                    <img src='${pageContext.request.contextPath}/img/profile.png'>
                                </div>
                                <div class='reply-content'>
                                    <div class='reply-group'>
                                        <strong class='left'>황우신</strong> 
                                        <small class='left'>2023/05/10</small>
                                        <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                        <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                                    </div>
                                    <p class='clearfix'>여기는 댓글영역</p>
                                </div>
                            </div>
                     -->       

                </div>
                <button type="button" class="form-control" id="moreList" style="display: none;">더보기</button>
            </div>
        </div>
    </div>
</section>

<!-- 댓글 수정,삭제 -->
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


<%@ include file="../include/footer.jsp" %>
<script>
    
    //상세보기 안 수정 버튼 권한 검사 로직
    const $form = document.modifyForm;
    
    document.getElementById('btn-modify').onclick = () => {
        if(confirm('변경 페이지로 이동합니다.')) {
            const id = '${login}';
            if(document.getElementById('writer').value === id) {
                $form.submit();
                // alert('${login}');
            } else {
                alert('본인이 작성한 글만 수정할 수 있습니다.');
            }
        } else {
            return;
        }
    } 
    // 변경 버튼 로직 끝
    
    window.onload = function() {
        
        
        // 댓글 등록하기 버튼 로직
        document.getElementById('replyRegist').onclick = () => {
            const bno = '${article.bno}';
            const reply = document.getElementById('reply').value;
            const replyId = document.getElementById('replyId').value;

            if(reply === '') {
                alert('빈 댓글은 등록이 불가능합니다.');
                return;
            }

            fetch('${pageContext.request.contextPath}/reply/regist', {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    'bno': bno,
                    'reply': reply,
                    'replyId': replyId
                })
            }).then(res => res.text())
            .then(data => {
                document.getElementById('reply').value = '';
                // document.getElementById('replyId').value = '';
                getList(1, true);
            })


        } //댓글 등록하기 로직 끝

        //더보기 버튼 로직
        document.getElementById('moreList').onclick = () => {
            getList(++page, false);
        }

        let page = 1;
        let str = '';
        const $replyList = document.getElementById('replyList');

        //상세보기에 들어올 때 댓글도 불러오기
        getList(1, true);

        function getList(pageNum, reset) {
            str = '';
            const bno = '${article.bno}';

            fetch('${pageContext.request.contextPath}/reply/getList/' + bno + '/' + pageNum)
                .then(res => res.json())
                .then(data => {
                    console.log(data);

                    let total = data.total; //총 댓글 수
                    let replyList = data.list; //댓글 리스트
                    console.log(total);
                    if(reset) {
                        while ($replyList.firstChild) {
                            $replyList.firstChild.remove();
                        }
                        page = 1;
                    }

                    if (replyList.length <= 0) return;

                    //페이지번호 * 이번 요청으로 받은 댓글 수보다 전체 댓글 개수가 작다면 더보기 버튼은 없어도 된다.
                    if(total <= page * 3) {
                        document.getElementById('moreList').style.display = 'none';
                    } else {
                        document.getElementById('moreList').style.display = 'block';
                        
                    }

                    for (let i = 0; i < replyList.length; i++) {
                        str +=
                            `<div class='reply-wrap'>
                                <div class='reply-content'>
                                    <div class='reply-group'>
                                        <strong class='left' id="reply-id" >` + replyList[i].replyId + `</strong> 
                                        <small class='left'>` + (replyList[i].updateDate != null ? parseTime(replyList[i].updateDate) + '(수정됨)' : parseTime(replyList[i].replyDate)) + `</small>
                                        <a href='` + replyList[i].rno + `' class='right replyDelete' data-id="`+ replyList[i].replyId +`"><span class='glyphicon glyphicon-remove'></span>삭제</a> &nbsp;
                                    </div>
                                    <p class='clearfix'>` + replyList[i].reply + `</p>
                                    
                                </div>
                            </div>`;
                    }
                    //id가 replyList라는 div 영역에 문자열 형식으로 모든 댓글을 추가.
                    if(!reset) {
                        document.getElementById('replyList').insertAdjacentHTML('beforeend', str);
                    } else {
                        document.getElementById('replyList').insertAdjacentHTML('afterbegin', str);
                    }


            });
            

        } //getList() end

        //댓글 삭제 로직
        document.getElementById('replyList').addEventListener('click', e => {
            e.preventDefault();
            if(!e.target.matches('a')) {
                return;
            }
            const rno = e.target.getAttribute('href');
            document.getElementById('modalRno').value = rno;
            const content = e.target.parentNode.nextElementSibling.textContent;

            const id = '${login}'; //로그인 한 id
            const replyId = e.target.dataset.id;
            console.log(id);
            console.log(replyId);

            if(id !== replyId) {
                alert('회원님이 작성하신 댓글이 아닙니다.');
                return;
            }

            const reqObj = {
                method: 'delete',
                headers: {
                    'Content-Type': 'application/json'
                }
            };

            if(e.target.classList.contains('replyDelete')) {
                console.log(rno);
                fetch('${pageContext.request.contextPath}/reply/' + rno, reqObj)
                    .then(res => res.text())
                    .then(data => {
                        console.log(data);
                        
                            alert('댓글이 삭제되었습니다.');
                            getList(1, true);
                        
                    });

            }

            /*
            //안되는 로직..
            if(e.target.classList.contains('replyModify')) {
                
                document.querySelector('.modal-title').textContent = '댓글 수정';
                document.getElementById('modalReply').style.display = 'inline'; //댓글 창
                document.getElementById('modalReply').value = content;
                document.getElementById('modalModBtn').style.display = 'inline';
                document.getElementById('modalDelBtn').style.display = 'none';
                
                //제이쿼리를 이용해서 bootstrap 모달을 여는 방법.
                // $('#replyModal').modal('show');
                
            } else {

                //삭제 버튼을 눌렀으므로 삭제 모달 형식으로 꾸며줌.
                document.querySelector('.modal-title').textContent = '댓글 삭제';
                document.getElementById('modalReply').style.display = 'none'; //댓글 창
                document.getElementById('modalModBtn').style.display = 'none';
                document.getElementById('modalDelBtn').style.display = 'inline';
                // $('#replyModal').modal('show');
            }
            */
        });





        //댓글 날짜 변환 함수
        function parseTime(regDateTime) {
            let year, month, day, hour, minute,second;
            
            if(regDateTime.length === 5) {
                [year, month, day, hour, minute, second] = regDateTime;
                second = 0;
            } else {
                [year, month, day, hour, minute, second] = regDateTime;
            }
            //원하는 날짜로 객체를 생성
            const regTime = new Date(year, month-1, day, hour, minute, second);
            console.log(regTime);
            const date = new Date();
            console.log(date);
            const gap = date.getTime() - regTime.getTime();

            let time;
            if(gap < 60 * 60 * 24 * 1000) {
                if(gap < 60 * 5 * 1000) { //5분 안으로는 방금 전
                    time = '방금 전';
                } else if(gap < 60 * 60 * 1000) {
                    time = parseInt(gap / (1000 * 60)) + '분 전';
                } else {
                    time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
                }
            } else if(gap < 60 * 60 * 24 * 30 * 1000) {
                time = parseInt(gap / (1000 * 60 * 60 * 24)) + '일 전';
            } else {
                time = `${regTime.getFullYear()}년 ${regTime.getMonth()-1}월 ${regTime.getDate()}일`;
            }
            
            return time;
        }


    } //window.onload end




</script>
