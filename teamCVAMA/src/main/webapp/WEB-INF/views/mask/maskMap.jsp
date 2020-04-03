<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마스크</title>
<style>
.infoScroll{
	position:absolute;
	width:506px;
	height:806px;
	padding-top: 5px;
	z-index:6;
	background-color:white;
	display:none
}
.rightScroll{
	position:absolute;
	right:0%;
	width:506px;
	height:806px;
	padding-top: 5px;
	z-index:6;
	background-color:black;
	display:none
}
.infoContainer{
	width:496px;
	height:796px;
	background-color:white
}
.rightContainer{
	background-color:#A9D0F5
}
.infoInner{
	margin:8px 2px 5px 2px
}
.infoInner-title{
	font-weight:bolder
}
.labelStr{
	font-weight:bold
}
.timeLabelStr{
	font-size: 9pt
}
.infoInner-timeline{
	position: relative;
	height: 100px
}
.loading{
	margin-left:220px;
	margin-top:20px
}
.timeLine{
	position: absolute;
	z-index: 20;
	top: 15px;
	height: 100px;
	width: 462px;
}
.timeBtn{
	margin-left: 12px
}
.smallInput{
	width:80px;
	z-index:25
}
.longInput{
	width:380px;
	height:52px;
	z-index:25;
	resize: none
}
.sendIcon{
	position: absolute;
	top:27px;
	left:370px;
	z-index:30
}
.replyContainer{
	position: absolute;
	width:464px;
	top: 270px
}
.replyPaging{
	position: absolute;
	width: 460px;
	top: 470px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold
}
.active{
	color: blue
}
.replyLine{
	margin: 2px
}
.delInputSpan{
	position:relative;
}
.delDiv{
	position:absolute;
	left:1px;
	top:-1px;
	padding: 3px;
	background-color:black;
	z-index:50
}
.delInput{
	width:100px;
}
.delBtn{
	width:100px;
}
.closeBtn,
.closeBtnStart{
	position:absolute;
	top:9px;
	right:15px;
	font-size: 24px
}
.favBtnSpan{
	position:absolute;
	top:15px;
	right:50px;
	font-size: 17px
}
.closeBtnRight{
	position:absolute;
	top:9px;
	left:15px;
  font-size:24px
}
.homeBtnDiv{
	position:absolute;
	top:70px;
	left:1%;
	z-index:5;
	font-size:24px;
	color:#0174DF
}
.favBtnDiv{
	position:absolute;
	top:70px;
	right:1%;
	z-index:5;
	font-size:24px;
	color:#0174DF
}
.favTitle{
	height: 42px;
	padding-left: 100px
}
.infoInner-favAdd{
	font-weight: bolder;
	font-size: 20pt
}
.favLine{
	margin-bottom: 3px;
	padding: 3px;
	border: thin solid black
}
.favGoToBtn{
	position: absolute;
	top: 10px;
	left: 10px;
	font-size: 30px
}
.favLineMiddleSecond{
	height:43px
}
.favMoveUpBtn{
	position: absolute;
	top: 4px;
	left: 20px;
	font-size: 20px
}
.favMoveDownBtn{
	position: absolute;
	top: 30px;
	left: 20px;
	font-size: 20px
}
.locSearch{
	position:absolute;
	top:437px;
	left:50%;
	font-size:24px;
	color:blue;
	z-index:5
}
.locSearch:hover{
	transform: scale(1.2);
	cursor: pointer
}
.searchBtn{
	 font-size:15pt;
	 font-weight:bolder;
	 text-align:center
}
.addrSearchDiv{
	position:absolute;
	width:400px;
	top:65px;
	left:50%;
	margin-left: -200px;
	z-index:5
}
.infoContent{
	text-align: center;
	font-size: 12pt;
	font-weight: bolder;
	padding: 4px
}
.legend{
	position:absolute;
	top:820px;
	left:50%;
	margin-left:-239px;
	z-index:5
}
#map{
	width:100%;
	height:806px;
	z-index:0
}
.closeBtn:hover,
.closeBtnRight:hover,
.closeBtnStart:hover,
.homeBtn:hover,
.rightScrollBtn:hover,
.pageBtn:hover:not(.active),
.repDelBtn:hover,
.sendIcon:hover,
.favBtnSpan:hover,
.favGoToBtn:hover,
.favMoveUpBtn:hover,
.favMoveDownBtn:hover{
	cursor:pointer
}
img:hover:not(.nonMarker){
	transform: scale(1.2)
}
</style>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81764986defd7e840545ca7d0b5372a4&libraries=services"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="http://jsgetip.appspot.com"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="infoScroll">
	<span class="closeBtn"><i class="fa fa-close"></i></span>
	<span class="favBtnSpan">별</span>
	<div class="container-fluid infoContainer">
		<div class="infoInner">
	    <h2><span class="infoInner-title">이름</span></h2>
	  </div>
	  <div class="infoInner">
	    <h3><span class="labelStr">예상 잔량: </span>
	    <span class="infoInner-remain">예상 잔량</span></h3>
	  </div>
	  <div class="infoInner">
	    <h5><span class="infoInner infoInner-addr">주소</span></h5>
	  </div>
	  <div class="infoInner">
	    <h6><span class="labelStr">최근 입고시각: <span class="infoInner-stock">최근 입고시각</span></span>
	    <span class="labelStr pull-right">업데이트 시각: <span class="infoInner-created">업데이트 시각</span></span>
	    </h6>
	  </div>
		<div class="infoInner">
			<span class="labelStr timeLabelStr">이전재고 보기</span><span class="infoInner-timeBtnDiv pull-right">버튼</span>	
			<div class="infoInner-timeline">
				<div class="timeLine" id="timeline"></div>
			</div>
		</div>
		<div class="infoInner replyContainer">
			<div class="replyInput row">
				<div class="replyLeft col-xs-2">
		      <input class="smallInput" type="text" id="writer" name="writer"
		       placeholder="작성자" maxlength="5" autocomplete=”off”>
		      <input class="smallInput" type="password" id="pw" name="pw"
		      placeholder="비밀번호" maxlength="5" autocomplete=”off”>
		    </div>
		    <div class="replyRight col-xs-10">
		    	<textarea class="longInput" rows="2" id="content" name="content"
		    	maxlength="50" placeholder="댓글을 입력하세요"	></textarea>
		    	<i class="material-icons sendIcon">send</i>
		    </div>
	    </div>
  		<div class="infoInner-replyList"></div>
		</div>
	</div>
