<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 김기현 -->
<!-- 작성일 : 2020-02-24 -->
<!-- 최종수정일 : 2020-02-24 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!-- JSTL: JSP별로 따로 설정해야한다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CVAMA::<decorator:title /></title>
<!-- web 라이브러리: 공통으로 사용: 여기서만 선언해주면 된다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jQuery UI : datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Icons: Awesome 5, 4, BootStrap, Google Icon -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 795px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<decorator:head />
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				</div>
				<div class="collapse navbar-collapse" id="myNavbar" style="text-align:center">
					<ul class="nav navbar-nav">
						<li><i class='fas fa-viruses' style='font-size:45px;color:green'></i></li>
						<li><a href="${absUri }/ckorea/list.do">한국현황</a></li>
						<li><a href="${absUri }/clocal/list.do">지도현황</a></li>
						<li><a href="${absUri }/mask/maskMap.do">마스크맵</a></li>
						<li><a href="${absUri }/board/list.do">게시판</a></li>
					</ul>
				</div>
		</nav>	
		</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center">
		<p>TEAMCVAMA</p>
	</footer>
</body>
</html>