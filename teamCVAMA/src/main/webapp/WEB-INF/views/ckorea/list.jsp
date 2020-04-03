<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<title>CVAMA MAIN PAGE</title>

<style>
.news{
	border : 1px solid black;
	cursor : pointer;
}
.newsTitle{
	text-align: center;	
	font-size : 15pt;
}
.newsContent{
	font-size : 12pt;
	text-align: left;
	padding: 10px;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
}
.text-center {
	text-align:center;
	font-size: 17pt;
}
.nowTitle {
	text-align:center;
	font-size: 12pt;
}
._remoteControl{
	border : 1px solid black;
	font-size : 15pt;
	height: auto;
	width: auto;
	background: white;
	text-align:center;
	
	display: block;
	position: fixed;
	top: 500px;
	left: 75px;
	z-index: 1000;
	cursor: move
}
._Chat {
	z-index: 500;
	border: 1px solid black;
	font-size: 15pt;
	background: white;
	text-align: center;
	display: block;
	position: fixed;
	top: 50px;
	left: 1160px;
	resize: both;
}
.panel-heading{
	cursor: move;
}
.chatLine{
	position:inline-block;
}
#chatBody {
	height: 500px;
	width: 500px;
	overflow-Y: scroll;
}
.chatcontent{
	width: 307px;
	word-break:break-all;
}
#content{
	resize: none;
	width: 400px;
	float: left;
}
</style>

<!-- 숫자 콤마 -->
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>

<!-- 증가시 안 좋은 값의 색깔변경          증가 : 빨강 / 감소 : 파랑 -->
<script>
$(function(){ 	
	$(".nomalDiff").each(function(){
		var diff = $(this).find(".diff").text();
		if(diff > 0){
			$(this).find(".diff").css("color","red");

			// 콤마 넣기
			diff = numberWithCommas(diff);
			
			$(this).find(".diff").text("+" + diff); // 태그에 값을 변경

		}else if(diff < 0){
			$(this).find(".diff").css("color","blue");

			diff = numberWithCommas(diff);
			
			$(this).find(".diff").text(diff);
		}
	});
});
</script>

<!-- 증가시 좋은 값의 색깔변경           증가 : 초록 / 감소 : 빨강 -->
<script>
$(function(){ 
	$(".revDiff").each(function(){
		var diff = $(this).find(".diff").text();
		if(diff > 0){
			$(this).find(".diff").css("color","green");

			diff = numberWithCommas(diff);
			
			$(this).find(".diff").text("+"+diff); // 태그에 값을 변경
		}else if(diff < 0){
			$(this).find(".diff").css("color","red");

			diff = numberWithCommas(diff);
			
			$(this).find(".diff").text(diff);
		}
	});
});
</script>

</head>
<body>

<!-- 네이게이션 바 -->
<!--
 <nav id="nav" class="navbar navbar-expand navbar-light">
	<div class="container justify-content-center">
		<div class="navbar-nav d-none d-md-flex pc">
			<a class="nav-item nav-link" href=".korea-slide">대한민국 현황<i></i></a> 
			<a class="nav-item nav-link" href="#chart-slide">일자별 현황<i></i></a> 
			<a class="nav-item nav-link" href="#prevention-slide">예방 수칙<i></i></a> 
			<a class="nav-item nav-link" href="#news-slide-kr">뉴스<i></i></a>
		</div>
	</div>
</nav> 
-->

<!-- 리모컨 -->
<div id="remocon" class="_remoteControl remote">
	<div id="header" class="h_area panel-heading">
		<strong>빠른 이동</strong>
	</div>
	<div class="remote_cont list-group" style="font-size: 12pt; margin: 0px; cursor: pointer;">
		<a class="list-group-item liveChat" id="liveChatText">실시간 채팅<i></i></a> 
		<a class="list-group-item" href="#korea-slide">대한민국 현황<i></i></a> 
		<a class="list-group-item" href="#chart-slide">일자별 현황<i></i></a> 
		<a class="list-group-item" href="#news-slide-kr">뉴스<i></i></a> 
		<a class="list-group-item" href="#prevention-slide">예방 수칙<i></i></a>
	</div>
</div>

<!-- 리모컨이동 스크립트 -->
<script>
dragElement(document.getElementById("remocon"));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    /* if present, the header is where you move the DIV from:*/
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    /* stop moving when mouse button is released:*/
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
</script>

