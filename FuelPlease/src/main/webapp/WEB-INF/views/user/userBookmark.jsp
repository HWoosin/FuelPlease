<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Fuel Please</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">

    <!-- Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">
    <!--
          <style>
              @font-face {
                  font-family: 'KIMM_Bold';
                  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                  font-weight: 700;
                  font-style: normal;
  }
          </style>
  
      -->

    <!-- Vendor CSS Files -->
    <!--  <link href="/vendor/aos/aos.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath }/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: MyResume
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>
    <!-- <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p> -->
<div class="gasTitle">
    <h2>나의 즐겨찾는 장소</h2>
</div>


<div id="bookdiv">

    
    <div class="mapBox">
        <div id="map" ></div>
        <div class="bookInfo" style="width: 30%; height: 650px; display: flex;">
            <div class="bookInfotxt">
                <h2>장소 정보</h2>
                <p id="addr">→</p>
                <p id="tel">→</p>
                <p id="name">→</p>
                <div>
                    <button type="button" id="searchBtn">즐겨찾기 삭제</button>
                </div>
                <div id="bookbox">
                    <br>
                </div>
            </div>
        </div>
    </div>


</div>

    <%@ include file="../include/footer.jsp" %>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=405e0d5fd34220069ac5fe74d4c49e23&libraries=services"></script>
    <script>
        window.onload = function () {
            let selectBook = document.getElementById('bookbox');

            fetch('${pageContext.request.contextPath}/user/userBookmark', {

                    method: 'post'
                })
                .then(res => res.json())
                .then(data => {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        var opt = document.createElement('a')
                        var hr = document.createElement('hr')
                        opt.textContent = data[i];
                        opt.style.display = 'block';
                        opt.setAttribute('value', data[i]);
                        selectBook.appendChild(opt);
                        selectBook.appendChild(hr);

                    }

                })
        }

        document.getElementById('searchBtn').onclick = function () {
            let selectBook = document.getElementById('bookbox');
            let addr = document.getElementById('addr').textContent;
            if (addr === '→') {
                alert('삭제할 목록을 선택해주세요')
            } else {
                if (confirm('삭제하시겠습니까?')) {
                    fetch('${pageContext.request.contextPath}/user/deleteBookmark', {
                            method: 'post',
                            headers: {
                                'Content-type': 'text/plain'

                            },
                            body: addr
                        })
                        .then(res => res.text())
                        .then(data => {
                            location.href = '${pageContext.request.contextPath}/user/userBookmark';
                        })
                            // console.log(data);

                    //         fetch('${pageContext.request.contextPath}/user/userBookmark', {

                    //                 method: 'post'
                    //             })
                    //             .then(res => res.json())
                    //             .then(list => {
                    //                 // console.log(list);
                    //                 selectBook.replaceChildren();
                    //                 for (var i = 0; i <= list.length; i++) {
                    //                     var opt = document.createElement('a');
                    //                     var hr = document.createElement('hr');
                    //                     opt.textContent = list[i];
                    //                     opt.style.display = 'block';
                    //                     opt.setAttribute('value', list[i]);
                    //                     selectBook.appendChild(opt);
                    //                     selectBook.appendChild(hr);
                    //                 }

                    //             })

                    //     })
                    // document.getElementById('addr').textContent = '→';
                    // document.getElementById('tel').textContent = '→';
                    // document.getElementById('name').textContent = '→';
                }
            }
        }

        //카카오 지도
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.552547047528066, 126.93795228439572), // 지도의 중심좌표
                level: 3
                // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // const $selectAddr = document.getElementById('selectAddr');

        //장소 선택
        document.getElementById('bookbox').onclick = function (e) {
            document.getElementById('addr').textContent = '';
            document.getElementById('tel').textContent = '';
            document.getElementById('name').textContent = '';

            e.preventDefault();
            if (!e.target.matches('a')) {
                document.getElementById('addr').textContent = '→';
                document.getElementById('tel').textContent = '→';
                document.getElementById('name').textContent = '→';
                return;
                
            }
            console.log(e.target.textContent); // 클릭한 값을 가져옴 이걸 넘길꺼임

            fetch('${pageContext.request.contextPath}/user/showBookmark', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json'

                    },
                    body: e.target.textContent
                })
                .then(res => res.json())
                .then(data => {
                    console.log(data);
                    document.getElementById('addr').textContent = data.bkaddr;
                    document.getElementById('tel').textContent = data.bktel;
                    document.getElementById('name').textContent = data.bkname;

                })

            // fetch('${pageContext.request.contextPath}/user/showBookmark', {
            //         method: 'post',
            //         headers: {
            //             'Content-type': 'text/plain'

            //         },
            //         body: e.target.
            //     })
            //     .then(res => res.json())
            //     .then(data => {
            //         console.log(data);
            //         for (var i = 0; i <= data.length; i++) {
            //             var opt = document.createElement('a')
            //             opt.textContent = data[i];
            //             opt.style.display = 'block';
            //             opt.setAttribute('value', data[i]);
            //             selectBook.appendChild(opt);


            //         }

            //     })
            addr = e.target.textContent;
            // console.log(addr);

            // 주소로 좌표를 검색합니다
            geocoder
                .addressSearch(
                    addr,
                    function (result, status) {

                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y,
                                result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">즐겨찾는 장소</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    });
        }
    </script>
</body>