</div>
<div class="homeBtnDiv">
	<i class='fas fa-home homeBtn' title='현재 위치를 기본 위치로 설정'></i>
</div>
<div class="favBtnDiv">
	<i class='fas fa-star rightScrollBtn' title='즐겨찾기 목록을 불러온다'></i>
</div>
<div class="rightScroll">
	<span class="closeBtnRight"><i class="fa fa-close"></i></span>
	<div class="container-fluid infoContainer rightContainer">
		<div class="infoInner favTitle">
	    <span class="infoInner-favAdd">즐겨찾는 약국 리스트</span>
	  </div>
		<div class="infoInner">
			<div class="infoInner-favList">즐겨찾기 리스트 목록</div>
		</div>
	</div>
</div>
<img class="legend nonMarker" src="../upload/icon/legend.png">
<i class='fas fa-search-location locSearch' title="현재 위치에서 검색"></i>
<div class="floatDiv addrSearchDiv">
  <div class="container-fluid input-group">
    <input type="text" class="form-control addrInput" placeholder="주소를 입력하세요"/>
    <div class="input-group-btn">
      <button class="btn btn-default addrSearchBtn" type="submit">
      	<i class="glyphicon glyphicon-search"></i></button>
    </div>
  </div>
</div>
<div class="startDiv" style="position:absolute;background-color:white;
top:180px;left:450px;z-index:99;text-align:right;display:none">
  <span class="closeBtnStart"><i class="fa fa-close"></i></span>
  <img class="nonMarker" src='../upload/image/maskBarPlot.png'><br>
  <label style="text-align:right"><input type="checkbox" class="startCheck" value="">오늘 다시 보지 않습니다.</label>
</div>
<div id="map"></div>
<script>
//==========기본 위치 쿠키 시작
var lat = 37.50092255804644;
var lng = 126.8847970328552;

if(getCookie('startLatLng')!=null){
	var latlng = returnLatLng(getCookie('startLatLng'));
	lat = latlng.lat;
	lng = latlng.lng;
}

if(getCookie('nonDisplay')==null||getCookie('nonDisplay')!='non'){
  $(".startDiv").css("display","inline"); 
}

function returnLatLng(latlng){
	var strLat = latlng.substring(0,latlng.indexOf("/"));
	var strLng = latlng.substring(latlng.indexOf("/")+1,latlng.length);
	return {lat:strLat, lng:strLng};
}
//==========기본 위치 쿠키 종료

//==========즐겨찾기 쿠키 시작
function strToArray(strArray){
	if(strArray==''||strArray==null){
		return [];
	}
	var tmp1 = strArray.split(",");
	var reArray = [];
	for(var i in tmp1){
		reArray[i] = tmp1[i].split("/");
	}
	return reArray;	
}

function arrayToStr(array){
	strArray = "";
	if(array==null){
		return strArray;
	}
	for(var i=0;i<array.length;i++){
		if(i!=0){
			strArray += ",";
		}
		var tmp = array[i];
		for(var j=0;j<tmp.length;j++){
			if(j!=0){
				strArray += "/";
			}
			strArray += tmp[j];
		}
	}
	return strArray;
}

