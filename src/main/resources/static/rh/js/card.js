$(function () {
    $("#icon1").show();
    $("#icon2").show();
    $("#icon3").show();
    $("#icon4").show();
    $("#icon5").show();
    // $("#camping-icon5").show();
    $("#camping-content5").show();
    $("#icon6").show();
    $("#camping-icon7").show();
    $("#icon7").show();
    $("#icon8").show();
    $("#icon9").show();
    $("#content1").hide();
    $("#content2").hide();
    $("#content3").hide();
    $("#content4").hide();
    $("#content5").hide();
    $("#content6").hide();
    $("#camping-content7").hide();
    $("#content7").hide();
    $("#content8").hide();
    $("#content9").hide();
    $("#best").hide();
    // 캠핑 비기너 사이트 구분
    $("#stoneC").hide();
    $("#deckC").hide();
    $("#grassC").hide();

    //1번
    $("#icon1").click(function () {
        $("#icon1").hide();
        $("#content1").show();
    });
    $("#content1").click(function () {
        $("#content1").hide();
        $("#icon1").show();
    });

    //2번

    $("#icon2").click(function () {
        $("#icon2").hide();
        $("#content2").show();
    });
    $("#content2").click(function () {
        $("#content2").hide();
        $("#icon2").show();
    });

    //3번
    $("#icon3").click(function () {
        $("#icon3").hide();
        $("#content3").show();
    });
    $("#content3").click(function () {
        $("#content3").hide();
        $("#icon3").show();
    });

    //4번
    $("#icon4").click(function () {
        $("#icon4").hide();
        $("#content4").show();
    });
    $("#content4").click(function () {
        $("#content4").hide();
        $("#icon4").show();
    });

    //5번
    $("#icon5").click(function () {
        $("#icon5").hide();
        $("#content5").show();
    });
    $("#content5").click(function () {
        $("#content5").hide();
        $("#icon5").show();
    });

    //캠핑 비기너 5번
    $("#stone").click(function () {
        $("#stoneC, #back").show();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#deck").click(function () {
        $("#deckC").show();
        $("#stone, #grass, #deck").hide();
    });
    $("#grass").click(function () {
        $("#grassC").show();
        $("#stone, #grass, #deck").hide();
    });


    //6번
    $("#icon6").click(function () {
        $("#icon6").hide();
        $("#content6").show();
    });
    $("#content6").click(function () {
        $("#content6").hide();
        $("#icon6").show();
    });

    //캠핑 세이프티 7번
    $("#camping-icon7").click(function () {
        $("#camping-icon7").hide();
        $("#camping-content7").show();
    });
    $("#camping-content7").click(function () {
        $("#camping-content7").hide();
        $("#camping-icon7").show();
    });


    //7번
    $("#icon7").click(function () {
        $("#icon7").hide();
        $("#content7").show();
        $("#animal").css("height", "100%").css("background-image", " url('/resources/static/img/기타/longPaper.png')");
    });
    $("#content7").click(function () {
        $("#content7").hide();
        $("#icon7").show();
        $("#animal").css("height", "23vw").css("background-image", " url('/resources/static/img/기타/paper.png')");
    });

    //8번
    $("#icon8").click(function () {
        $("#icon8").hide();
        $("#content8").show();
        $("#best").show();
    });
    $("#content8").click(function () {
        $("#content8").hide();
        $("#best").hide();
        $("#icon8").show();
    });

    //9번
    $("#icon9").click(function () {
        $("#icon9").hide();
        $("#content9").show();
        $("#animal").css("height", "100%").css("background-image", " url('/resources/static/img/기타/longPaper.png')").css("background-size", "100% 100%");
    });
    $("#content9").click(function () {
        $("#content9").hide();
        $("#icon9").show();
        $("#animal").css("height", "23vw").css("background-image", " url('/resources/static/img/기타/paper.png')").css("background-size", "contain");
    });
});
