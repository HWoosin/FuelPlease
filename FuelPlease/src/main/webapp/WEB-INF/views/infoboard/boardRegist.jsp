<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp" %>

 <section>
       <div class="container" style="height: 588px;">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox">
                        <p>자유게시판</p>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/infoboard/regist" method="post">
	                    <table class="table">
	                        <tbody class="regist-board">
	                            <tr>
	                                <td class="t-title">작성자</td>
	                                <td><input class="form-control input-sm" name="writer" value="${login}" readonly></td>
	                            </tr>
	                            <tr>
	                                <td class="t-title">제목</td>
	                                <td><input class="form-control input-sm" name="title"></td>
	                            </tr>
	                            <tr>
	                                <td class="t-title">내용</td>
	                                <td>
	                                <textarea class="form-control" rows="7" name="content"></textarea>
	                                </td>                 
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="titlefoot">
	                        <button class="btn" type="submit">등록</button>
	                        <button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/infoboard/boardList'">목록</button>
	                    </div>
                    </form>
                    
                </div>
            </div>    
       </div>
    </section>

	<%@ include file="../include/footer.jsp" %>