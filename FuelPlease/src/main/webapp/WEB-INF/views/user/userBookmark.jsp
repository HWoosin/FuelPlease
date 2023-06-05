<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<style>
    #bookbox {
        border: 3px solid black;
        width: 300px;
        height: 300px;
        overflow: scroll;
    }
</style>

<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>

</head>

<body>
    <!-- <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p> -->
    <h2>즐겨찾는 장소</h2>
    <div id="bookbox">

    </div>

    <h2>장소 정보</h2>
    <div>
        <p id="addr"></p>
        <p id="tel"></p>
        <p id="name"></p>
    </div>

    <div id="map" style="width: 40%; height: 350px;"></div>

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
                    for (var i = 0; i <= data.length; i++) {
                        var opt = document.createElement('a')
                        opt.textContent = data[i];
                        opt.style.display = 'block';
                        opt.setAttribute('value', data[i]);
                        selectBook.appendChild(opt);


                    }

                })
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
        

        document.getElementById('bookbox').onclick = function (e) {
            document.getElementById('addr').textContent=''
            document.getElementById('tel').textContent=''
            document.getElementById('name').textContent=''

            e.preventDefault();
            if (!e.target.matches('a')) {
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
                    document.getElementById('addr').textContent=data.bkaddr
                    document.getElementById('tel').textContent=data.bktel
                    document.getElementById('name').textContent=data.bkname

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
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    });
        }
    </script>
</body>

</html>