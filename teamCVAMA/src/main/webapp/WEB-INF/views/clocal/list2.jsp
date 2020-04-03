<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>

<script type='text/javascript' src='http://www.google.com/jsapi'></script>
  <script type='text/javascript'>

   google.load('visualization', '1', {

    'packages' : [ 'geochart' ]

   });
   google.setOnLoadCallback(drawVisualization);

/* 	if ('${dto.area}'=='부산'){
		alert("${dto.death}")
		}
 */
   function drawVisualization() {

    var data = new google.visualization.DataTable();



    data.addColumn('string', 'Country');

    data.addColumn('number', 'Value');

    data.addColumn({

     type : 'string',

     role : 'tooltip'

    });

	var sum = 0;

	var korea_region = [
		{name:"서울",code:'KR-11',engl:'Seoul'}
		];
	
<c:forEach items="${list }" var="dto">
	sum += ${dto.coronaTrue} 
</c:forEach>

    var ivalue = new Array();
<c:forEach items="${list }" var="dto">
	var area;
	for(int i=0;i++;i<korea_region.length()){
		if(korea_region[i][name]=="${dto.area}"){
			area="${dto.area}";
			break;
		}
	}
/*     if("${dto.area}"=="서울"){ */
     var totalrate = "${dto.coronaTrue}" / sum * 100;
     
   data.addRows([ [ {
	
	   v : korea_region[code],  // 해당 도시코드( KR-11은 서울)
	
	   f : korea_region[engl]    // 마우스 올렸을때 오버되는 데이터 (Seoul Obama (D) 라고 뜬다)
	
	    }, 0,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
	    ] ]);
	
	    ivalue['KR-11'] = 'Obama (D)  will <span style="color:#444; font-weight:bold;">win</span> in 서울.';
    }



    if("${dto.area}"=="부산"){
	    data.addRows([ [ {
	
	     v : 'KR-26',
	
	     f : 'Busan'
	
	    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
	    ] ]);
	
	    ivalue['KR-26'] = 'Obama (D) will win in 부산';
    }

    if("${dto.area}"=="대구"){

    totalrate = coloring("${dto.coronaTrue}");
    data.addRows([ [ {

     v : 'KR-27',

     f : 'Daegu'

    }, totalrate,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-27'] = 'Obama (D) will win in 대구';
    }


    if("${dto.area}"=="대전"){
    data.addRows([ [ {

     v : 'KR-30',

     f : 'Daejeon'

    }, 3, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-30'] = 'Obama (D) will win in 대전';
    }




    

    if("${dto.area}"=="광주"){
    data.addRows([ [ {

     v : 'KR-29',

     f : 'Gwangju'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-29'] = 'Obama (D) will win in 광주';
    }


    if("${dto.area}"=="인천"){
    data.addRows([ [ {

     v : 'KR-28',

     f : 'Incheon'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-28'] = 'Obama (D) will win in 인천';
    }
    
    if("${dto.area}"=="경북"){
    data.addRows([ [ {

     v : 'KR-47',

     f : 'North Gyeongsang'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-47'] = 'Obama (D) will win in 경상북도';
    }
    
    if("${dto.area}"=="경남"){
    data.addRows([ [ {

     v : 'KR-48',

     f : 'South Gyeongsang'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-48'] = 'Obama (D) will win in 경상남도';
    }

    
    if("${dto.area}"=="전북"){
    data.addRows([ [ {

     v : 'KR-45',

     f : 'North Jeolla'

    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-45'] = 'Obama (D) will win in 전라북도';
    }

    
    if("${dto.area}"=="전남"){
    data.addRows([ [ {

     v : 'KR-46',

     f : 'South Jeolla'

    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-46'] = 'Obama (D) will win in 전라남도';
    }
    
    if("${dto.area}"=="충북"){
     data.addRows([ [ {

     v : 'KR-43',

     f : 'North Chungcheong'

    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-43'] = 'Obama (D) will win in 충청북도';
    }

    if("${dto.area}"=="충남"){
     data.addRows([ [ {

     v : 'KR-44',

     f : 'South Chungcheong'

    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-44'] = 'Obama (D) will win in 충청남도';
    }
    
    if("${dto.area}"=="경기"){
    data.addRows([ [ {

     v : 'KR-41',

     f : '	Gyeonggi'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-41'] = 'Obama (D) will win in 경기도';
    }

    if("${dto.area}"=="강원"){
    data.addRows([ [ {

     v : 'KR-42',

     f : '	Gangwon'

    }, 1, 
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-42'] = 'Obama (D) will win in 강원도';
    }

    if("${dto.area}"=="제주"){
    data.addRows([ [ {

     v : 'KR-49',

     f : 'Jeju'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-49'] = 'Obama (D) will win in 제주도';
    }

    if("${dto.area}"=="울산"){
    data.addRows([ [ {

     v : 'KR-31',

     f : 'Ulsan'

    }, 1,
	    "${dto.coronaTrue}\n"+"+${dto.increaseC}" 
    ] ]);

    ivalue['KR-31'] = 'Obama (D) will win in 울산';
    }
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
      colors : ['#FFCCCC','#FF9999','#CC3333','#FF0000','#660000']
     
     },
     
     legend : 'none',

     backgroundColor : {

      fill : '#FFFFFF', 

      stroke : '#FFFFFF', // 지도 전체 빽그라운드

      strokeWidth : 0

     },

     datalessRegionColor : '#f5f5f5', // 지도에서 전체 땅 색깔

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

     width : 600,

     height : 400,

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
            else if (totalrate > 1) totalrate = 1;
            else totalrate = 0;
       	return totalrate;
    }
    
    var chart = new google.visualization.GeoChart(document

      .getElementById('visualization'));

    google.visualization.events.addListener(chart, 'select',

      function() {

       var selection = chart.getSelection();

       if (selection.length == 1) {

        var selectedRow = selection[0].row;

        var selectedRegion = data.getValue(selectedRow,

          0);

        if (ivalue[selectedRegion] != '') {

         alert(ivalue[selectedRegion]);

        }

       }

      });

    chart.draw(data, options);

   }

  </script>
  <div id='visualization'></div>




