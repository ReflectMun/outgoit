$(function () {
    $("#icon1, #icon2, #riding-content2, #icon3, #icon4, #icon5, #camping-content5, #icon6, #camping-icon7, #icon7, #icon8, #icon9").show();
    $("#content1, #content2, #content3, #content4, #content5, #content6, #camping-content7, #content7, #content8, #content9").hide();
    $("#best").hide();
    $("#autoCampC, #glampingC, #backCampC").hide();
    $("#stoneC, #deckC, #grassC").hide();
    $("#mtbC, #rbC, #hbC").hide();
    $("#back1, #back2, #back3, #back4, #back5, #back6, #back7, #back8, #back9").hide();

    //1번
    $("#icon1").click(function () {
        $("#icon1").hide();
        $("#content1, #back1").toggle();
    });
    $("#back1").click(function () {
     $("#content1, #back1").hide();
    $("#icon1").show();
    });

    //2번
    $("#icon2").click(function () {
        $("#icon2").hide();
        $("#content2, #back2").toggle();
    });
    $("#back2").click(function () {
        $("#content2, #back2").hide();
        $("#icon2").show();
    });

    // 라이딩 2번
    $("#mtb").click(function () {
        $("#mtbC, #back2").toggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#rb").click(function () {
        $("#rbC, #back2").toggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#hb").click(function () {
        $("#hbC, #back2").toggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#back2").click(function (){
        $("#mtb, #rb, #hb, #line").show();
        $("#mtbC, #rbC, #hbC, #back2").hide();
    });



    //3번
    $("#icon3").click(function () {
        $("#icon3").hide();
        $("#content3, #back3").toggle();
    });
    $("#back3").click(function () {
        $("#content3, #back3").hide();
        $("#icon3").show();
    });

    //4번
    $("#icon4").click(function () {
        $("#icon4").hide();
        $("#content4, #back4").toggle();
    });
    $("#back4").click(function () {
        $("#content4, #back4").hide();
        $("#icon4").show();
    });

    // 캠핑 비기너 4번
    $("#autoCamp").click(function (){
       $("#autoCamp, #backCamp, #glamping, #line2").hide();
       $("#autoCampC, #back4").toggle();
    });
    $("#backCamp").click(function (){
        $("#autoCamp, #backCamp, #glamping, #line2").hide();
        $("#backCampC, #back4").toggle();
    });
    $("#glamping").click(function (){
        $("#autoCamp, #backCamp, #glamping, #line2").hide();
        $("#glampingC, #back4").toggle();
    });
    $("#back4").click(function (){
        $("#autoCampC, #backCampC, #glampingC, #back4").hide();
        $("#autoCamp, #backCamp, #glamping, #line2").show();
    });




    //5번
    $("#icon5").click(function () {
        $("#icon5").hide();
        $("#content5, #back5").toggle();
    });
    $("#back5").click(function () {
        $("#content5, #back5").hide();
        $("#icon5").show();
    });

    //캠핑 비기너 5번
    $("#stone").click(function () {
        // $("#stoneC").show();
        $("#stoneC, #back5").toggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#deck").click(function () {
        // $("#stoneC").show();
        $("#deckC, #back5").toggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#grass").click(function () {
        // $("#stoneC").show();
        $("#grassC, #back5").toggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#back5").click(function (){
        $("#stone, #grass, #deck, #line").show();
        $("#stoneC, #grassC, #deckC, #back").hide();
    });


    //6번
    $("#icon6").click(function () {
        $("#icon6").hide();
        $("#content6, #back6").toggle();
    });
    $("#back6").click(function () {
        $("#content6, #back6").hide();
        $("#icon6").show();
    });

    //캠핑 세이프티 7번
    $("#camping-icon7").click(function () {
        $("#camping-icon7").hide();
        $("#camping-content7, #back7").toggle();
    });
    $("#back7").click(function () {
        $("#camping-content7, #back7").hide();
        $("#camping-icon7").show();
    });


    //7번
    $("#icon7").click(function () {
        $("#icon7").hide();
        $("#content7, #back7").toggle();
    });
    $("#back7").click(function () {
        $("#content7, #back7").hide();
        $("#icon7").show();
    });

    //8번
    $("#icon8").click(function () {
        $("#icon8").hide();
        $("#content8, #best, #back8").toggle();
        $("#best").css("height","100%").css("background-image", " url('/resources/static/img/기타/noPin.png')").css("background-size", "100% 100%");
    });
    $("#back8").click(function () {
        $("#content8, #best, #back8").hide();
        $("#icon8").show();
    });

    //9번
    $("#icon9").click(function () {
        $("#icon9").hide();
        $("#content9, #back9").toggle();
        $("#animal").css("height", "100%").css("background-image", " url('/resources/static/img/기타/longPaper.png')").css("background-size", "100% 100%");
    });
    $("#back9").click(function () {
        $("#content9, #back9").hide();
        $("#icon9").show();
        $("#animal").css("height", "23vw").css("background-image", " url('/resources/static/img/기타/paper.png')").css("background-size", "contain");
    });


});

