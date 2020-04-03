<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type='text/javascript' src='http://www.google.com/jsapi'></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<script type='text/javascript'>
	// 파이 차트
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

	// koreamap div
	var sum = 0;
	var deathSum = 0;
	var increaseSum = 0;
	
var wjsrnr = [];
<c:forEach items="${list }" var="dto">
	sum += ${dto.coronaTrue}
	deathSum += ${dto.death} 
	increaseSum += ${dto.increaseC}
	var wjsrnr2 = [];
	wjsrnr2.push("${dto.area}", "${dto.coronaTrue}");
	wjsrnr.push(wjsrnr2);
</c:forEach>
wjsrnr.sort(function(a, b) {
	  return a[1] - b[1];
	})
wjsrnr = wjsrnr.reverse();
var wjsrnrother = sum - (wjsrnr[0][1]*1 + wjsrnr[1][1]*1+ wjsrnr[2][1]*1+ wjsrnr[3][1]*1+ wjsrnr[4][1]*1) ;
//alert(wjsrnrother);
//alert(sum);
function drawChart() {
	
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    [wjsrnr[0][0],     wjsrnr[0][1]*1],
    [wjsrnr[1][0],     wjsrnr[1][1]*1],
    [wjsrnr[2][0],     wjsrnr[2][1]*1],
    [wjsrnr[3][0],     wjsrnr[3][1]*1],
    [wjsrnr[4][0],     wjsrnr[4][1]*1],
    ['other',     wjsrnrother*1]
   
  ]); 
  var options = {
	pieSliceText : 'none',
	tooltip:{textStyle : {fontSize:15}, showColorCode : true},
    title: '전국 현황',
    pieHole: 0.4,
    'width': 350,
    'height': 400,
    'chartArea': {'width': '90%', 'height': '80%'},
    legend :  {textStyle: {color: 'black', fontSize: 14}},
    titleTextStyle: {
        color: ('black'),    // any HTML string color ('red', '#cc00cc')
        fontName: 'Yeon Sung', // i.e. 'Times New Roman'
        fontSize: 20, // 12, 18 whatever you want (don't specify px)
        bold: true,    // true or false
        italic: false   // true of false
    }
  };
  var chart = new google.visualization.PieChart(document.getElementById('koreapiechart'));

  chart.draw(data, options);
}
  
	// 구글 지도
   google.load('visualization', '1', { 'packages' : [ 'geochart' ] });
   google.setOnLoadCallback(drawVisualization);

   function drawVisualization() {

		$(".divConfirmed").html("전국 확진자수&emsp;:&emsp;"+sum);
		$(".divDeath").html("전국 사망자수&emsp;:&emsp;"+deathSum);
		$(".divIncrease").html("전국 증가&emsp;&emsp;&nbsp;:&emsp;+"+increaseSum);
		
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'Country');
    data.addColumn('number', 'Value');
    data.addColumn({
     type : 'string',
     role : 'tooltip'
    });


	var korea_region = [["서울",'KR-11','Seoul'],
		["부산",'KR-26','Busan'],
		["대구",'KR-27','Daegu'],
		["인천",'KR-28','Incheon'],
		["광주",'KR-29','Gwangju'],
		["대전",'KR-30','Daejeon'],
		["울산",'KR-31','Ulsan'],
		["경기",'KR-41','Gyeonggi'],
		["강원",'KR-42','Gangwon'],
		["충북",'KR-43','North Chungcheong'],
		["충남",'KR-44','South Chungcheong'],
		["전북",'KR-45','North Jeolla'],
		["전남",'KR-46','South Jeolla'],
		["경북",'KR-47','North Gyeongsang'],
		["경남",'KR-48','South Gyeongsang'],
		["제주",'KR-49','Jeju'],
		["세종",'KR-50','Sejong'],
		["검역",'KR-50','Sejong'],
		];

var ivalue = [];

<c:forEach items="${list }" var="dto">

	var area;
	var code;
	var engl;
	for(i=0;i<20;i++){
		if(korea_region[i][0]=="${dto.area}"){
			area=korea_region[i][0];
			code=korea_region[i][1];
			engl=korea_region[i][2];
			break;
		}
	}
	
   totalrate = coloring("${dto.coronaTrue}");

   data.addRows([ [ {
	
	   v : code,  // 해당 도시코드( KR-11은 서울)
	   f : engl    // 마우스 올렸을때 오버되는 데이터 (Seoul Obama (D) 라고 뜬다)
	    }, totalrate,
	    "확진자수 : ${dto.coronaTrue}\n"+"증감 : +${dto.increaseC}" 
	    ] ]);
   ivalue[code] = [];
	    ivalue[code][0] = "${dto.coronaTrue}";
	    ivalue[code][1] = "${dto.death}";
	    ivalue[code][2] = "${dto.increaseC}";
	    ivalue[code][3] = "${dto.rate}";
	    ivalue[code][4] = "${dto.area}";
	    ivalue[code][5] = sum - "${dto.coronaTrue}";
	