function addArray(strArray, row){
	var tmp = strToArray(strArray);
	if(tmp==null){
		tmp = [];
	}
	if(findFav(row[0])==-1){
		tmp.push(row);
	}
	return arrayToStr(tmp);
}

function deleteArray(strArray, code){
	var tmp = strToArray(strArray);
	if(tmp==null){
		tmp = [];
	}
	if(findFav(code)!=-1){
		tmp.splice(findFav(code),1);
	}
	return arrayToStr(tmp);
}

function getFavList(){
	return strToArray(getCookie('favList'));
}

function addFav(row){
	var tmp = addArray(getCookie('favList'), row);
	setCookie('favList',tmp,9999);
}

function delFav(code){
	var tmp = deleteArray(getCookie('favList'), code);
	setCookie('favList',tmp,9999);
}

function swapFav(i,j){
	var favArray = strToArray(getCookie('favList'));
	var arrayLength = favArray.length;
	if(arrayLength<i+1||arrayLength<j+1){
		return;
	}
	var tmp1 = [favArray[i][0],favArray[i][1],favArray[i][2]];
	var tmp2 = [favArray[j][0],favArray[j][1],favArray[j][2]];
	favArray[i] = tmp2;
	favArray[j] = tmp1;
	setCookie('favList',arrayToStr(favArray),9999);
}

function findFav(code){
	var tmp1 = strToArray(getCookie('favList'));
	if(tmp1==null){
		return -1;
	}
	for(var i in tmp1){
		var tmp2 = tmp1[i];
		if(code==tmp2[0]){
			return i;
		}
	}
	return -1;
}
//==========즐겨찾기 쿠키 시작

//==========기본 쿠키 함수 시작
function setCookie(name, value, exp) {
  var date = new Date();
  date.setTime(date.getTime() + exp*24*60*60*1000);
  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}

function getCookie(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
}

function deleteCookie(name) {
  setCookie(name,"",-1);
}
//==========기본 쿠키 함수 종료

//==========Date함수 프로토타입 시작
function addDate(i){
	var currentDate; // 계산된 날
	currentDate = this.getDate() + i*1;  // 현재 날짜에 더해(빼)줄 날짜를 계산
	this.setDate(currentDate);  // 계산된 날짜로 다시 세팅
}

function displayDate(){
	var str ="";
	str += this.examToday() + " ";
	str += this.getHours() + ":";
	str += this.getMinutes() + ":";
	str += this.getSeconds();

	return str;
}

function displayMonthDay(){
	var str ="";
	str += (this.getMonth() + 1) + "/";
	str += this.getDate() + " ";
	return str;
}

function examToday(){
	if(today.displayMonthDay()==this.displayMonthDay()){
		return "오늘";
	}else{
		return this.displayMonthDay();
	}
}
Date.prototype.addDate = addDate;
Date.prototype.displayDate = displayDate;
Date.prototype.displayMonthDay = displayMonthDay;
Date.prototype.examToday = examToday;
//==========Date함수 프로토타입 종료

//==========날짜 관련 변수 시작
const dayName = ['일','월','화','수','목','금','토'];
var today = new Date();
var clickDate;
//==========날짜 관련 변수 종료

//==========지도 관련 함수 변수 시작
var stores = null;
var storeMarkers = [];
var selectedMarker = null;
var dateRows = [];

var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOption = {
		center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
    };
function panTo(lat,lng) {
  // 이동할 위도 경도 위치를 생성합니다 
  var moveLatLon = new kakao.maps.LatLng(lat, lng);
  // 지도 중심을 부드럽게 이동시킵니다
  // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
  map.panTo(moveLatLon);            
}     
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var latlng = map.getCenter();
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//지도에 표시할 원을 생성합니다
var circle = new kakao.maps.Circle({
    center : new kakao.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다 
    radius: 1000, // 미터 단위의 원의 반지름입니다 
    strokeWeight: 5, // 선의 두께입니다 
    strokeColor: '#75B8FA', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'dashed', // 선의 스타일 입니다
    fillColor: '#CFE7FF', // 채우기 색깔입니다
    fillOpacity: 0.5  // 채우기 불투명도 입니다   
});
circle.setMap(map);
// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

  var level = map.getLevel();

  latlng = map.getCenter();  

	circle.setPosition(latlng);
});

