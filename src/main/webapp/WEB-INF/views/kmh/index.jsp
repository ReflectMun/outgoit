<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - index</title>
	<link rel="stylesheet" href="/resources/static/kmh/css/index.css">
	<link rel="stylesheet" href="../../kmh/css/index.css">
	<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<%--	<script type="text/javascript" src="../../kmh/js/index.js"></script>--%>
	<script>

		const title = document.querySelector('.title');

		function startAnimation() {
			title.classList.remove('bounce'); // 애니메이션 클래스 제거
			void title.offsetWidth; // 리플로우 트리거(애니메이션 클래스가 제거된 후 다시 추가되면 애니메이션이 재시작됨)
			title.classList.add('bounce'); // 애니메이션 클래스 추가
		}

		setInterval(startAnimation, 5000); // 5초마다 애니메이션 시작 함수 호출

	</script>

</head>
<body>
    
	<div class="container">
        <div class="header"></div>
		<div class="title-wrap">
			<div class="title animate__animated animate__bounce" >
				<span>OUT&nbsp;</span>
                <span class="go">GO&nbsp;</span>
                <span>IT</span>
			</div>
			<div class="sub-title animate__animated animate__fadein"><span>시간을 느리게, 경험을 깊게</span></div>
		</div>
		<div class="menu-wrap">
			<div class="menu">
				<div class="camp-icon"></div>
				<div class="txt menu-txt" id="txt1"><a href="/outgoit/camping"><span>CAMPING</span></a></div>
			</div>
			<div class="menu">
				<div class="hiking-icon"></div>
				<div class="txt menu-txt" id="txt2"><a href="/outgoit/hiking"><span>HIKING</span></a></div>
			</div>
			<div class="menu">
				<div class="riding-icon"></div>
				<div class="txt menu-txt" id="txt3"><a href="/outgoit/riding"><span>RIDING</span></a></div>
			</div>
		</div>
        <div class="footer"></div>
	</div> 


</body>
</html>