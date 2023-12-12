document.addEventListener('DOMContentLoaded', function() {


// jquery 실험
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




























    });


});