document.addEventListener('DOMContentLoaded', function() {


// 별똥별효과
    $(document).ready(function() {
        const hoverEffect = $('.hj-col');
        const starsContainer = $('.hj-star-container');


        hoverEffect.on('mouseenter', function() {
            for (let i = 0; i < 10; i++) {
                const star = $('<div class="star"></div>');
                star.css({
                    left: Math.random() * 100 + '%',
                    animationDuration: Math.random() * 2 + 1 + 's'
                });
                starsContainer.append(star);
            }
        });

        hoverEffect.on('mouseleave', function() {
            starsContainer.empty(); // 마우스를 떼면 별똥별을 모두 지웁니다.
        });

        const hoverEffect2 = $('.hj-col-2');
        const starsContainer2 = $('.hj-star-container-2');


        hoverEffect2.on('mouseenter', function() {
            for (let i = 0; i < 10; i++) {
                const star2 = $('<div class="star2"></div>');
                star2.css({
                    left: Math.random() * 100 + '%',
                    animationDuration: Math.random() * 2 + 1 + 's'
                });
                starsContainer2.append(star2);
            }
        });

        hoverEffect2.on('mouseleave', function() {
            starsContainer2.empty(); // 마우스를 떼면 별똥별을 모두 지웁니다.
        });

        const hoverEffect3 = $('.hj-col-3');
        const starsContainer3 = $('.hj-star-container-3');


        hoverEffect3.on('mouseenter', function() {
            for (let i = 0; i < 10; i++) {
                const star3 = $('<div class="star3"></div>');
                star3.css({
                    left: Math.random() * 100 + '%',
                    animationDuration: Math.random() * 2 + 1 + 's'
                });
                starsContainer3.append(star3);
            }
        });

        hoverEffect3.on('mouseleave', function() {
            starsContainer3.empty(); // 마우스를 떼면 별똥별을 모두 지웁니다.
        });

        const hoverEffect4 = $('.hj-col-4');
        const starsContainer4 = $('.hj-star-container-4');


        hoverEffect4.on('mouseenter', function() {
            for (let i = 0; i < 10; i++) {
                const star4 = $('<div class="star4"></div>');
                star4.css({
                    left: Math.random() * 100 + '%',
                    animationDuration: Math.random() * 2 + 1 + 's'
                });
                starsContainer4.append(star4);
            }
        });

        hoverEffect4.on('mouseleave', function() {
            starsContainer4.empty(); // 마우스를 떼면 별똥별을 모두 지웁니다.
        });



    // 메뉴 누르면 가운데서 퍼지는 효과
        $(document).ready(function() {
            $('.hj-menu-icon').on('click', function() {
                $('.hj-overlay').fadeToggle(100); // 500은 애니메이션 지속 시간(ms)입니다. 필요에 따라 조절 가능
            });
            $('.hj-menu-icon-2').on('click', function() {
                $('.hj-overlay').fadeToggle(100); // 500은 애니메이션 지속 시간(ms)입니다. 필요에 따라 조절 가능
            });
        });
























    });


});