<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>


<!-- 차계부 리스트 -->
<section>
	<div class="container-fluid">
		<div class="row">

			<div class="col-lg-6 col-xs-12 board-table" style=" margin-bottom: 100px;">
				<div class="titleBoard">
					<h1>나만의 차계부</h1>
				</div>
				<table class="table table-bordered"
					style="justify-content: center; align-items: center; text-align: center; min-width: 1050px;">
					<thead>
						<tr>
							<th style="width: 7%;">번호</th>
							<th style="width: 13%;">일자</th>
							<th style="width: 10%;">주유타입</th>
							<th style="width: 20%;">가격</th>
							<th style="width: 40%;">비고</th>
							<th style="width: 10%;"></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="priceTotal" value="0" />
						<c:forEach var="vo" items="${accountList}">
							<tr class="ac-col">
								<td>${vo.acno}</td>
								<td>${vo.year}/${vo.month}/${vo.day}</td>
								<td>${vo.type}</td>
								<td id="addPrice">${vo.price} 원</td>
								<td>${vo.note}</td>
								<td>
									<button type="button" class="btn btn-info delete-btn deleteBtn">삭제</button>
								</td>
							</tr>
							<c:set var="priceTotal" value="${priceTotal + vo.price}" />
						</c:forEach>

						<!-- 사용금액 합계 사용 부분 -->
						<c:if test="${total != null}">
							<tr>
								<th colspan="3">내가 주유한 총 금액</th>
								<th colspan="3" style="display: none;">${total}</th>
								<th colspan="3" id="realTotal"></th>
							</tr>
						</c:if>
						<c:if test="${total == null}">
							<tr>

							</tr>
						</c:if>

						<c:if test="${avg != null}">
							<tr>
								<th colspan="3">나의 평균 주유비용</th>
								<th colspan="3" style="display: none;">${avg}</th>
								<th colspan="3" id="realAvg"></th>
							</tr>
						</c:if>
						<c:if test="${avg == null}">
							<tr>

							</tr>
						</c:if>

					</tbody>

				</table>

				<button type="button" class="btn btn-info write-btn"
					onclick="location.href='${pageContext.request.contextPath}/caraccount/regist'">작성하기</button>


				<!-- 페이지 네이션을 가져옴 -->
				<form action="${pageContext.request.contextPath}/caraccount/accountList" name="pageForm">
					<div class="text-center">
						<ul id="pagination" class="pagination pagination-sm" style="margin: -30px auto 0;">
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

		const total = '${total}';
		const avg = '${avg}';

		console.log(total.replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		document.getElementById('realTotal').textContent = total.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' 원';
		document.getElementById('realAvg').textContent = avg.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' 원';

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