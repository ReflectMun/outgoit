document.addEventListener('DOMContentLoaded', function() {
    $(document).ready(function () {
        // $(".hj-content-plus-container").css("display", "none");
        $("#hj-content-detail").on("click", function () {
            // alert(11);

            $("#hj-content-plus-container").addClass("show");
            $("#hj-overlay-popup").addClass("active");

        });

        $("#hj-content-plus-container").on("click", function () {
            // alert(22);
            $("#hj-content-plus-container").removeClass("show");
            $("#hj-overlay-popup").removeClass("active");
        });
    });

    $("#hj-edit-box").click(function () {
        // 현재 .hj-edit-drop의 display 상태를 가져옵니다.
        let currentDisplay = $("#hj-edit-drop").css("display");
        // 현재 display 상태가 "none"이면 "block"으로, "block"이면 "none"으로 토글합니다.
        $("#hj-edit-drop").css("display", currentDisplay === "none" ? "block" : "none");
    });
});