function getInfo(inLat, inLng, inCode){
	setMarkers(null);
	stores = null;
	storeMarkers = [];

	function setMarkers(map) {     
		storeMarkers.forEach((value)=>{
			value.setMap(map);
		}); 
	}
	url = 'https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat='
	  +inLat+'&lng='+inLng;
	$.getJSON(url, function(data) {
		$("#stores").html('');
		var stores = data.stores;
		
		stores.forEach((value)=>{
	    var imageSize = new kakao.maps.Size(20, 20),
	    imageOptions = {}
	    
	    position = new kakao.maps.LatLng(value.lat, value.lng);

	    if(findFav(value.code)==-1){	    
				// 마커이미지와 마커를 생성합니다
				if(value.remain_stat=='plenty'){
					markerImageSrc = greenMarkerImageSrc;
					markerCheckImageSrc = greenCheckMarkerImageSrc;
				}	else if(value.remain_stat=='some'){
					markerImageSrc = yellowMarkerImageSrc;
					markerCheckImageSrc = yellowCheckMarkerImageSrc;
				}	else if(value.remain_stat=='few'){
					markerImageSrc = redMarkerImageSrc;
					markerCheckImageSrc = redCheckMarkerImageSrc;
				} else{
					markerImageSrc = greyMarkerImageSrc;
					markerCheckImageSrc = greyCheckMarkerImageSrc;				
				}
	    }else{
				if(value.remain_stat=='plenty'){
					markerImageSrc = greenFavMarkerImageSrc;
					markerCheckImageSrc = greenFavCheckMarkerImageSrc;
				}	else if(value.remain_stat=='some'){
					markerImageSrc = yellowFavMarkerImageSrc;
					markerCheckImageSrc = yellowFavCheckMarkerImageSrc;
				}	else if(value.remain_stat=='few'){
					markerImageSrc = redFavMarkerImageSrc;
					markerCheckImageSrc = redFavCheckMarkerImageSrc;
				} else{
					markerImageSrc = greyFavMarkerImageSrc;
					markerCheckImageSrc = greyFavCheckMarkerImageSrc;				
				}
		  }
			
			var markerImage = createMarkerImage(
				markerImageSrc, imageSize, imageOptions);
			var markerCheckImage = createMarkerImage(
					markerCheckImageSrc, imageSize, imageOptions);
			var marker = createMarker(position, markerImage);
			marker.store = value;
			marker.normalImage = markerImage;
			marker.checkImage = markerCheckImage;

			if(!(selectedMarker!=null&&selectedMarker.store.code==marker.store.code)){
				marker.setImage(marker.normalImage);
			}else{
				marker.setImage(marker.checkImage);
			}

			if(inCode==value.code){
				selectedCtrl(marker);
			}
			
			storeMarkers.push(marker);

			//마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			if(value.name.length>8){
				value.iwContent = '<div class="infoContent">'+value.name.substr(0,8)+'..</span>'
			}else{
				value.iwContent = '<div class="infoContent">'+value.name+'</span>'	
			}

			// 인포윈도우를 생성합니다
			value.infowindow = new kakao.maps.InfoWindow({
				content : value.iwContent
			});
			
			//마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function(){
				selectedCtrl(marker);
			});
			
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, value.infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(value.infowindow));	
		});
		setMarkers(map);	
	});
}

function selectedCtrl(marker){
  if (selectedMarker!=null) {
  	if(selectedMarker.store.code==marker.store.code){
      marker.setImage(marker.normalImage);
    	selectedMarker = null;
    	$(".infoScroll").toggle('slide');
  	}else{
      // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
      for(var i in storeMarkers){
        if(storeMarkers[i].store.code==selectedMarker.store.code){
        	storeMarkers[i].setImage(storeMarkers[i].normalImage);
        }
      }
      marker.setImage(marker.checkImage);
      selectedMarker = marker;
	    showList(marker);
    }
  }else{
    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
    selectedMarker = marker;
    marker.setImage(marker.checkImage);
    showList(marker);
		$(".infoScroll").toggle('slide');
		// 마커 위에 인포윈도우를 표시합니다
  }
}

// getList를 저장하는 프로그램 작성 -> 필요한 데이터 param(no, page), callback-처리되는 함수, error-오류가 났을때 객체
function getList(marker, callback, error){
	var code = marker.store.code;
	var theDate = clickDate;
	var theYear = theDate.getFullYear();
	var theMonth = theDate.getMonth()+1;
	if(theMonth<10) theMonth = '0'+theMonth;
	var theDay = theDate.getDate();
  if(theDay<10) theDay = '0'+theDay;

	$.getJSON(
			// 데이터 요청 URI
			"/mask/maskMap/" + theYear + theMonth + theDay + "/" + code + ".json",
			// 데이터 가져오기를 성공하면 처리되는 함수. data : 서버에서 넘어오는 데이터
			function(data){
				// 데이터를 가져오기를 성공하면 실행되는 함수를 밖에서 선언해서 넣어주는 경우 처리
				if(callback){
					callback(data);
				}
			}
	// 데이터 가져오는 것을 실패했을 때의 처리
	).fail(function(xhr, status, err){
		if(err){
			err();
		}
	});
}

