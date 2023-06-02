<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/caraccount/carAccount.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

    <style>
        /* 모달창 조절 */
		.modal-body {
			padding: 0px;
		}

		.modal-content>.row {
			margin: 0px;
		}	

		.modal-body>.modal-con {
			padding: 15px;
		}

		.modal-inner {
			position: relative;
		}

		.modal-inner .profile {
			position: absolute;
			top: 0px;
			left: 0px;
		}

		.modal-inner .title {
			padding-left: 50px;
		}

		.modal-inner p {
			margin: 0px;
		}

    </style>

</head>
<%@ include file="../include/header.jsp"%>
<section>
	<div class="calendar-container">
		<div class="calendar">
			<div class="month">
				<i class="fas fa-angle-left prev"></i>
				<div class="date">
					<h1></h1>
					<p></p>
				</div>
				<i class="fas fa-angle-right next"></i>
			</div>
			<div class="weekdays">
				<div class="sunday">Sun</div>
				<div>Mon</div>
				<div>Tue</div>
				<div>Wed</div>
				<div>Thu</div>
				<div>Fri</div>
				<div class="saturday">Sat</div>
			</div>
			<div class="days"></div>
		</div>
	</div>
    <div class="titlefoot" style="margin:-50px 0 100px 185px;">
        <button class="btn btn-primary" id="updateBtn">등록하기</button>
    </div>
</section>

<!-- 모달 -->
<div class="modal fade" id="accountModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body row">
                <div class="modal-con col-lg-10 col-sm-20">
                    <div class="modal-inner">
                        <div class="title">
                            <p id="snsWriter">테스트</p>                           
                        </div>
                        <div class="content-inner">
                            <p id="snsContent">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                                vulputate elit libero, quis mattis enim tincidunt non. Mauris consequat ante vel
                                urna posuere consequat. </p>
                        </div>
                        <div class="link-inner">
                            <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
                            <a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>
                            <a href="##"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a>
                        </div>
                        <button class="btn btn-primary" id="closeBtn">나가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/caraccount/carAccount.js"></script>

<script>
    document.querySelector('#updateBtn').addEventListener('click', function() {
        $('#accountModal').modal('show');
    });

    document.querySelector('.modal').addEventListener('click', (e) => {
        if(e.target === this){
            $('#accountModal').modal('hide');
        }
    });

    document.querySelector('#closeBtn').addEventListener('click', function(){
        $('#closeBtn').modal('hide');
    });


</script>