<!-- 실시간 채팅 -->
<div id="liveChatDiv" class="_Chat" style="display:none">
	<div id="header2" class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>실시간 채팅
			<div style="float:right;"><button class="liveChat">X</button></div>
		</div>
	</div>
	<div id="chatBody" class="container-fluid">
		<div class="chat"></div>
	</div>
	<div class="panel-body">
		<form id="writeform">
			<div id='writerep'>
				<div class="form-group">
					<textarea class="form-control" rows="1" id="content" name="content"></textarea>
					<button class="btn btn-default btn-sm" id="writeBtn">입력</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 채팅창 이동 스크립트 -->
<script>
dragElement(document.getElementById("liveChatDiv"));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header2")) {
    /* if present, the header is where you move the DIV from:*/
    document.getElementById(elmnt.id + "header2").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    /* stop moving when mouse button is released:*/
    $("#content").focus();
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
</script>

<!-- 실시간채팅 잡기능 스크립트 -->
<script>
$(document).ready(function() {
	$('#content').on('keyup', function() {
		if($(this).val().length > 19) {
			$(this).val($(this).val().substring(0, 19));
		}
	});
	$('#content').on('keydown', function(event) {
        if (event.keyCode == 13) {
            if (!event.shiftKey){
                event.preventDefault();
                $('#writeBtn').submit();
            }
        }
    });
    
    $('#testForm').on('submit', function() {
        button_click();
    });
});
</script>