function showList(marker){
	if(marker.store.remain_stat=='plenty'){
	  $(".infoInner-remain").html('100~');
	  $(".infoScroll").css("background-color", "#A9F5BC");
	}else if(marker.store.remain_stat=='some'){
	  $(".infoInner-remain").html('30~99');
	  $(".infoScroll").css("background-color", "#F3F781");
	}else if(marker.store.remain_stat=='few'){
	  $(".infoInner-remain").html('10~29');
	  $(".infoScroll").css("background-color", "#F5A9A9");
	}else{
	  $(".infoInner-remain").html('없음');
	  $(".infoScroll").css("background-color", "#E6E6E6");
	}
	if(findFav(marker.store.code)==-1){
		$(".favBtnSpan").html("<i class='far fa-star' title='즐겨찾는 약국으로 지정합니다.'></i>");
	}else{
		$(".favBtnSpan").html("<i class='fas fa-star' title='즐겨찾기를 해제합니다.'></i>");
	}
  $(".infoInner-title").html(marker.store.name);
  $(".infoInner-addr").html(marker.store.addr);
  $(".infoInner-created").html(marker.store.created_at+" ");
  $(".infoInner-stock").html(marker.store.stock_at);
  var timeBtnStr = "";
  for(i=0;i<8;i++){
    inputDate = new Date();
    inputDate.addDate(-i);
  	timeBtnStr += "<input class='btn btn-primary btn-xs timeBtn' type='button' ";
  	timeBtnStr += "data-ago='"+i;
  	timeBtnStr += "' value='";
  	if(i==0){
    	timeBtnStr += "오늘";
  	}else{
    	timeBtnStr += inputDate.getMonth()+1;
    	timeBtnStr += "/";
    	timeBtnStr += inputDate.getDate();
    }
  	timeBtnStr += "' title='"+dayName[inputDate.getDay()]+"'/>";
  }
 
  $(".infoInner-timeBtnDiv").html(timeBtnStr);
	$(".timeLine").html("");
	showReplyList(1);
  $(".timeBtn").click(function(){
		$(".timeLine").html("<img class='nonMarker loading' src='../upload/icon/nowloading.gif'>");
		clickDate = new Date();
		clickDate.addDate(-$(this).data("ago"));
  	getList(marker,function(list){
  		var str = "";
  		dateRows = [];	
  		if(list == null || list.length ==0){
  			$(".timeLine").html("<div>판매 정보가 존재하지 않습니다.</div>");
  			return;
  		}
  		for(var i = 0; i < list.length; i++){
  			var dto = list[i];
  			var created_at = new Date(dto.created_at);
  			var barColor;
  			var barName;
  			var caMonth = created_at.getMonth()+1;
  			var caDate = created_at.getDate();
  			var caDay = caMonth+'/'+caDate;
  			var caHour = created_at.getHours();
  			var caMin = created_at.getMinutes();
  			var caMinRemain = caMin%10;
  			var caMinLower = caMin-caMinRemain;
  			var caMinUpper = caMin-caMinRemain+10;
  			
  			if(dto.remain_stat=='few')	{
  				barColor = 'red';
  				barName = '적음(2~29)';
  			}	else if(dto.remain_stat=='some')	{
  				barColor = 'yellow';
  				barName = '약간(30~99)';
  			}	else	{
  				barColor = 'green';
  				barName = '많음(100~)'
  			}
  			inRows = [caDay,barName,barColor,
  				new Date(0,0,0,caHour,caMinLower),
  				new Date(0,0,0,caHour,caMinUpper)];
				dateRows.push(inRows);
  		}
  		google.charts.load("current", {packages:["timeline"]});
  		google.charts.setOnLoadCallback(drawChart);
    });
  });
  
	function drawChart() {
	  var container = document.getElementById('timeline');
	  var chart = new google.visualization.Timeline(container);
		var dataTable = new google.visualization.DataTable();
		dateRows = getUniqueObjectArray(dateRows, 3);
	  dataTable.addColumn({ type: 'string', id: 'Position' });
	  dataTable.addColumn({ type: 'string', id: 'Name' });
	  dataTable.addColumn({ type: 'string', id: 'style', role: 'style' });
	  dataTable.addColumn({ type: 'date', id: 'Start' });
	  dataTable.addColumn({ type: 'date', id: 'End' });
	  dataTable.addRows(dateRows);
    var options = {
    		timeline: { showBarLabels: false },
        avoidOverlappingGridLines: false,
        backgroundColor: '#CEE3F6'
      };
	  chart.draw(dataTable, options);
	}

	function getUniqueObjectArray(array, key) {
	  var tempArray = [];
	  var resultArray = [];
	  for(var i = 0; i < array.length; i++) {
	    var item = array[i];
	    var finder = 0;
	    for(var j = 0; j < tempArray.length; j++){
	      if((tempArray[j].getHours()+''+tempArray[j].getMinutes())==
	        item[key].getHours()+''+item[key].getMinutes()){
	        finder = 1;
	        continue;
	    	}
	    }
	    if(finder==0) {
	    	resultArray.push(item);
	    	tempArray.push(item[key]);
	    }
	  }
	  return resultArray;
	}
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
  return function() {
    infowindow.open(map, marker);
  };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
  return function() {
    infowindow.close();
  };
}

