<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - index</title>
	<link rel="stylesheet" href="/resources/static/css/index.css">
	<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
    
	<div class="mh-index-container">
		<div class="mh-index-wrap">

		<div class="mh-index-title-wrap">
			<div class="mh-title animate__animated animate__bounce" >
				<span>OUT&nbsp;</span>
                <span class="mh-go">GO&nbsp;</span>
                <span>IT</span>
			</div>
			<div class="mh-sub-title animate__animated animate__fadein"><span>시간을 느리게, 경험을 깊게</span></div>
		</div>

		<div class="mh-index-wrap-container">
<%--			menu wrap을 중앙 정렬하기 위한 div--%>
		<div class="mh-menu-wrap">
			<div class="mh-menu" onclick="location.href='/outgoit/camping'">
				<div class="mh-camp-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt1"><span>CAMPING</span></div>
			</div>
			<div class="mh-menu" onclick="location.href='/outgoit/hiking'">
				<div class="mh-hiking-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt2"><span>HIKING</span></div>
			</div>
			<div class="mh-menu" onclick="location.href='/outgoit/riding'">
				<div class="mh-riding-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt3"><span>RIDING</span></div>
			</div>
		</div>
		</div>

	</div>

        <div class="footer"></div>
	</div> 


</body>
</html>