<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>

</head>
<body>
	<!-- <p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
				혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
		</em>
	</p> -->

	<h2>전기차 충전소 찾기</h2>
	<div id="map" style="width: 100%; height: 700px;"></div>

	<div>
		<select class="form-control input-sm sel" id="selectCounty" name="selectCounty">
			<option >강남구</option>
			<option >강동구</option>
			<option >강서구</option>
			<option >강북구</option>
			<option >관악구</option>
			<option >광진구</option>
			<option >구로구</option>
			<option >금천구</option>
			<option >노원구</option>
			<option >동대문구</option>
			<option >도봉구</option>
			<option >동작구</option>
			<option >마포구</option>
			<option >서대문구</option>
			<option >성동구</option>
			<option >성북구</option>
			<option >서초구</option>
			<option >송파구</option>
			<option >영등포구</option>
			<option >용산구</option>
			<option >양천구</option>
			<option >은평구</option>
			<option >종로구</option>
			<option >중구</option>
			<option >중랑구</option>
		</select>
		<!-- <input type="text" id="selectCity" placeholder="입력"> -->
		<select class="form-control input-sm sel" id="selectLoad" name="selectLoad">
			<option >도로명을 선택해주세요</option>
		</select>
		<button type="button" id="searchBtn">검색</button>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=405e0d5fd34220069ac5fe74d4c49e23&libraries=services"></script>
	<script>
		//키워드 넘기기
		document.getElementById('selectCounty').onclick =function(){
			document.getElementById('selectLoad').replaceChildren();
			var opt = document.createElement('option')
			opt.textContent = '도로명을 선택해주세요';
			document.getElementById('selectLoad').appendChild(opt);
		}

		document.getElementById('selectCounty').onchange =function(){
			let selectCounty = document.getElementById('selectCounty').value;
			console.log(selectCounty);

			fetch('${pageContext.request.contextPath}/mapview/elecChargeMap', {

			method: 'post',
			headers: {
			   'Content-type':'text/plain'

				},
			body : selectCounty
	   		})
			.then(res =>res.json())
			.then(data=>{
				console.log(data);
				console.log(data[0]);
				for(var i=0; i <= data.length; i++){
					var opt = document.createElement('option')
					opt.textContent = data[i];
					opt.setAttribute('value', data[i])
					document.getElementById('selectLoad').appendChild(opt);
				}
				
			})
		}







		//카카오지도에서 검색하기 시작
		var selectCounty = document.getElementById('selectCounty');
		var searchIn = document.getElementById('selectLoad');//검색input
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		document.getElementById('searchBtn').onclick= function(){
			var searchSpot = searchIn;
			// console.log(searchIn.value);
			// console.log(searchSpot.value);
			// console.log(selectCounty.value + searchIn.value);
		geocoder
				.addressSearch(
					selectCounty.value + searchIn.value,
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});


		//서치버튼 클릭
		
			
		// }

		
			
			
		}
	</script>
</body>
</html>