var greenMarkerImageSrc = '../upload/icon/green.jpg';
var yellowMarkerImageSrc = '../upload/icon/yellow.jpg';
var redMarkerImageSrc = '../upload/icon/red.jpg';
var greyMarkerImageSrc = '../upload/icon/grey.jpg';
var greenCheckMarkerImageSrc = '../upload/icon/greencheck.jpg';
var yellowCheckMarkerImageSrc = '../upload/icon/yellowcheck.jpg';
var redCheckMarkerImageSrc = '../upload/icon/redcheck.jpg';
var greyCheckMarkerImageSrc = '../upload/icon/greycheck.jpg';
var greenFavMarkerImageSrc = '../upload/icon/greenfav.jpg';
var yellowFavMarkerImageSrc = '../upload/icon/yellowfav.jpg';
var redFavMarkerImageSrc = '../upload/icon/redfav.jpg';
var greyFavMarkerImageSrc = '../upload/icon/greyfav.jpg';
var greenFavCheckMarkerImageSrc = '../upload/icon/greenfavcheck.jpg';
var yellowFavCheckMarkerImageSrc = '../upload/icon/yellowfavcheck.jpg';
var redFavCheckMarkerImageSrc = '../upload/icon/redfavcheck.jpg';
var greyFavCheckMarkerImageSrc = '../upload/icon/greyfavcheck.jpg';
var loadingImageSrc = '../upload/icon/nowloading.gif';

function createMarkerImage(src, size, options) {
  var markerImage = new kakao.maps.MarkerImage(src, size, options);
  return markerImage;            
}

function createMarker(position, image) {
  var marker = new kakao.maps.Marker({
    position: position,
    image: image,
  	clickable: true
  });
    
  return marker;  
}

function moveByAddress(inputAddress){
	geocoder.addressSearch(inputAddress, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
	 	if (status === kakao.maps.services.Status.OK) {
	 		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 		map.setCenter(coords);
	 		latlng = map.getCenter();
	 	}
	});
}
//==========지도 관련 함수 변수 종료

//==========댓글 리스트 함수 시작
var replyService = (function(){

	function getList(param, callback, error){
		var code = param.code;
		var page = param.page;

		$.getJSON(
				// 데이터 요청 URI
				"/mask/reply/" + code + "/" + page + ".json",
				// 데이터 가져오기를 성공하면 처리되는 함수. data : 서버에서 넘어오는 데이터
				function(data){
					// 데이터를 가져오기를 성공하면 실행되는 함수를 밖에서 선언해서 넣어주는 경우 처리
					if(callback){
						callback(data);
					}
				}
		// 데이터 가져오는 것을 실패했을 때의 처리
		).fail(function(xhr, status, err){
			if(err){
				err();
			}
		});
	}

	function add(reply, callback, error){
		$.ajax({
			type : "post",
			url : "/mask/reply/new",
			// data : ?뒤에 쿼리를 의미 k=v&&k=v : JSON.stringify(json)로 변환
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			// 등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다.
			success : function(result, status, xhr){
						if(callback)
							callback(result);
					},
			// 등록 오류가 발생된 경우 처리
			error : function(xhr, status,er){
						if(error)
							error(er);
					}
		});
	}

	function del(reply, callback, error){
		$.ajax({
			type : "post",
			url : "/mask/reply/delete",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback)
					callback(result);
				},
			error : function(xhr, status, er){
				if(error)
					error(er);
			}
		});
	}
	return {
		getList : getList,
		add: add,
		del: del
	}
})();