<!-- 실시간 채팅 기능 -->
<script type="text/javascript">
	var liveChatService = (function() {
		function getList(param, callback, error) {
			stime = param.stime;
			$.getJSON(				
				"/liveChat/list/"+stime+".json",
				// 데이터 가져오기를 성공하면 처리되는 함수. data : 서버에서 넘어오는 데이터
				function(data) {
					// 데이터를 가져오기를 성공하면 실행되는 하무를 밖에서 선언해서 넣어주는 경우 처리
					if (callback) {
						callback(data);
					}
				}
				// 데이터 가져오는 것을 실패했을 때의 처리
				).fail(function(xhr, status, err) {
					if (error) {
						error();
					}
			});
		}
		
		// 날짜 timestamp 숫자를 받아서 날짜 형식으로 리턴해주는 함수 -> json데이터로 받을때
		function displayDate(timeValue) {
			var today = new Date(); // 오늘 날짜 셋팅
			// today.getTime() - timeValue // 현재 날짜시간과 댓글 작성일의 차이를 알아낸다
			// 차이가 24시간이 지나지 않았으면 시간을 지낫으면 날짜를 표시할 수 있도록 할 수 있다.
			
			var dateObj = new Date(timeValue); // 댓글을 작성한 날짜 객체
			var str = "";
			/* str += dateObj.getDate() + "-";
			str += (dateObj.getMonth() + 1) + "-"; // month는 0~11을 사용하기때문에 +1
			str += dateObj.getFullYear() + " "; */
			str += dateObj.getHours() + ":";
			str += dateObj.getMinutes() + ":";
			str += dateObj.getSeconds();

			// [yy, mm, dd].join("."); - 중간에 .을 이용해서 이어 붙인다.
			return str;
		}

		function add(newChat, callback, error) {
			$.ajax({
				type : 'post',
				url : '/liveChat/new',
				data : JSON.stringify(newChat),
				contentType : "application/json; charset=utf-8",
				// 등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다 
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				// 등록 오류가 발생된 경우 처리
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			})
		}

		function chatDelete(chat, callback, error) {
			$.ajax({
				type : "post",
				url : "/liveChat/del",
				data : JSON.stringify(chat),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						eroor(er);
					}
				}
			})
		}
		return {
			// 댓글 리스트가 처리된 결과를 만들어 내는 함수
			getList : getList,
			displayDate : displayDate,
			add : add,
			chatDelete : chatDelete
		};
	})();
	
	$(function() {
		setInterval(function(){
			showList();
		},1000);
		// 댓글 리스트를 표시할 객체 저장
		var liveChatUL = $(".chat");

		// 댓글 리스트를 가져와서 보여주는 함수 호출
		showList();
		
		//		alert(replyService.getList);
		//  댓글 리스트를 보여주는 function : 글보기를 호출하면 바로 보여주는 부분이므로 페이지는 1페이지이다.
		function showList() {
			liveChatService.getList({
				stime : "${stime }"
			},
			function(data) {
				liveChatList = data;
				var str = "";
				// 댓글이 없는 경우의 처리
				if (liveChatList == null || liveChatList.length == 0) {
					liveChatUL.html("<div class='left clearfix'>실시간 채팅을 시작합니다.</div>");
							return;
				}

				var sid = "${sid }";
				
				// 채팅이 있는 경우의 처리
				var userArray = new Array(sid);
				userArray.push(0);
				
				var count = 1;
				var check = 0;
				
				for (var i = 0; i < liveChatList.length; i++) {
					var dto = liveChatList[i];
					for (var j=0; j<userArray.length; j++){
						if(userArray[j] == dto.writer) {
							check = 1;
						}
					}
					if(check == 0) {
						userArray.push(dto.writer);
						userArray.push(count);
						count += 1;
					}
					check=0;
				}
				
				var dto2 = copyObj(liveChatList[0]);
				dto2.writer="noName";
				
				for (var i = 0; i < liveChatList.length; i++) {
					var dto = liveChatList[i];
					if(i>=1) {
						dto2 = liveChatList[i-1];
					}
					if(sid != dto.writer){
						str += "<div class='chatLine' style='text-align:left'>";
						for(var j=2; j<userArray.length; j=j+2){
							if(userArray[j] == dto.writer && dto.writer != dto2.writer){
								str += "<div class='chatcontent'>사용자 "+ userArray[j+1] +"</div>";
							}	
						}
						str += "<span class='chatcontent'>" + dto.content + "</span>";
						str += "<span class='chattime'><small class='text-muted'>" + liveChatService.displayDate(dto.cdate) + "</small>"
						    +  "</span>";
						str += "</div>";
					}
					else {
						str += "<div id='chatLine' class='chatLine' style='text-align:right'>";
						str += "<span id='chattime' class='chattime'><button id='chatdelete' class='btn btn-default btn-xs chatdelete' data-rno='" + dto.no + "'>x</button>"
						    +  "<small class='text-muted'>" + liveChatService.displayDate(dto.cdate) + "</small>"
						    +  "</span>";
						str += "<span class='chatcontent'>" + dto.content + "</span>";
						str += "</div>";
					}
				}
				liveChatUL.html(str);
				$("#chatBody").scrollTop($("#chatBody")[0].scrollHeight);
			});
		}

		// 채팅 등록 버튼 클릭 이벤트 -> form의 데이터를 넘기는 이벤트
		$("#writeform").submit(function() {
			// Ajax로 넘길 데이터를 가저온다
			var newChat = {
				content : $("#content").val(),
				writer: "${sid }"
			}
			liveChatService.add(newChat, function(result) {
				// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해 준다.
				$("#content").val("");
				showList();
			});

			// submit을 무시 시킨다. -> Ajax처리를 하기 위해서
			return false;
		});

		// 채팅 삭제버튼 이벤트
		$(".chat").on("click", "#chatLine > #chattime > #chatdelete", function() {
			var chatNo = $(this).data("rno");
			var chat = {
				no : chatNo,
				writer: "${sid }"
			}
			liveChatService.chatDelete(chat, function(result) {
				// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해 준다.
				showList();
			});
		});
	});
	function copyObj(obj) {
		var copy = {};
		if (Array.isArray(obj)) {
			copy = obj.slice().map((v) => {
		    	return copyObj(v);
			});
		} else if (typeof obj === 'object' && obj !== null) {
			for (var attr in obj) {
		    	if (obj.hasOwnProperty(attr)) {
		        	copy[attr] = copyObj(obj[attr]);
		    	}
		    }
		} else {
			copy = obj;
		}
		return copy;
	}
</script>

<!-- 실시간 채팅 온오프 -->
<script>
var check = 0;

$(".liveChat").click(function(){
	if(check == 0){
		check += 1;
		$("#liveChatText").text("채팅 닫기");
		$("#liveChatDiv").show();
	}
	else{
		check -= 1;
		$("#liveChatText").text("실시간 채팅");
		$("#liveChatDiv").hide();
	}
});
</script>

