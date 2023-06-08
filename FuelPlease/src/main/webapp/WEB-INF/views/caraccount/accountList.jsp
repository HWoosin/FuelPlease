<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>


<!-- 차계부 리스트 -->
<section>
	<div class="container-fluid" style="height: 818px;">
		<div class="row">

			<div class="col-lg-6 col-xs-12 board-table">
				<div class="titleBoard">
					<h1>나만의 차계부</h1>
				</div>
				<table class="table table-bordered accountList" style="justify-content: center; align-items: center;">
					<thead>
						<tr class="ac-num">
							<th>번호</th>
							<th>일자</th>
							<th>주유타입</th>
							<th>가격</th>
							<th>비고</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="priceTotal" value="0" />
						<c:forEach var="vo" items="${accountList}">
							<tr class="ac-col">
								<td>${vo.acno}</td>
								<td>${vo.year}/${vo.month}/${vo.day}</td>
								<td>${vo.type}</td>
								<td>${vo.price} 원</td>
								<td>${vo.note}</td>
								<td>
									<button type="button" class="btn btn-info delete-btn deleteBtn">삭제</button>
								</td>
							</tr>
							<c:set var="priceTotal" value="${priceTotal + vo.price}" />
						</c:forEach>

						<!-- 사용금액 합계 사용 부분 -->
						<tr>
							<th colspan="3">페이지 사용 금액 합계</th>
							<th colspan="3" class="price-column">${priceTotal} 원</th>
						</tr>
					</tbody>

				</table>

				<button type="button" class="btn btn-info write-btn"
					onclick="location.href='${pageContext.request.contextPath}/caraccount/regist'">작성하기</button>


				<!-- 페이지 네이션을 가져옴 -->
				<form action="${pageContext.request.contextPath}/caraccount/accountList" name="pageForm">
					<div class="text-center">
						<ul id="pagination" class="pagination pagination-sm">
							<c:if test="${apc.prev}">
								<li><a href="#" data-pagenum="${apc.beginPage-1}">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${apc.beginPage}" end="${apc.endPage}">
								<li class="${apc.paging.pageNum == num ? 'active' : ''}"><a href="#"
										data-pagenum="${num}" id="nextPage">${num}</a></li>
							</c:forEach>

							<c:if test="${apc.next}">
								<li><a href="#" data-pagenum="${apc.endPage+1}">다음</a></li>
							</c:if>

						</ul>
					</div>

					<input type="hidden" name="pageNum" value="${apc.paging.pageNum}">
					<input type="hidden" name="cpp" value="${apc.paging.cpp}">
				</form>

			</div>
		</div>
	</div>
</section>
<!-- 차계부 리스트 끝 -->

<script>
	window.onload = function () {

		document.getElementById('pagination').addEventListener('click', e => {
			e.preventDefault();
			if (!e.target.matches('a')) {
				return;
			}

			const value = e.target.dataset.pagenum;
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});

		document.querySelectorAll('.delete-btn').forEach(btn => {
			btn.addEventListener('click', e => {
				console.log(e.target.parentNode.parentNode.firstElementChild.textContent);
				const acno = e.target.parentNode.parentNode.firstElementChild.textContent;
				if (confirm('삭제 하시겠습니까?')) {
					fetch('${pageContext.request.contextPath}/caraccount/delete', {
							method: 'post',
							headers: {
								'Content-Type': 'application/json'
							},
							body: acno
						})
						.then(res => res.text())
						.then(data => {
							if (data === 'deleteSuccess') {
								alert('삭제 되었습니다.');
							} else {
								alert('삭제 실패');
								return;
							}
						});
				}
				window.location.reload(true);
			});
		});
	}
</script>


<%@ include file="../include/footer.jsp" %>