function showReplyList(page){
	
	var replyUL = $(".infoInner-replyList");
	
	replyService.getList(
		{code:selectedMarker.store.code, page:page},
		function(data){
			var str = "";
			// 댓글이 없는 경우의 처리
			if(data.replyList == null || data.replyList.length == 0){
				replyUL.html("<div><h3>댓글이 존재하지 않습니다.</h3></div>");
				return;
			}
			// 댓글이 있는 경우의 처리
			for(var i = 0; i < data.replyList.length; i++){
				var dto = data.replyList[i];
				str += "<div class='replyLine'>";
				str += "<div class='replyTitle'><span style='width:50px'><strong class='primary-font writer'>"+ dto.writer +" </strong></span>";
				str += "<span class='pull-right text-muted rtRight delBtnLayer'><small> (" 
					+ dto.ip + ") " + new Date(dto.writeDate).displayDate() + " </small>";
				str += "<i style='font-size:15px' data-rno='"+dto.rno+"' class='fa repDelBtn'>&#xf2d4;</i><span class='delInputSpan'></span></span></div>";
				str += "<div><span>" +dto.content + "</span></div>";
				str += "</div>";
			}
			str += "<div class='replyPaging'>";
			str += pageNav(data.pageObject);
			str += "</div>";
			replyUL.html(str);
			
			function pageNav(pageObject){
				var page = pageObject.page;
				var totalPage = pageObject.totalPage;
				var startPage = pageObject.startPage;
				var endPage = pageObject.endPage;
				var str = "";
				
				str += "<ul class='pagination'>";
				str += "<li class='pageBtn pageff' data-page=1>&lt;&lt;</li>";
				if(startPage>1){
					str += "<li class='pageBtn pagef' data-page=" + (startPage-1) + "> &lt;</li>";
				}
				for(i=startPage;i<endPage+1;i++){
				str += "<li class='pageBtn";
					if(page==i){
						str += " active";
					}
					str += "' data-page=" + i + "> " + i + "</li>";
				}
				if(endPage<totalPage){
					str += "<li class='pageBtn pageb' data-page=" + (endPage+1) + "> &gt;</li>";
				}
				str += "<li class='pageBtn pagebb' data-page=" + totalPage +"> &gt;&gt;</li>";
				str += "</ul>";

				return str;
			}
		}
	);
}
//==========댓글 리스트 함수 종료

//==========즐겨찾기 리스트 함수 시작
function showFavList(){
	var favListUL = $(".infoInner-favList");
	var favArray = getFavList();
	var favArrayLen = favArray.length;
	var str = "";
	
	if(favArray == null || favArrayLen == 0){
		favListUL.html("<div><h3>지정된 즐겨찾기가 없습니다.</h3></div>");
		return;
	}
	
	for(var i = 0; i < favArrayLen; i++){
		var row = favArray[i];
		url = 'https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?m=2&lat='
		  +row[1]+'&lng='+row[2];
	  
		$.ajaxSetup({
		  async: false
		});
		 
		$.getJSON(url, function(data) {
			stores = data.stores;
			stores.forEach((value)=>{
				if(row[0]==value.code){
					str += "<div class='favLine row' style='background-color:";
					if(value.remain_stat=='plenty'){
						str += "#A9F5BC";
					}else if(value.remain_stat=='some'){
					  str += "#F3F781";
					}else if(value.remain_stat=='few'){
					  str += "#F5A9A9";
					}else{
					  str += "#E6E6E6";
					}
					str += "'>";
					str += "<div class='favLineLeft col-xs-1'>";
					str += "<span class='favGoToBtn' data-lat='"+value.lat+"' data-lng='"+value.lng;
					str += "' data-code='"+value.code+"'><i class='far fa-hand-point-left'></i></span>";
					str += "</div>";
					str += "<div class='favLineMiddle col-xs-10'>";
					str += "<div class='favLineMiddleFirst'>";
					str += "<div><strong>"+value.name+"</strong></div>";
					str += "</div>";
					str += "<div class='favLineMiddleSecond'>"+value.addr+"</div>";
					str += "</div>";
					str += "<div class='favLineRight col-xs-1'>";
					str += "<span class='favMoveUpBtn' data-ord="+i+">";
					str += "<i class='fas fa-caret-square-up'></i></span>";
					str += "<span class='favMoveDownBtn' data-ord="+i+">";
					str += "<i class='fas fa-caret-square-down'></i></span>";
					str += "</div>";
					str += "</div>";
				}
			});
		});
	}
	favListUL.html(str);
}
//==========즐겨찾기 리스트 함수 종료