<!-- 대한민국 현황 -->
<div id="korea-slide" class="container" style="text-align:center; background-color:#f2f2f2;">
	<div> <h2>대한민국 현황</h2> </div>
	<div class="row">
		<div class="col-3 col-sm-3 col-md-2 text-center nomalDiff">
			<p class="nowTitle"> 확진자 </p>
			<p class="count">${nowList.coronaTrue }</p>
			<p class="diff">${nowList.coronaTrue2 }</p>
		</div>
		<div class="col-3 col-sm-3 col-md-1 text-center nomalDiff">
			<p class="nowTitle"> 사망자 </p>
			<p class="count">${nowList.death }</p>
			<p class="diff">${nowList.death2 }</p>
		</div>
		<div class="col-3 col-sm-3 col-md-1 text-center revDiff">
			<p class="nowTitle"> 격리해제 </p>
			<p class="count">${nowList.safe }</p>
			<p class="diff">${nowList.safe2 }</p>
		</div>
		<div class="col-3 col-sm-3 col-md-2 text-center">
			<p class="nowTitle"> 치사율 </p>
			<p class="diff"> ${nowList.deathRate }% </p>
		</div>
		<div class="col-4 col-sm-4 col-md-2 text-center nomalDiff">
			<p class="nowTitle"> 총검사자 </p>
			<p class="count">${nowList.testTotal }</p>
			<p class="diff">${nowList.testTotal2 }</p>
		</div>
		<div class="col-4 col-sm-4 col-md-2 text-center nomalDiff">
			<p class="nowTitle"> 검사중 </p>
			<p class="count">${nowList.testToday }</p>
			<p class="diff">${nowList.testToday2 }</p>
		</div>
		<div class="col-4 col-sm-4 col-md-2 text-center revDiff">
			<p class="nowTitle"> 음성판정 </p>
			<p class="count">${nowList.coronaFalse }</p>
			<p class="diff">${nowList.coronaFalse2 }</p>
		</div>
	</div>
</div>

<!-- 숫자 애니메이션 -->
<script>
$(".count").each(function(){
	var rn = $(this).text();
	var loc = $(this);
	$({ val : 0 }).animate({ val : rn }, {
		duration: 2000,
		step: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    loc.text(num);
		}
	});
});
</script>

<!-- 구글차트 DIV-->
<div class="slide container" id="chart-slide" style="text-align: center;">
	<div> <h2> 대한민국 일자별 현황 그래프 </h2> </div>
	<!-- 라인 차트 생성할 영역 -->
	<div id="lineChartArea"></div>
	<!-- 컨트롤바를 생성할 영역 -->
	<div id="controlsArea" style="display:inline-block;"></div>
</div>

<!-- 뉴스 -->
<div class="container" id="news-slide-kr" style="text-align: center;">
	<div> <h2> 실시간 대한민국 코로나 뉴스 </h2> </div>
	<c:forEach items="${cNewsList }" var="dto">
		<div class="news" onclick="window.open('${dto.newsLink}');" >
			<div class="newsTitle">[ ${dto.title } ]</div>
			<div class="newsContent">${dto.content }</div>
			<div style="text-align: left;">
				작성일 : <fmt:formatDate value="${dto.cdatt }" pattern="yyyy.MM.dd HH:mm" />
			</div>
		</div>
	</c:forEach>
</div>

<!-- 예방 행동 수칙 -->
<!-- 참고자료 : https://ktsmemo.cafe24.com/s/SwiperJS/368 -->
<div class="slide" id="prevention-slide" style="text-align: center; margin: 20px;">
	<div class="container">
		<h2>예방 행동 수칙</h2>
		<p class="table-legend">
			<a class="text-reset text-decoration-none" href="http://www.cdc.go.kr/gallery.es?mid=a20503020000&bid=0003" target="_blank">출처: 질병관리본부 웹사이트</a>
		</p>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="/upload/image/corona1.jpg" alt="코로나19 예방 행동 수칙">
				</div>
				<div class="swiper-slide">
					<img src="/upload/image/corona2.jpg" alt="코로나19 자가격리대상자 생활수칙">
				</div>
				<div class="swiper-slide">
					<img src="/upload/image/corona3.jpg" alt="코로나19 자가격리 대상자 가족, 동거인 생활수칙">
				</div>
				<div class="swiper-slide">
					<img src="/upload/image/corona4.jpg" alt="코로나19 의료기관수칙">
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</div>

