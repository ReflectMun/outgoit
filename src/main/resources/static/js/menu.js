document.addEventListener('DOMContentLoaded', function() {


// 별똥별효과
    $(document).ready(function() {
//         const hoverEffect = $('.hj-col');
//         const starsContainer = $('.hj-star-container');
//
//
//         hoverEffect.on('mouseenter', function() {
//             // for (let i = 0; i < 10; i++) {
//             //     const star = $('<div class="star"></div>');
//             //     star.css({
//             //         left: Math.random() * 100 + '%',
//             //         animationDuration: Math.random() * 9 + 1 + 's'
//             //     });
//             //     starsContainer.append(star);
//             // }
//
//         });

        // 시도

            // 이미지 경로 배열


                let starContainer = $('.hj-star-container');
                let imagePaths = [
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s5.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s6.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s7.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s8.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
                    "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png"
                ];
                $('.hj-home').hover(
                    function () {
                        starContainer.empty();
                        $.each(imagePaths, function (index, imagePath) {
                            let img = $('<img>', {
                                src: imagePath,
                                class: 'c1_s' + (index + 1),
                                style: 'top:' + (index * 10) + 'px;left:' + (index * 130) + 'px;'
                            });
                            starContainer.append(img);
                        });

                        starContainer.fadeIn();
                    },
                    function () {
                        // 호버 아웃
                        starContainer.fadeOut();
                    }
                );



        // hoverEffect.on('mouseleave', function() {
        //     starsContainer.empty(); // 마우스를 떼면 별똥별을 모두 지웁니다.
        // });

        let starContainer2 = $('.hj-star-container-2');
        let imagePaths2 = [
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s5.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s6.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s7.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s8.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png"
        ];

        // 이미지 떨어지는 애니메이션 함수


        $('.hj-story').hover(
            function () {
                starContainer2.empty(); // 이미지 초기화

                // 이미지 동적으로 생성하여 .hj-star-container에 추가
                $.each(imagePaths2, function (index, imagePath) {
                    let img = $('<img>', {
                        src: imagePath,
                        class: 'c1_s' + (index + 1),
                        style: 'top:' + (index * 10) + 'px;left:' + (index * 130) + 'px;'
                    });
                    starContainer2.append(img);
                });

                starContainer2.fadeIn();
            },
            function () {
                // 호버 아웃
                starContainer2.fadeOut();
            }
        );

        let starContainer3 = $('.hj-star-container-3');
        let imagePaths3 = [
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s5.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s6.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s7.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s8.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png"
        ];

        // 이미지 떨어지는 애니메이션 함수


        $('.hj-info').hover(
            function () {
                starContainer3.empty(); // 이미지 초기화

                // 이미지 동적으로 생성하여 .hj-star-container에 추가
                $.each(imagePaths3, function (index, imagePath) {
                    let img = $('<img>', {
                        src: imagePath,
                        class: 'c1_s' + (index + 1),
                        style: 'top:' + (index * 10) + 'px;left:' + (index * 130) + 'px;'
                    });
                    starContainer3.append(img);
                });

                starContainer3.fadeIn();
            },
            function () {
                // 호버 아웃
                starContainer3.fadeOut();
            }
        );

        let starContainer4 = $('.hj-star-container-4');
        let imagePaths4 = [
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s5.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s6.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s7.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s8.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s1.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s2.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s3.png",
            "http://img247.etoos.com/web/w247/images/cnt/recruit/early2021/c1_s4.png"
        ];

        // 이미지 떨어지는 애니메이션 함수


        $('.hj-guide').hover(
            function () {
                starContainer4.empty(); // 이미지 초기화

                // 이미지 동적으로 생성하여 .hj-star-container에 추가
                $.each(imagePaths4, function (index, imagePath) {
                    let img = $('<img>', {
                        src: imagePath,
                        class: 'c1_s' + (index + 1),
                        style: 'top:' + (index * 10) + 'px;left:' + (index * 200) + 'px;'
                    });
                    starContainer4.append(img);
                });

                starContainer4.fadeIn();
            },
            function () {
                // 호버 아웃
                starContainer4.fadeOut();
            }
        );



        $(document).ready(function() {

            $('.hj-menu-icon').on('click', function() {
                $('.hj-overlay').fadeToggle(100);
                $('.hj-overlay').css("display", "grid").css("align-content","space-between");
                $('body').css("overflow-x", "hidden").css("overflow-y","hidden");
            });
            $('.hj-menu-icon-2').on('click', function() {
                $('.hj-overlay').fadeToggle(100);
                $('body').css("overflow-y", "auto");
            });
        });

























    });


});