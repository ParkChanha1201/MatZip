<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a71bac8c67272654bea6640c6356142&libraries=services,clusterer,drawing"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

	var Position_X;
	var Position_Y;

	function send(y, x){
		Position_X = x;
		Position_Y = y;
		document.position.x.value = Position_X;
		document.position.y.value = Position_Y;
	}

	function move() {
		address = $("#address").val();

		$.ajax({
			url : 'https://dapi.kakao.com/v2/local/search/address.json',
			type : 'get',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Authorization",
						"KakaoAK c2964a2e8e13d5005a372fd223360446");
			},
			data : {
				"query" : address
			},
			success : function(result) {
				documents = result.documents;
				doc = documents[0];
				road_address = doc.road_address;
				x = road_address.x;
				y = road_address.y;
				
				console.log(x, y);
				map(y, x);
				send(y, x);
				//				$("body").append(result);
				//					
			}
		});
	}

	//주소를 입력
	//버튼을 누르면 주소를 위도 경도 변환 api로 넘겨줌
	//응답결과(JSON)를 분석해서 위도 경도로 입력해줌
	function map(y, x) {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new daum.maps.LatLng(y, x), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(y, x);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    

	}
</script>




<title>점심 뭐먹지</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		map(37.542168, 126.841328);
	</script>
	

	<form method="post" name = "position" action="register_rest.jsp">
		맛집이름: <input type="text" name="rest_name"> 
		주소입력: <input type="text" id="address" name="address" onblur="move()"> 
		<input type = "hidden" name = "x" value = "">
		<input type = "hidden" name = "y" value = "">
		<input type="submit" value="맛집등록" onclick = "move()">
	</form>

	


</body>
</html>
