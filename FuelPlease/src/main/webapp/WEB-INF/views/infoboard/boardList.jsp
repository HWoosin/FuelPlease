<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>

	<section>
		<div class="container-fluid">
			<div class="row">
				<!--lg에서 9그리드, xs에서 전체그리드-->
				<div class="col-lg-9 col-xs-12 board-table">
					<div class="titleBoard">
						<h1>자유게시판</h1>
					</div>

					<!--form select를 가져온다 -->
					<form action="<c:url value='/infoboard/boardList' />">
						<div class="searchB-wrap">
							<select name="condition" class="form-control search-select" style="justify-content: center; align-items: center; display: flex;">
								<option value="title"
								${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
								<option value="content"
								${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
								<option value="writer"
								${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
								<option value="titleContent"
								${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
							</select>
							<input type="text" name="keyword"
								class="form-control search-input" value="${pc.paging.keyword}">
							<button type="submit" class="btn btn-info search-btn" id="boardSearch">검색</button>
						</div>
					</form>

					<table class="table table-bordered" style="justify-content: center; align-items: center;">
						<thead>
							<tr>
								<th>번호</th>
								<th class="board-title">제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="vo" items="${infoBoardList}">
								<tr>
									<td>${vo.bno}</td>
									<td><a
										href="${pageContext.request.contextPath}/infoboard/content/${vo.bno}?pageNum=${pc.paging.pageNum}&cpp=${pc.paging.cpp}&keyword=${pc.paging.keyword}&condition=${pc.paging.condition}">${vo.title}</a>
										&nbsp; <strong>[${vo.replyCnt}]</strong></td>
									<td>${vo.writer}</td>
									<td><fmt:parseDate value="${vo.WDate}"
											pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime"
											type="both" /> <fmt:formatDate value="${parsedDateTime}"
											pattern="yyyy년 MM월 dd일 HH시 mm분" /></td>
									<td><fmt:parseDate value="${vo.UDate}"
											pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedUpDateTime"
											type="both" /> <fmt:formatDate value="${parsedUpDateTime}"
											pattern="yyyy년 MM월 dd일 HH시 mm분" /></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>


					<!--페이지 네이션을 가져옴-->
					<form
						action="${pageContext.request.contextPath}/infoboard/boardList"
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
								onclick="location.href='${pageContext.request.contextPath}/infoboard/regist'">글쓰기</button>
						</div>


						<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
						<input type="hidden" name="cpp" value="${pc.paging.cpp}">
						<input type="hidden" name="keyword" value="${pc.paging.keyword}">
						<input type="hidden" name="condition" value="${pc.paging.condition}">

					</form>

				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp" %>

	<script>
		window.onload = function() {
			document.getElementById('pagination').addEventListener('click', e => {
				e.preventDefault(); 
				if(!e.target.matches('a')) {
                    return;
                }

                const value = e.target.dataset.pagenum;
				document.pageForm.pageNum.value = value;
                document.pageForm.submit();
			})






		} //window.onload end


	</script>



