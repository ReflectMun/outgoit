$(function () {
    $("#content1, #content2, #content3, #content4, #content5, #content6, #camping-content7, #content7, #content8, #ridingcontent8, #content9").hide();
    $("#autoCampC, #glampingC, #backCampC").hide();
    $("#stoneC, #deckC, #grassC").hide();
    $("#beeC, #snakeC, #pigC, #dogC").hide();
    $("#mtbC, #rbC, #hbC").hide();
    $("#back1, #back2, #back3, #back4, #back5, #back6, #back7, #back8, #back9").hide();

    //1번
    $("#icon1").click(function () {
        $("#icon1").hide();
        $("#content1, #back1").fadeToggle();
    });
    $("#back1").click(function () {
        $("#icon1").fadeToggle();
        $("#content1, #back1").hide();
    });

    //2번
    $("#icon2").click(function () {
        $("#icon2").hide();
        $("#content2, #back2").fadeToggle();
    });
    $("#bacAk2").click(function () {
        $("#icon2").fadeToggle();
        $("#content2, #back2").hide();
    });


    // 하이킹 세이프티 2번
    $("#bee").click(function () {
        $("#hikingSafety2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#bee, #snake, #pig, #dog, #line").hide();
        $("#beeC, #back2").fadeToggle();
    });
    $("#snake").click(function () {
        $("#hikingSafety2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#bee, #snake, #pig, #dog, #line").hide();
        $("#snakeC, #back2").fadeToggle();
    });
    $("#pig").click(function () {
        $("#hikingSafety2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#bee, #snake, #pig, #dog, #line").hide();
        $("#pigC, #back2").fadeToggle();
    });
    $("#dog").click(function () {
        $("#hikingSafety2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#bee, #snake, #pig, #dog, #line").hide();
        $("#dogC, #back2").fadeToggle();
    });
    $("#back2").click(function () {
        $("#hikingSafety2Pin").removeClass('rh-redPin-textView').addClass('rh-redPin-height');
        $("#beeC, #snakeC, #pigC, #dogC, #back2").hide();
        $("#bee, #snake, #pig, #dog, #line").fadeToggle();
    });



    // 라이딩 비기너 2번
    $("#mtb").click(function () {
        $("#ridingBeginner2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#mtbC, #back2").fadeToggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#rb").click(function () {
        $("#ridingBeginner2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#rbC, #back2").fadeToggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#hb").click(function () {
        $("#ridingBeginner2Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#hbC, #back2").fadeToggle();
        $("#mtb, #rb, #hb, #line").hide();
    });
    $("#back2").click(function (){
        $("#ridingBeginner2Pin").removeClass('rh-redPin-textView').addClass('rh-redPin-height');
        $("#mtb, #rb, #hb, #line").show();
        $("#mtbC, #rbC, #hbC, #back2").hide();
    });



    //3번
    $("#icon3").click(function () {
        $("#icon3").hide();
        $("#content3, #back3").fadeToggle();
    });
    $("#back3").click(function () {
        $("#content3, #back3").hide();
        $("#icon3").fadeToggle();
    });

    //4번
    $("#icon4").click(function () {
        $("#icon4").hide();
        $("#content4, #back4").fadeToggle();
    });
    $("#back4").click(function () {
        $("#content4, #back4").hide();
        $("#icon4").fadeToggle();
    });

    // 캠핑 비기너 4번
    $("#autoCamp").click(function (){
        $("#beginner4Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
       $("#autoCamp, #backCamp, #glamping, #line2").hide();
       $("#autoCampC, #back4").fadeToggle();
    });
    $("#backCamp").click(function (){
        $("#beginner4Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#autoCamp, #backCamp, #glamping, #line2").hide();
        $("#backCampC, #back4").fadeToggle();
    });
    $("#glamping").click(function (){
        $("#beginner4Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#autoCamp, #backCamp, #glamping, #line2").hide();
        $("#glampingC, #back4").fadeToggle();
    });
    $("#back4").click(function (){
        $("#beginner4Pin").removeClass('rh-redPin-textView').addClass('rh-redPin-height');
        $("#autoCampC, #backCampC, #glampingC, #back4").hide();
        $("#autoCamp, #backCamp, #glamping, #line2").fadeToggle();
    });


    //5번
    $("#icon5").click(function () {
        $("#icon5").hide();
        $("#content5, #back5").fadeToggle();
    });
    $("#back5").click(function () {
        $("#content5, #back5").hide();
        $("#icon5").fadeToggle();
    });

    //캠핑 비기너 5번
    $("#stone").click(function () {
        $("#beginner5Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#stoneC, #back5").fadeToggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#deck").click(function () {
        $("#beginner5Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#deckC, #back5").fadeToggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#grass").click(function () {
        $("#beginner5Pin").removeClass('rh-redPin-height').addClass('rh-redPin-textView');
        $("#grassC, #back5").fadeToggle();
        $("#stone, #grass, #deck, #line").hide();
    });
    $("#back5").click(function (){
        $("#beginner5Pin").removeClass('rh-redPin-textView').addClass('rh-redPin-height');
        $("#stone, #grass, #deck, #line").fadeToggle();
        $("#stoneC, #grassC, #deckC, #back").hide();
    });


    //6번
    $("#icon6").click(function () {
        $("#icon6").hide();
        $("#content6, #back6").fadeToggle();
    });
    $("#back6").click(function () {
        $("#content6, #back6").hide();
        $("#icon6").fadeToggle();
    });

    //캠핑 세이프티 7번
    $("#camping-icon7").click(function () {
        $("#camping-icon7").hide();
        $("#camping-content7, #back7").fadeToggle();
    });
    $("#back7").click(function () {
        $("#camping-content7, #back7").hide();
        $("#camping-icon7").fadeToggle();
    });


    //7번
    $("#icon7").click(function () {
        $("#icon7").hide();
        $("#content7, #back7").fadeToggle();
        if (window.innerWidth === 430 && window.innerHeight === 932) {
            $("#riding14Size").css("height", "46vw");
        } else {
            $("#riding14Size").css("height", "20vw");
        }
    });
    $("#back7").click(function () {
        $("#content7, #back7").hide();
        $("#icon7").fadeToggle();
        if (window.innerWidth === 430 && window.innerHeight === 932) {
            $("#riding14Size").css("height", "40vw");
        } else {
            $("#riding14Size").css("height", "20vw");
        }

    });

    //비기너 베스트 8번
    $("#best").css("position","relative").css("left","-25.3vw").css("z-index","0").css("visibility","hidden").css("height", "0");
    $("#icon8").click(function () {
        $("#icon8").hide();
        $("#content8, #back8").fadeToggle();
        $("#best").css("visibility","visible").css("left","0").css("height","100%").css("transition","0.5s ease-in-out");
    });
    $("#back8").click(function () {
        $("#best").css("left","-25.3vw").css("visibility","hidden").css("height","0");
        $("#content8, #back8").hide();
        $("#icon8").fadeToggle();
    });

    // 동물 신고 9번
    $("#icon9").click(function () {
        $("#icon9").hide();
        $("#content9, #back9").fadeToggle();
        $("#animal").css("height", "100%").css("background-image", " url('/resources/static/img/기타/양피지.png')").css("background-size", "100% 100%");
    });
    $("#back9").click(function () {
        $("#content9, #back9").hide();
        $("#icon9").fadeToggle();
        if (window.innerWidth === 430 && window.innerHeight === 932) {
            $("#animal").css("height", "40vw").css("background-image", "url('/resources/static/img/기타/양피지.png')");
        } else {
            $("#animal").css("height", "20vw").css("background-image", "url('/resources/static/img/기타/양피지.png')");
        }
    });

    if (window.innerWidth === 430 && window.innerHeight === 932) {
        $("#campingTitleText").css("font-size", "6vw");
    } else {
        $("#campingTitleText").css("font-size", "2.4vw");
    }


});