<!-- 사진 넘기는 버튼 -->
<script>
new Swiper('.swiper-container', {
	autoHeight : true,
	autoWidth : true,
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>

<!-- 구글차트 스크립트 -->
<script type="text/javascript">
	var chartDrowFun = {
		chartDrow : function() {
			var result = new Array();
			<c:forEach items="${cKoreaList}" var="myData">
				var json = new Object();
				json.cDate = "${myData.cdatt}";
				json.testTotal = ${myData.testTotal};
				json.testToday = ${myData.testToday};
				json.coronaTrue = ${myData.coronaTrue};
				json.coronaFalse = ${myData.coronaFalse};
				json.death = ${myData.death};
				json.safe = ${myData.safe};
				json.care = ${myData.care};
				result.push(json);
			</c:forEach>
			var chartData = '';

			//날짜형식 변경하고 싶으시면 이 부분 수정하세요.
			var chartDateformat = 'MM월dd일';
			//라인차트의 라인 수
			var chartLineCount = 5;
			//컨트롤러 바 차트의 라인 수
			var controlLineCount = 5;

			function drawDashboard() {
				var data = new google.visualization.DataTable();
				//그래프에 표시할 컬럼 추가
				data.addColumn('datetime', '날짜');
				data.addColumn('number', '확진자');
				data.addColumn('number', '격리자');
				data.addColumn('number', '격리해제');
				data.addColumn('number', '사망자');

				//그래프에 표시할 데이터
				var dataRow = [];
				for (var i = 0; i < result.length ; i++) { //랜덤 데이터 생성
					var care = result[i].care;
					var coronaTrue = result[i].coronaTrue;
					var death = result[i].death;
					var safe = result[i].safe;
					var date = result[i].cDate; // 스트링

					var y = date.substring(0,4);  // 스트링 년
					var m = date.substring(5,7);  // 스트링 월
					var d = date.substring(8,10);  // 스트링 일
					var h = date.substring(11,13);  // 스트링 시

					// 자바 Date타입 월 (1, 2, 3, 4, 5, 6, ...)
					// JS Date타입 월 (0, 1, 2, 3, 4, 5, ...)
					var im = (m*1) - 1; //
					m = im+"";
					
					dataRow = [ new Date(y, m, d, h), coronaTrue, care, safe, death ];
					data.addRow(dataRow);
				}


				var chart = new google.visualization.ChartWrapper({
					chartType : 'LineChart',
					containerId : 'lineChartArea', //라인 차트 생성할 영역
					options : {
						selectionMode : 'multiple',
						isStacked : 'percent',
						focusTarget : 'category',
						height : 500,
						width : '100%',
						legend : {
							position : "top",
							textStyle : {
								fontSize : 13
							}
						},
						pointSize : 5,
						tooltip : {
							textStyle : {
								fontSize : 12
							},
							showColorCode : true,
							trigger : 'both'
						},
						hAxis : {
							format : chartDateformat,
							gridlines : {
								count : chartLineCount,
								units : {
									years : {
										format : [ 'yyyy년' ]
									},
									months : {
										format : [ 'MM월' ]
									},
									days : {
										format : [ 'dd일' ]
									}
								}
							},
							textStyle : {
								fontSize : 12
							}
						},
						vAxis : {
							viewWindowMode : 'pretty', // 세로축 자동 할당
							gridlines : {
								count : -1
							},
							textStyle : {
								fontSize : 12
							}
						},
						animation : {
							startup : true,
							duration : 1000,
							easing : 'in'
						},
						annotations : {
							pattern : chartDateformat,
							textStyle : {
								fontSize : 15,
								bold : true,
								italic : true,
								color : '#871b47',
								auraColor : '#d799ae',
								opacity : 0.8,
								pattern : chartDateformat
							}
						}
					}
				});

				var control = new google.visualization.ControlWrapper({
					controlType : 'DateRangeFilter',
					containerId : 'controlsArea', //control bar를 생성할 영역
					options : {
						ui : {
							label : '',
							chartType : 'LineChart',
							chartOptions : {
								chartArea : {
									'width' : '60%',
									'height' : 80
								},
								hAxis : {
									'baselineColor' : 'none',
									format : chartDateformat,
									textStyle : {
										fontSize : 12
									},
									gridlines : {
										count : controlLineCount,
										units : {
											years : {
												format : [ 'yyyy년' ]
											},
											months : {
												format : [ 'MM월' ]
											},
											days : {
												format : [ 'dd일' ]
											},
											hours : {
												format : [ 'HH시' ]
											}
										}
									}
								}
							}
						},
						filterColumnIndex : 0
					}
				});

				var date_formatter = new google.visualization.DateFormat({
					pattern : chartDateformat
				});
				date_formatter.format(data, 0);

				var dashboard = new google.visualization.Dashboard(document
						.getElementById('Line_Controls_Chart'));
				window.addEventListener('resize', function() {
					dashboard.draw(data);
				}, false); //화면 크기에 따라 그래프 크기 변경
				dashboard.bind([ control ], [ chart ]);
				dashboard.draw(data);

			}
			google.charts.setOnLoadCallback(drawDashboard);

		}
	}

	$(document).ready(function() {
		google.charts.load('current', {
			'packages' : [ 'line', 'controls' ]
		});
		chartDrowFun.chartDrow(); //chartDrow() 실행
	});
</script>
</body>
</html>
