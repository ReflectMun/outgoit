document.addEventListener('DOMContentLoaded', function() {
    $(document).ready(function () {
        // $(".hj-content-plus-container").css("display", "none");

        $(".hj-content-detail").on("click", function () {
            // alert(11);

            $(".hj-content-plus-container").addClass("show");
        });

        $(".hj-content-plus-container").on("click", function () {
            // alert(22);
            $(".hj-content-plus-container").removeClass("show");
        });
    });








});