<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Fuel Please</title>

</head>

<body>
    <% String key = request.getParameter("searchWord");  %>
    <div class="gasTitle">
        <h2>내가 입력한 검색어 <br><p id="key" style="color: black;"><br><%=key%></p>
        </h2>
    </div>

    <div class="mapBox">
        <div id="map" style="width: 40%; height: 650px;"></div>
        <div class="mapInfo" style="width: 28%; height: 650px; display: flex;">
            <div class="mapInfotxt">
                <h2>다른 검색어 입력하기</h2>
                <hr>
                <form id="home-search-bar" action="${pageContext.request.contextPath}/mapview/searchResult"
                    method="get">
                    <input type="text" id="reSearch" name="searchWord">
                    <button type="submit" id="searchBtn">검색</button>
                </form>
                <hr> <br>
                <h2>길찾기</h2>
                <hr>
                <p id="mark-click"></p>
                <button class="kakao-map" id="searchBtn">카카오 맵으로 길찾기</button>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=405e0d5fd34220069ac5fe74d4c49e23&libraries=services"></script>
    <script>
        const searchWord = document.getElementById('key').textContent;
        console.log(searchWord);




        // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
        var infowindow = new kakao.maps.InfoWindow({
            zIndex: 1
        });

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.552547047528066, 126.93795228439572), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

        // 키워드로 장소를 검색합니다
        ps.keywordSearch(searchWord, placesSearchCB);

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });

            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name +
                    '</div>');
                infowindow.open(map, marker);
                // console.log(place.place_name);
                document.getElementById('mark-click').textContent = place.place_name;
            });
        }


        document.getElementById('searchBtn').onclick = () => {
            const word = document.getElementById('reSearch').value.split(' ').join(''); //공백 제거한 검색어
            if(word === '') {
                alert('검색어에 빈칸만 입력할 수 없습니다.');
                document.getElementById('searchBtn').setAttribute('type', 'button');
                return;
            }
            if (document.getElementById('reSearch').value === '') {
				document.getElementById('searchBtn').setAttribute('type', 'button');
				alert('검색어를 입력하세요!');
				return;
			} else {
				document.getElementById('searchBtn').setAttribute('type', 'submit');
				return;
			}


            const reSearch = document.getElementById('reSearch').value;
            console.log(reSearch);

        }

        //경위도 추출하는 로직
        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng;
            // console.log('클릭한 위치의 위도는 ' + latlng.getLat());
            // console.log('경도는 ' + latlng.getLng());


        }); //경위도 추출하는 로직 끝
        let addrName;
        // let lat;
        // let lng;
        // document.getElementById('mark-click').onclick = (e) => {
        //     console.log(e.target.textContent);
        //     console.log(map.getCenter().getLat()); 
        //     console.log(map.getCenter().getLng()); 

        //     addrName = e.target.textContent;
        //     lat = map.getCenter().getLat();
        //     lng = map.getCenter().getLng();

        //     // location.href = 'https://map.kakao.com/link/to/' + addrName + ',' + lat + ',' + lng;

        // }

        document.querySelector('.kakao-map').onclick = function () {
            addrName = document.getElementById('mark-click').textContent;
            if(addrName === '') {
                alert('검색 결과에 나온 마크를 클릭 후 이용 가능합니다.')
                return;
            }
            // lat = map.getCenter().getLat();
            // lng = map.getCenter().getLng();
            console.log(addrName);
            // console.log(lat);
            // console.log(lng);
            location.href = 'https://map.kakao.com/link/search/' + addrName;
        }



    </script>
</body>

</html>