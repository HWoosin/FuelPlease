<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>

<section>
		<div class="container-fluid">
			<div class="row">
				<!--lg에서 9그리드, xs에서 전체그리드-->
				<div class="col-lg-9 col-xs-12 board-table">
					<div class="titleBoard">
						<h1>Fuel Please 차계부</h1>
					</div>
					<table class="table table-bordered" style="justify-content: center; align-items: center;">
						<thead>
							<tr>
                                <th>번호</th>
								<th>일자</th>
                                <th>주유타입</th>
								<th>가격</th>
                                <th>비고</th>
                                <th>삭제</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach var="vo" items="${accountList}">
								<tr>
                                    <td>${vo.acno}</td>
									<td>${vo.year}/${vo.month}/${vo.day}</td>
									<td>${vo.type}</td>
                                    <td>${vo.price}</td>  
                                    <td>${vo.note}</td>
                                    <td>
                                        <button type="button" class="btn btn-info write-btn" id="deleteBtn">삭제</button>
                                    </td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					
					<button type="button" class="btn btn-info write-btn"
								onclick="location.href='${pageContext.request.contextPath}/caraccount/regist'">작성하기</button>


					<!--페이지 네이션을 가져옴-->
					<!-- <form
						action="${pageContext.request.contextPath}/caraccount/accountList"
						name="pageForm">
						<div class="text-center">
							<ul id="pagination" class="pagination pagination-sm">
								<c:if test="${pc.prev}">
									<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
								</c:if>

								<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
									<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
										href="#" data-pagenum="${num}" id="nextPage">${num}</a></li>
								</c:forEach>

								<c:if test="${pc.next}">
									<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
								</c:if>
								
							</ul>
							<button type="button" class="btn btn-info write-btn"
								onclick="location.href='${pageContext.request.contextPath}/caraccount/regist'">작성하기</button>
						</div>


						<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
						<input type="hidden" name="cpp" value="${pc.paging.cpp}">
						<input type="hidden" name="keyword" value="${pc.paging.keyword}">
						<input type="hidden" name="condition" value="${pc.paging.condition}">

					</form> -->

				</div>
			</div>
		</div>
	</section>

    <script>
        document.querySelector('#deleteBtn').addEventListener('click', e => {
            console.log(e.target.parentNode.parentNode.firstElementChild.value);
            const acno = e.target.parentNode.parentNode.firstElementChild.value;
            if(confirm('삭제하시겠습니까?')){
                fetch('${pageContext.request.contextPath}/caraccount/delete', {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: acno
                })
                .then(res => res.text())
                .then(data => {
                    console.log(data);
                    alert('삭제되었습니다.');                    
                });
            }            
        })

    </script>

<%@ include file="../include/footer.jsp" %>