</c:forEach>

    var options = {

     backgroundColor : {

      fill : '#FFFFFF',
      stroke : '#FFFFFF',
      strokeWidth : 0
     },

     colorAxis : {
      minValue : 0,
      maxValue : 5,
		// 지역 색깔
      colors : ['#FFCCCC','#FF9999','#FF0000','#CC3333','#660000','#FFCCCC']
     
     },
     
     legend : 'none',

     backgroundColor : {

      fill : '#FFFFFF', // 지도 전체 빽그라운드
      stroke : '#FFFFFF',
      strokeWidth : 0
     },

     datalessRegionColor : 'transparent', // 지도에서 전체 땅 색깔
     displayMode : 'regions',
     enableRegionInteractivity : 'true',
     resolution : 'provinces',

     sizeAxis : {

      minValue : 1,
      maxValue : 1,
      minSize : 10,
      maxSize : 10
     },

     region : 'KR',       // <--- 중요! 해당 나라의 위치 (US로 바꾸면 맵이 미국으로 뜬다)

     keepAspectRatio : true,

     width : 1000,
     height : 780,
     tooltip : {
     textStyle : {
     color : '#444444' // hover 글씨 색깔
      }, 
     trigger : 'hover'
     }

    };

    function coloring(coronaTrue){
        var totalrate = coronaTrue / sum * 100;
            if (totalrate > 50)	totalrate = 4;
            else if (totalrate > 10) totalrate = 3;
            else if (totalrate > 3) totalrate = 2;
            else if (totalrate > 0.5) totalrate = 1;
            else totalrate = 0;
       	return totalrate;
    }

    var chart = new google.visualization.GeoChart(document.getElementById('visualization'));

    google.visualization.events.addListener(chart, 'select',

      function() {
       var selection = chart.getSelection();
       if (selection.length == 1) {
        var selectedRow = selection[0].row;
        var selectedRegion = data.getValue(selectedRow, 0);

        if (ivalue[selectedRegion] != '') {
			//alert(ivalue[selectedRegion][0]);
			//alert(ivalue[selectedRegion][5]);
		// 강제 타입 변환	
		var localcoronatrue = ivalue[selectedRegion][0]*1;
		var othercoronatrue = ivalue[selectedRegion][5]*1;
		//alert(localcoronatrue);
		//alert(ivalue[selectedRegion][4]);
         $(".divConfirmed").html("확진자수&emsp;&emsp;&emsp;:&emsp;"+ivalue[selectedRegion][0]);
         $(".divDeath").html("사망자수&emsp;&emsp;&emsp;:&emsp;"+ivalue[selectedRegion][1]);
         $(".divIncrease").html("전일대비증가&nbsp;&nbsp;&nbsp;:&emsp;+"+ivalue[selectedRegion][2]);
         $(".divRate").html("10만명당 발생률&nbsp;:&emsp;"+ivalue[selectedRegion][3]);
         
         $("#koreapiechart").html(
                 function drawChart() { 
  
        	    	  var data = google.visualization.arrayToDataTable([
        	    		  ['Task', 'Hours per Day'],
        	    		    [ivalue[selectedRegion][4],     localcoronatrue],
        	    		    ['other',     othercoronatrue]
        	    		    
        	    	  ]);

        	    	  var options = {
        	    		slices: { 1: { offset: 0.1 },
        	    				  1: { color: '#f5f5f5' }
    				   },
    				   pieSliceTextStyle: {
    			            color: 'black',
            	    		fontSize: 15,
            	    		bold: true,
    			        },
    			        tooltip:{textStyle : {fontSize:15}, showColorCode : true},
        	    		pieHole: 0.4,
        	    	    title: '지역 현황',
        	    	    'width': 350,
        	            'height': 400,
        	            'chartArea': {'width': '90%', 'height': '80%'},
        	            'sliceVisibilityThreshold':0,
        	            legend :  {textStyle: {color: 'black', fontSize: 14}},
        	            titleTextStyle: {
        	                color: ('black'),    // any HTML string color ('red', '#cc00cc')
        	                fontName: 'Yeon Sung', // i.e. 'Times New Roman'
        	                fontSize: 20, // 12, 18 whatever you want (don't specify px)
        	                bold: true,    // true or false
        	                italic: false   // true of false
        	            }
        	    	  };

        	    	  var chart = new google.visualization.PieChart(document.getElementById('koreapiechart'));

        	    	  chart.draw(data, options);
        	    	}
             );
    	  }
       }
      });

    chart.draw(data, options);

   }

  </script>
  <script type="text/javascript">
  var replyService = (function() {

		// getList를 저장하는 프로그램 작성 - 필요한 데이터 param(no, page), callback-처리되는 함수, error-오류가 났을때 객체 
		function getList(param, callback, error){
				var page = param.page;

				// $.getJSON
				$.getJSON(
					//데이터 요청 URI
					"/clocalrep/pages/" + page + ".json",
					// 데이터 가져오기를 성공하면 처리되는 함수. data : 서버에서 넘어오는 데이터
					function(data){
						// 데이터를 가져오기를 성공하면 실행되는 하무를 밖에서 선언해서 넣어주는 경우 처리
						if(callback){
							callback(data);
						}
					}
				// 데이터 가져오는 것을 실패했을 때의 처리
				).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
			}

		// 날짜 timestamp 숫자를 받아서 날짜 형식으로 리턴해주는 함수 -> json데이터로 받을때
		function displayDate(timeValue){

			var today = new Date(); // 오늘 날짜 셋팅
			// today.getTime() - timeValue // 현재 날짜시간과 댓글 작성일의 차이를 알아낸다
			// 차이가 24시간이 지나지 않았으면 시간을 지낫으면 날짜를 표시할 수 있도록 할 수 있다.

			var dateObj = new Date(timeValue); // 댓글을 작성한 날짜 객체
			var str = "";
			str += dateObj.getFullYear()+ ".";
			str += (dateObj.getMonth() + 1) + "."; // month는 0~11을 사용하기때문에 +1
			str += dateObj.getDate();

			// [yy, mm, dd].join("."); - 중간에 .을 이용해서 이어 붙인다.
			return str;

		}

		// 댓글 등록 처리 함수 선언
		function add(reply, callback, error){

			// ajax를 이용해서 데이터 넘기기 처리 - load(), #.getJSON, $.ajax()
			$.ajax({
				type : 'post',
				url : '/clocalrep/new',
				// data : ?뒤에 쿼리를 의미 k=v&&k=v -> JSON.stringify(jsondata)로 변환
				data : JSON.stringify(reply),
				/* data : reply, */
				contentType : "application/json; charset=utf-8",
				// 등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다 
				success : function(result, status, xhr){
					if (callback){
						callback(result);
					}
				},
				// 등록 오류가 발생된 경우 처리
				error :function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			})
		}

		// 댓글 수정 처리 함수 선언
		function update(reply, callback, error){

			// ajax를 이용해서 데이터 넘기기 처리 - load(), #.getJSON, $.ajax()
			$.ajax({
				type : "patch",
				url : "/clocalrep/" + reply.no,
				// data : ?뒤에 쿼리를 의미 k=v&&k=v -> JSON.stringify(jsondata)로 변환
				data : JSON.stringify(reply),
				/* data : reply, */
				contentType : "application/json; charset=utf-8",
				// 등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다 
				success : function(result, status, xhr){
					if (callback){
						callback(result);
					}
				},
				// 등록 오류가 발생된 경우 처리
				error :function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			})
		}
		function repDelete(reply, callback, error){

			// ajax를 이용해서 데이터 넘기기 처리 - load(), #.getJSON, $.ajax()
			$.ajax({
				type : "post",
				url : "/clocalrep/" + reply.no,
				// data : ?뒤에 쿼리를 의미 k=v&&k=v -> JSON.stringify(jsondata)로 변환
				data : JSON.stringify(reply),
				/* data : reply, */
				contentType : "application/json; charset=utf-8",
				// 등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다 
				success : function(result, status, xhr){
					if (callback){
						callback(result);
					}
				},
				// 등록 오류가 발생된 경우 처리
				error :function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			})
		}
		
		return {
			// 댓글 리스트가 처리된 결과를 만들어 내는 함수
			add : add,
			getList : getList,
			displayDate : displayDate,
			update : update,
			repDelete : repDelete
			};
	})();
  $(function(){

		// 댓글 리스트를 표시할 객체 저장
		var replyUL = $(".chat")
		
		// 댓글 리스트를 가져와서 보여주는 함수 호출
		showList(1);
		
//		alert(replyService.getList);
	//  댓글 리스트를 보여주는 function : 글보기를 호출하면 바로 보여주는 부분이므로 페이지는 1페이지이다.
		function showList(page){
			replyService.getList(
				{page:page},
				function(data){
					replist = data.replyList;
					var str = "";
					// 댓글이 없는 경우의 처리
					if(replist == null || replist.length == 0){
						replyUL.html("<li class='left clearfix'>댓글 존재하지 않습니다.</li>")
						return;
					}
					// 댓글이 있는 경우의 처리
					for(var i = 0; i < replist.length; i++){
						var dto = replist[i];
						str += "<li class='left clearfix' data-no='"+dto.no+"'>";
						str += "<div>";
						str += "<div class='header'>";
						str += "<strong class='primary-font writer'>"+dto.writer+"</strong>";
						str += "<small class='pull-right text-muted'>"+replyService.displayDate(dto.writeDate)+"</small>";
						str += "</div>";
						str += "<div class='content'>"+dto.content+"</div>";
						str += "<span class='pull-right'>"
								+"<button class='btn btn-default btn-xs replyUpdateBtn'>수정</button>"
								+"<button class='btn btn-default btn-xs deleteUpdateBtn' data-no='"+dto.no+"'>삭제</button>"
								+"</span>";
						str += "<div class='input-group' style='display:none' id='deletepw'>";
						str += "<i class='glyphicon glyphicon-lock' style='float:left; font-size:19px;'></i>";
						str += "<input id='deletepwinput' style='height:22px; width:100px;' type='password' class='form-control' name='pw' placeholder='Password'>";
						str += "</div>";
						str += "</div>";
						str += "<hr>";
						str += "</li>";
					} 

					str += "<div style='text-align:center;' class='replyPaging'>";
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

		// 댓글 처리에 대한 이벤트 처리
		$("#writeReplyBtn").click(function(){

			$("#usr").attr("readonly", false);
			$("#no").val("");		
			$("#comment").val("");		
			$("#usr").val("");
			$("#pwd").val("");
			$("#submitBtn").text("Submit");
			$("#submitBtn").attr("type", "submit");
			// 모달 창을 보여주자
			$("#writerep").show();
		});
		
		// 댓글 등록 버튼 클릭 이벤트 -> form의 데이터를 넘기는 이벤트
		$("#writeform").submit(function(){
			// Ajax로 넘길 데이터를 가저온다
			var reply={
				content : $("#comment").val(),
				writer : $("#usr").val(),
				pw : $("#pwd").val()
			}
			replyService.add(
				reply,
				function(result){
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해 준다.
					alert(result);
					$("#comment").val("");		
					$("#usr").val("");
					$("#pwd").val("");
					// 사용을 한 모달차으이 입력란을 비워 둔다.
					//$("#updateModal").find("input, textarea").val("");
					// 댓글 리스트를 다시 뿌란다.
					$("#writerep").hide();
					showList(1);
				}
			);
			// submit을 무시 시킨다. -> Ajax처리를 하기 위해서
			return false;
		});
		
		// 댓글의 수정, 삭제 버튼 처리 -> Ajax 후에 나타나는 버튼 이므로 여기서 직접 찾을 때는 Ajax 전이므로 적용 불가
		// 그래서 On(이벤트, 선택자, 함수) : 선택자는 find()에 의해 찾기가 진행이 된다. 
		$(".chat").on("click", ".replyUpdateBtn", function(){
			var replyRow = $(this).closest("li");
			var no = replyRow.data("no");
			var content = replyRow.find(".content").text();
			var writer = replyRow.find(".writer").text();

			// 모달 창에 데이터 셋팅
			$("#no").val(no);		
			$("#comment").val(content);		
			$("#usr").val(writer);
			$("#pwd").val("");
			// 작성자는 수정 불가로 처리
			$("#usr").attr("readonly", "readonly");

			// 수정을 위해서 submit에서 동작이 되지 않는 button으로 변경
			$("#submitBtn").attr("type", "button");
			// 버튼 이름을 수정으로 변경		
			$("#submitBtn").text("Update");
			// 비밀번호는 호가인용이므로 입력된 내용이 화면에 나타 나지 않는다
			$("#pwd").attr("type", "password");

			// 모달창을 화면에 표시한다
			$("#writerep").show();		
		});

  		// 삭제 버튼 클릭시 비빌번호창 오픈
		$(".chat").on("click", ".deleteUpdateBtn", function(){
			var replyRow = $(this).closest("li");  
			var no = replyRow.data("no");
				if(no==$(this).data("no"))
					
					var updateBtn = replyRow.find(".replyUpdateBtn");
					updateBtn.text("취소");  
					updateBtn.attr("class", "btn btn-default btn-xs deleteclose");

					var deleteBtn = replyRow.find(".deleteUpdateBtn");
					deleteBtn.text("삭제");
					deleteBtn.attr("class", "btn btn-default btn-xs repdelete");
					deleteBtn.attr("type", "submit");

					var deleteInput = replyRow.find("#deletepw");
					deleteInput.show();	
		});
		// 삭제처리
		$(".chat").on("click", ".repdelete", function(){
			var replyRow = $(this).closest("li");  
			var reply={
					no : replyRow.data("no"),
					pw : replyRow.find("#deletepwinput").val()
				}
			replyService.repDelete(
					reply,
					function(result){
						// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해 준다.
						alert(result);
						showList(1);
					},
					function(er){
						alert("비밀번호를 확인하세요");
						}
			);
		});
		
		// 삭제창 닫기
		$(".chat").on("click", ".deleteclose", function(){
			var replyRow = $(this).closest("li");  

				var updateBtn1 = replyRow.find(".deleteclose");
				updateBtn1.text("수정");  
				updateBtn1.attr("class", "btn btn-default btn-xs replyUpdateBtn");

				var deleteBtn1 = replyRow.find(".repdelete");
				deleteBtn1.text("삭제");
				deleteBtn1.attr("class", "btn btn-default btn-xs deleteUpdateBtn");
				deleteBtn1.attr("type", "button");

				// 취소시 빈공간 제거	
				$("#deletepwinput").val("");   
				
				var deleteclose = replyRow.find("#deletepw");
				deleteclose.hide();	

					
		});

		 
		// 입력 창 닫기 버튼 
		$(".close").click(function(){

			$("#usr").attr("readonly", false);
			$("#no").val("");		
			$("#comment").val("");		
			$("#usr").val("");
			$("#pwd").val("");
			$("#writerep").hide();
			});

		// 수정 처리 함수
		$("#submitBtn").click(function(){
			// 같은 버튼을 등록과 삭제에서도 사용하기 떄문에 등록과 삭제인 경우는 처리를 안하도록 시킨다.
			if($(this).text()=="Submit" || $(this).text()=="삭제")
				return;
			// Ajax로 넘길 데이터를 가져온다.
			var reply ={
				no :  $("#no").val(),
				content :  $("#comment").val(),
//				writer: $("#modal_writer").val(),
				pw : $("#pwd").val()
			}
	 		// alert(JSON.stringify(reply));
			replyService.update(
				reply,
				function(result){
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
					alert(result);
					// 사용을한 모달창의 입력란을 비워둔다.
					$("#writerep").find("input, textarea").val("");
					// 모달 창은 숨긴다.
					$("#writerep").hide();

					var thisno = $(".chat").find(".pagination").find(".active");

					thispage = thisno.data('page');
					
					// 댓글 리스트를 다시 뿌린다.
					showList(thispage);
				},
				function(error){
					alert("비밀번호를 확인하세요");
				}
			);
		});
		$(".chat").on("click", ".pagination > li:not('.active')",
			function() {
				var page = $(this).data("page");
				showList(page);
		});
	});

</script>
<script type="text/javascript">
google.load('visualization', '1', { 'packages' : [ 'geochart' ] });
google.setOnLoadCallback(drawVisualization);

function drawVisualization() {
	var data = new google.visualization.DataTable();

    data.addColumn('string', 'Country');
    data.addColumn('number', 'Value');
    data.addColumn({
     type : 'string',
     role : 'tooltip'
    });

	var world_region = 
		[["미국",'US','USA'],
		["이탈리아",'IT','Italy'],
		["중국",'CN','China'],
		["스페인",'ES','Spain'],
		["독일",'DE','Germany'],
		["프랑스",'FR','France'],
		["이란",'IR','Iran'],
		["영국",'GB','UK'],
		["스위스",'CH','Switzerland'],
		["네덜란드",'NL','Netherlands'],
		["벨기에",'BE','Belgium'],
		["대한민국",'KR','S. Korea'],
		["터키",'TR','Turkey'],
		["오스트리아",'AT','Austria'],
		["캐나다",'CA','Canada'],
		["포르투갈",'PT','Portugal'],
		["노르웨이",'NO','Norway'],
		["브라질",'BR','Brazil'],
		["이스라엘",'IL','Israel'],
		["호주",'AU','Australia'],
		["스웨덴",'SE','Sweden'],
		["체코",'CZ','Czechia'],
		["아일랜드",'IE','Ireland'],
		["말레이시아",'MY','Malaysia'],
		["덴마크",'DK','Denmark'],
		["칠레",'CL','Chile'],
		["룩셈부르크",'LU','Luxembourg'],
		["에콰도르",'EC','Ecuador'],
		["일본",'JP','Japan'],
		["폴란드",'PL','Poland'],
		["루마니아",'RO','Romania'],
		["파키스탄",'PK','Pakistan'],
		["러시아",'RU','Russia'],
		["필리핀",'PH','Philippines'],
		["태국",'TH','Thailand'],
		["사우디아라비아",'SA','Saudi Arabia'],
		["인도네시아",'ID','Indonesia'],
		["남아프리카공화국",'ZA','South Africa'],
		["핀란드",'FI','Finland'],
		["그리스",'GR','Greece'],
		["인도",'IN','India'],
		["아이슬란드",'IS','Iceland'],
		["파나마",'PA','Panama'],
		["도미니카공화국",'DO','Dominican Republic'],
		["페루",'PE','Peru'],
		["멕시코",'MX','Mexico'],
		["싱가포르",'SG','Singapore'],
		["아르헨티나",'AR','Argentina'],
		["세르비아",'RS','Serbia'],
		["슬로베니아",'SI','Slovenia'],
		["크로아티아",'HR','Croatia'],
		["일본크루즈",'00','Diamond Princess'],
		["콜롬비아",'CO','Colombia'],
		["에스토니아",'EE','Estonia'],
		["홍콩",'HK','Hong Kong'],
		["카타르",'QA','Qatar'],
		["이집트",'EG','Egypt'],
		["아랍에미리트",'AE','UAE'],
		["이라크",'EG','Iraq'],
		["뉴질랜드",'NZ','New Zealand'],
		["알제리",'DZ','Algeria'],
		["바레인",'BH','Bahrain'],
		["모로코",'MA','Morocco'],
		["우크라이나",'UA','Ukraine'],
		["리투아니아",'LT','Lithuania'],
		["레바논",'LB','Lebanon'],
		["아르메니아",'AM','Armenia'],
		["헝가리",'HU','Hungary'],
		["라트비아",'LV','Latvia'],
		["불가리아",'BG','Bulgaria'],
		["안도라",'AD','Andorra'],
		["보스니아헤르체고비나",'BA','Bosnia and Herzegovina'],
		["슬로바키아",'SK','Slovakia'],
		["코스타리카",'CR','Costa Rica'],
		["튀니지",'TN','Tunisia'],
		["우루과이",'UY','Uruguay'],
		["대만",'TW','Taiwan'],
		["카자흐스탄",'KZ','Kazakhstan'],
		["몰도바",'MD','Moldova'],
		["요르단",'JO','Jordan'],
		["북마케도니아",'MK','North Macedonia'],
		["쿠웨이트",'KW','Kuwait'],
		["산마리노",'SM','San Marino'],
		["부르키나파소",'BF','Burkina Faso'],
		["키프로스",'CY','Cyprus'],
		["알바니아",'AL','Albania'],
		["아제르바이잔",'AZ','Azerbaijan'],
		["사이프러스",'CY','Cyprus'],
		["베트남",'VN','Vietnam'],
		["레위니옹",'RE','Réunion'],
		["오만",'OM','Oman'],
		["코트디부아르",'CI','Ivory Coast'],
		["패로제도",'FO','Faeroe Islands'],
		["가나",'GH','Ghana'],
		["몰타",'MT','Malta'],
		["우즈베키스탄",'UZ','Uzbekistan'],
		["세네갈",'SN','Senegal'],
		["카메룬",'CM','Cameroon'],
		["쿠바",'CU','Cuba'],
		["브루나이",'BN','Brunei'],
		["아프가니스탄",'AF','Afghanistan'],
		["베네수엘라",'VE','Venezuela'],
		["스리랑카",'LK','Sri Lanka'],
		["나이지리아",'NG','Nigeria'],
		["온두라스",'NH','Honduras'],
		["팔레스타인",'PS','Palestine'],
		["모리셔스",'MU','Mauritius'],
		["과들루프",'GP','Guadeloupe'],
		["캄보디아",'KH','Cambodia'],
		["벨라루스",'BY','Belarus'],
		["마르티니크",'MQ','Martinique'],
		["조지아",'GE','Georgia'],
		["몬테네그로",'ME','Montenegro'],
		["키르기스스탄",'KG','Kyrgyzstan'],
		["DR콩고",'CD','DRC'],
		["볼리비아",'BO','Bolivia'],
		["트리니다드토바고",'TT','Trinidad and Tobago'],
		["르완다",'RW','Rwanda'],
		["지브롤터",'GI','Gibraltar'],
		["파라과이",'PY','Paraguay'],
		["마요트",'YT','Mayotte'],
		["리히텐슈타인",'LI','Liechtenstein'],
		["괌",'GU','Guam'],
		["저지섬",'JE','Jersey'],
		["건지섬",'GG','Guernsey'],
		["아루바",'AW','Aruba'],
		["방글라데시",'BD','Bangladesh'],
		["모나코",'MC','Monaco'],
		["프랑스령기아나",'GF','French Guiana'],
		["프랑스령레위니옹",'RE','French Reunion'],
		["케냐",'KE','Kenya'],
		["맨섬",'IM','Isle of Man'],
		["푸에르토리코",'PR','Commonwealth of Puerto Rico'],
		["마다가스카르",'MG','Madagascar'],
		["마카오",'MO','Macao'],
		["과테말라",'GT','Guatemala'],
		["바베이도스",'BB','Barbados'],
		["우간다",'UG','Uganda'],
		["자메이카",'JM','Jamaica'],
		["프랑스령폴리네시아",'PF','French Polynesia'],
		["토고",'TG','Togo'],
		["잠비아",'ZM','Zambia'],
		["엘살바도르",'SV','El Salvador	'],
		["가이아나",'GY','Guinea'],
		["버뮤다",'BM','Bermuda'],
		["에티오피아",'ET','Ethiopia'],
		["코소보",'XK','Kosovo '],
		["콩고",'CG','Congo'],
		["지부티",'DJ','Sejong'],
		["니제르",'NE','Niger'],
		["말리",'ML','Mali'],
		["몰디브",'MV','Maldives'],
		["미국령버진아일랜드",'VI','United States Virgin Islands'],
		["기니",'GN','Guinea'],
		["뉴칼레도니아",'NC','New Caledonia'],
		["아이티",'HT','Haiti'],
		["탄자니아",'TZ','Tanzania'],
		["바하마",'BS','Bahamas'],
		["몽골",'MN','Mongolia'],
		["적도기니",'GQ','Equatorial Guinea'],
		["케이맨제도",'KY','Cayman Islands'],
		["에리트레아",'ER','Eritrea'],
		["나미비아",'NA','Namibia'],
		["세인트마틴",'MF','Saint Martin'],
		["도미니카연방",'DM','Dominica'],
		["그린랜드",'GL','Greenland'],
		["미얀마",'MM','Myanmar'],
		["세인트루시아",'LC','Saint Lucia'],
		["에스와티니",'SZ','Eswatini'],
		["그레나다",'GD','Grenada'],
		["시리아",'SY','Syria'],
		["세이셸",'SC','Republic of Seychelles'],
		["수리남",'SR','Suriname'],
		["퀴라소",'CW','Curaçao'],
		["모잠비크",'MZ','Mozambique'],
		["라오스",'LA','Laos'],
		["리비아",'LY','Libya'],
		["가봉",'GA','Gabon'],
		["앤티가바부다",'AG','Antigua and Barbuda'],
		["앙골라",'AO','Angola'],
		["짐바브웨",'ZW','Zimbabwe'],
		["수단",'SD','Sudan'],
		["베냉",'BJ','Benin'],
		["바티칸",'VA','Vatican City'],
		["신트마르틴",'SX','Sint Maarten'],
		["카보베르데",'CV','Cabo Verde'],
		["생바르텔레미",'BL','Saint Barthélemy'],
		["모리타니아",'MR','Mauritania'],
		["네팔",'NP','Nepal'],
		["몬트세라트",'MS','Montserrat'],
		["피지",'FJ','Fiji'],
		["부탄",'BT','Bhutan'],
		["감비아",'GM','Gambia'],
		["니카라구아",'NI','Nicaragua'],
		["터크스케이커스제도",'TC','Turks and Caicos'],
		["중앙아프리카공화국",'CF','République Centrafricaine'],
		["라이베리아",'LR','Liberia'],
		["소말리아",'SO','Somalia'],
		["차드",'TD','Chad'],
		["벨리즈",'BZ','Belize'],
		["기니비사우",'GW','Guinea-Bissau'],
		["영국령버진아일랜드",'VG','British Virgin Islands'],
		["세인트키츠네비스",'KH','Saint Kitts and Nevis'],
		["앵귈라",'AI','Anguilla'],
		["잔담(크루즈)",'11','MS Zaandam'],
		["세인트빈센트그레나딘",'VC','St. Vincent Grenadines'],
		["파푸아뉴기니",'PG','Papua New Guinea'],
		["동티모르",'TL','Timor-Leste'],
		["세이쉘",'SC','Seychelles'],
		["보츠와나",'BW','Botswana']
		];
	
	var ivalue = [];
	var worldSum = 0;
	<c:forEach items="${worldlist }" var="dto">
		worldSum += ${dto.coronaTrue}
	</c:forEach>
	<c:forEach items="${worldlist }" var="dto">
		var worldarea;
		var worldcode;
		var worldengl;
		for(i=0;i<210;i++){
			if(world_region[i][0]=="${dto.country}"){
				worldarea=world_region[i][0];
				worldcode=world_region[i][1];
				worldengl=world_region[i][2];
				break;
			}
		}
		
	   Wtotalrate = worldColoring("${dto.coronaTrue}");
	 
	   data.addRows([ [ {
		
		   v : worldcode,  // 해당 도시코드( KR-11은 서울)
		   f : worldengl    // 마우스 올렸을때 오버되는 데이터 (Seoul Obama (D) 라고 뜬다)
		    }, Wtotalrate,
		    "확진자수 : ${dto.coronaTrue}\n"+"사망자수 : ${dto.death}" 
		    ] ]);
	   ivalue[worldcode] = [];
		    ivalue[worldcode][0] = "${dto.coronaTrue}";
		    ivalue[worldcode][1] = "${dto.death}";
		
	</c:forEach>

	Wtotalrate = worldColoring(sum);
	data.addRows([ [ {
		
		   v : 'KR',  // 해당 도시코드( KR-11은 서울)
		   f : 'Korea' // 마우스 올렸을때 오버되는 데이터 (Seoul Obama (D) 라고 뜬다)
		    }, Wtotalrate,
		    "확진자수 : "+sum+"\n"+"사망자수 : "+deathSum 
		    ] ]);
	   ivalue[worldcode] = [];
		    ivalue[worldcode][0] = "${dto.coronaTrue}";
		    ivalue[worldcode][1] = "${dto.death}";


    var options = {

    	     colorAxis : {
    	      minValue : 0,
    	      maxValue : 4,
    			// 지역 색깔
    	      colors : ['#FFCCCC','#FF9999','#FF0000','#CC3333','#660000']
    	     },
    	    };
    
    function worldColoring(WcoronaTrue){
        var Wtotalrate = WcoronaTrue / worldSum * 100;
            if (Wtotalrate > 10)	Wtotalrate = 4;
            else if (Wtotalrate > 5) Wtotalrate = 3;
            else if (Wtotalrate > 1) Wtotalrate = 2;
            else if (Wtotalrate > 0.5) Wtotalrate = 1;
            else Wtotalrate = 0;
       	return Wtotalrate;
    }
    
    var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

    chart.draw(data, options);
  }
</script>
<script type="text/javascript">
$(function(){
	  $('.koreaChangeBtn').click(function(){
	  	$(".worldChangeBtn").attr("style", "display:inline");
		$(".world").attr("style", "display:none");
	  	$("#koreamap").attr("style", "display:inline");
	  	$(".korea").attr("style", "display:inline");
	  	$(".koreaChangeBtn").attr("style", "display:none");
	  	$(".title").text("한국 현황");
	  });
	  $('.worldChangeBtn').click(function(){
	  	$(".koreaChangeBtn").attr("style", "display:inline");
	  	$(".world").attr("style", "display:inline");
	  	$("#koreamap").attr("style", "display:none");
	  	$(".korea").attr("style", "display:none");
	  	$(".worldChangeBtn").attr("style", "display:none");
	  	$(".title").text("전세계 현황");
	  }); 
	}); 
</script>
<style>
#koreamap{
  position:absolute;
  margin-left:850px;
  z-index:10;
  float:right;
  height:80%;
  width:500px;
  background-color:white;
  display:none
}
ul{
	padding:0px;
  list-style:none;
  	}
.pageBtn:hover{
  	cursor:pointer   	
  	}
.active{
	color: red
	}
.corona {
	font-family: 'Yeon Sung', cursive;
	font-size: 23px;
}
.korea{
	float: left;
	z-index: 1;
	display:none
}
.world{
	float: left;
	width: 1200px;
	height:800px;
	z-index: 1;
}
.changeDiv{
	position:absolute;
	z-index: 30;
	top:80px;
	left:20px
}   
.title{
	position: absolute;
	z-index: 30;
	left : 460px;
	top: 55px;
	font-size: 30px;
	font-family: 'Yeon Sung', cursive;
}
.content{
	word-break: break-all
}
</style>
  </head>
  <body>
  <div>
  <div class="changeDiv container">
  <button class="koreaChangeBtn btn-default" type="button">한국 지역 현황</button>
  <button class="worldChangeBtn btn-default" type="button" style="display:none">전세계 현황</button>
  </div>
  <div class="title"><p>전세계 현황</p></div>   
  <div id='koreamap'>
  	<div id='koreapiechart' style="width:300; z-index:11;"></div>
  	<div class="divConfirmed corona" ></div>
  	<div class="divDeath corona" ></div>
  	<div class="divIncrease corona" style=" color:red;"></div> 
  	<div class="divRate corona" ></div>
  </div>
  <div class='korea' id='visualization'></div>
  <div class='world' id='regions_div'></div>
  <div class="container" style="width: 400px; height: 800px; position:absolute; margin-left:1250px; float:right; z-index:100;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>Reply
			<button id="writeReplyBtn" class="btn btn-primary btn-xs pull-right">New</button>
		</div>		
		<div class="panel-body">
			<form id="writeform">   
			  <input name="no" id="no" type="hidden">
				<div style="display:none;" id='writerep'>
				  <div class="form-group">
					  <label for="usr">Name:</label>
					  <input type="text" class="form-control" id="usr" name="writer" placeholder="아이디 20글자 이하" maxlength="20">
				  </div>
				  <div class="form-group">
 						 <label for="comment">Comment:</label>
  						 <textarea class="form-control" rows="2" id="comment" name="content" placeholder="100글자 이하" maxlength="100"></textarea>
						 </div>
				  <div class="form-group">
					  <label for="pwd">Password:</label>
					  <input type="password" class="form-control" id="pwd" name="pw" placeholder="비밀번호 4자리 이상 20자리 이하" maxlength="20" minlength="4">
				  </div>
				  <div>
				  <button class="btn btn-default btn-sm" id="submitBtn">Submit</button>
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <br>
				  </div>
				</div>
			</form>
			<div>
			<ul class="chat">
			</ul>
			</div>
		</div>
	</div>
  </div>
</div>
</body></html>