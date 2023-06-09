<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div style="height: 608px; margin: 100px 300px 300px 950px;">
        <div>
            <img src="${pageContext.request.contextPath}/img/404.png/" alt="logo" style="width: 500px;">
        </div>
        <div>
            <h1>찾으시는 페이지가 없습니다.</h1>
            <p>
                잘못된 접근이거나 요청하신 페이지를 찾을 수 없습니다.
                <br>
                입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
            </p>
        </div>


    </div>
</body>
</html>