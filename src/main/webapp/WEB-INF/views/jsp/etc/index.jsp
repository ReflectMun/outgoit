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
</head>
<body oncontextmenu="return false">
    
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
			<div class="mh-menu" onclick="location.href='/camping'">
				<div class="mh-camp-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt1"><span>CAMPING</span></div>
			</div>
			<div class="mh-menu" onclick="location.href='/hiking'">
				<div class="mh-hiking-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt2"><span>HIKING</span></div>
			</div>
			<div class="mh-menu" onclick="location.href='/riding'">
				<div class="mh-riding-icon"></div>
				<div class="mh-txt mh-menu-txt" id="txt3"><span>RIDING</span></div>
			</div>
		</div>
		</div>

</body>
</html>