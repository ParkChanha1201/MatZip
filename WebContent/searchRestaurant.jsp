<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a71bac8c67272654bea6640c6356142&libraries=services,clusterer,drawing"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>


<script>

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

<title>맛집지도</title>
</head>
<body>

<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		map(37.542168, 126.841328);
	</script>
	
<%
try {
	DBManager db = DBManager.getInstance();
	Connection con = db.open();

	String sql = "select * from restaurant";
	PreparedStatement stmt = con.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();

%>	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.542168, 126.841328), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [{
	title: "상공회건물",
	latlng: new daum.maps.LatLng(37.542168, 126.841328)			
}];
	
	</script>
	
<%	
	while(rs.next()){
		int rest_id = rs.getInt("rest_id");
		String rest_name = rs.getString("rest_name");
		double x = rs.getDouble("x");
		double y = rs.getDouble("y");
%>		
	<script>
	var place = {
			title: '<%=rest_name%>',
			latlng: new daum.maps.LatLng('<%=y%>', '<%=x%>')			
		}
	positions.push(place);
	
	</script>		
<%		
	}
	
%>
	<script>
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
		
	</script>
<%

} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>

</body>
</html>