//==========버튼 클릭 시작
$(function(){
//==========맵 위에 있는 버튼 클릭 시작
	$(".locSearch").click(function(){
		getInfo(latlng.getLat(),latlng.getLng(),-1);
	});
	
	$(".addrSearchBtn").click(function(){
		var inputAddress = $(".addrInput").val();
		moveByAddress(inputAddress);
	});

	$(".homeBtn").click(function(){
		setCookie('startLatLng',latlng.getLat()+'/'+latlng.getLng(),9999);
	});
//==========맵 위에 있는 버튼 클릭 종료

//==========왼쪽 스크롤에 관련된 버튼 클릭 시작
	$(".closeBtn").click(function(){
		closeScroll();
		function closeScroll(){
			selectedMarker.setImage(selectedMarker.normalImage);
			selectedMarker = null;
			$(".infoScroll").toggle('slide');
		}
	});
	$(".favBtnSpan").click(function(){
		var tmp = selectedMarker.store;
		var inRow = [tmp.code, tmp.lat, tmp.lng];
		if(findFav(tmp.code)==-1){
			if(strToArray(getCookie('favList')).length<10){
				addFav(inRow);
				getInfo(latlng.getLat(),latlng.getLng(),-1);
				$(".favBtnSpan").html("<i class='fas fa-star' title='즐겨찾기를 해제합니다.'></i>");
			}else{
				alert("즐겨찾기는 10개까지 지정할 수 있습니다.");
			}
		}else{
			delFav(tmp.code);
			getInfo(latlng.getLat(),latlng.getLng(),-1);
			$(".favBtnSpan").html("<i class='far fa-star' title='즐겨찾는 약국으로 지정합니다.'></i>");
		}
		showFavList();
	});

	$(".sendIcon").click(function(){
		var reply = {
			code : selectedMarker.store.code,
			writer: $("#writer").val(),
			content : $("#content").val(),
			pw : $("#pw").val(),
			ip : ip()
		}
		replyService.add(
			reply,
			function(result){
				$(".replyInput").find("input, textarea").val("");
				showReplyList(1);
			},
			function(er){
				alert("데이터 등록 중 오류가 발생되었습니다.");
			}
		);
	});

	var clickDelBtn;
	var clickRno = 0;
	clickDivStr = "<div class='delDiv'>";
	clickDivStr += "<input class='delInput' type='password' placeholder='비밀번호입력'/>";
	clickDivStr += "<input class='delBtn' type='button' value='삭제'/>";
	clickDivStr += "</div>";
	
	$(".infoInner-replyList").on("click",
		".replyLine > .replyTitle > .rtRight > .repDelBtn",
		function() {
			rno = $(this).data("rno");
			if(clickRno==0){
				clickDelBtn = $(this);
				clickRno = rno;
				clickDelBtn.siblings(".delInputSpan").append(clickDivStr);
			}else if(clickRno==rno){
				clickDelBtn.siblings(".delInputSpan").html('');
				clickDelBtn == null;
				clickRno = 0;
			}else{
				clickDelBtn.siblings(".delInputSpan").html('');
				clickDelBtn = $(this);
				clickRno = rno;
				clickDelBtn.siblings(".delInputSpan").append(clickDivStr);
			}
	});

	$(".infoInner-replyList").on("click",
		".replyLine > .replyTitle > .rtRight > .delInputSpan > .delDiv > .delBtn",
		function() {
			var rno = $(this).closest(".rtRight").find(".repDelBtn").data("rno");
			var pw = $(this).siblings(".delInput").val();
			var reply = {
				rno : rno,
				pw : pw
			}
			replyService.del(
				reply,
				function(result){
					alert("댓글을 삭제했습니다.")
					showReplyList(1);
				},
				function(er){
					alert("댓글 삭제 중 오류가 발생했습니다.")
				}
			);
	});
	
	$(".infoInner-replyList").on("click", ".pagination > li:not('.active')",
		function() {
			var page = $(this).data("page");
			showReplyList(page);
	});
//==========왼쪽 스크롤에 관련된 버튼 클릭 종료

//==========오른쪽 스크롤에 관련된 버튼 클릭 시작
	$(".rightScrollBtn").click(function(){
		showFavList();
		$(".rightScroll").toggle("slide",{direction:"right"});
	});
	
	$(".closeBtnRight").click(function(){
		$(".rightScroll").toggle("slide",{direction:"right"});
	});

	$(".infoInner-favList").on("click", ".favLine > .favLineLeft > .favGoToBtn",
		function(){
			inLat = $(this).data("lat");
			inLng = $(this).data("lng");
			inCode = $(this).data("code");
			panTo(inLat, inLng);
			getInfo(inLat, inLng, inCode);
	});

	$(".infoInner-favList").on("click", ".favLine > .favLineRight > .favMoveUpBtn",
		function(){
			inOrdNo = $(this).data("ord");
			swapFav(inOrdNo,inOrdNo-1);
			showFavList();
	});
	
	$(".infoInner-favList").on("click", ".favLine > .favLineRight > .favMoveDownBtn",
		function(){
			inOrdNo = $(this).data("ord");
			swapFav(inOrdNo,inOrdNo+1);
			showFavList();
	});
//==========오른쪽 스크롤에 관련된 버튼 클릭 종료
  $(".closeBtnStart").click(function(){
    $(".startDiv").css("display","none");
  });
  $(".startCheck").on('click', function(){
    if($(this).prop('checked')){
      var date = new Date();
      date.setDate(date.getDate() + 1);
      document.cookie = 'nonDisplay=non;expires=' + date.toUTCString() + ';path=/';
    	$(".startDiv").css("display","none");
    }
  });
});
//==========버튼 클릭 종료
</script>
</body>
</html>