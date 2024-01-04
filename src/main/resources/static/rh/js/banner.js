$(function () {
    var height = $(".mh-weather-container").height();
    var num = $(".mh-weather-text li").length;
    var max = height * num;
    var move = 0;

    function noticeRolling() {
        move += height;
        $(".mh-weather-text").animate({"top": -move}, 600, function () {
            if (move >= max) {
                $(this).css("top", 0);
                move = 0;
            }
            ;
        });
    };
    noticeRollingOff = setInterval(noticeRolling, 3000);
    $(".mh-weather-text").append($(".rolling li").first().clone());
    $(".mh-weather-text").hover(
        function () {
            clearInterval(noticeRollingOff); // 마우스 오버 시 롤링 멈춤
        },
        function () {
            noticeRollingOff = setInterval(noticeRolling, 3000); // 마우스 아웃 시 롤링 재시작
        }
    );

});

