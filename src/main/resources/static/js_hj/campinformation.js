document.addEventListener('DOMContentLoaded', function() {
    //검색 클릭시 campinformation 뜨게
    let serch = document.getElementById('submit-search');
    let detailpopup = document.getElementById('hj-container2');
    let closedetailpopup = document.getElementById('hj-close-btn');

    function campinfoup(){
        // alert(11)
        detailpopup.style.display='block';
    }
    function campinfodown(){
        // alert(22)
        detailpopup.style.display='none';
    }
    serch.addEventListener('click',campinfoup);
    closedetailpopup.addEventListener('click',campinfodown);

        //js
    //팝업 열리기
        let contentdetail = document.getElementById("hj-content-detail");
        let pluscontainer = document.getElementById("hj-content-plus-container");
        let popupoverlay = document.getElementById("hj-overlay-popup");
                function popup(){
                    // alert(11);
                    pluscontainer.classList.add('show');
                    popupoverlay.classList.add('active');
                }
    contentdetail.addEventListener('click', popup);
                //닫는 js
                function closepopup(){
                    pluscontainer.classList.remove('show');
                    popupoverlay.classList.remove('active');
                }
                pluscontainer.addEventListener('click',closepopup);

    //js
    let editbox = document.getElementById('hj-edit-box');
    let editdrop = document.getElementById('hj-edit-drop');

// 요소가 존재하는 경우에만 이벤트 리스너 등록
    if (editbox && editdrop) {
        editbox.addEventListener("click", dropeditbox);
    }




            function dropeditbox() {
                // 클릭할 때마다 현재 display 상태를 다시 가져옴
                let currentDisplay = window.getComputedStyle(editdrop).getPropertyValue('display');

                if (currentDisplay === 'none') {
                    editdrop.style.display = 'block';
                } else {
                    editdrop.style.display = 'none';
                }
            }

//     별점 채우기 값 보내기
            let stars = document.querySelectorAll('.hj-star');

            // 각 별에 이벤트 리스너를 등록합니다.
            stars.forEach(function (star) {
                star.addEventListener('click', function () {
                    handleStarClick(this);
                });
            });


            function handleStarClick(clickedStar) {
                // 클릭된 별의 data-value 속성 값을 가져옵니다.
                let clickedValue = clickedStar.getAttribute('data-value');
                console.log(clickedValue);
                // 클릭된 별까지 노란색으로 채우기
                stars.forEach(function (star) {
                    let starValue = star.getAttribute('data-value');

                    if (starValue <= clickedValue) {
                        star.classList.add('checked');
                    } else {
                        star.classList.remove('checked');
                    }
                });
            }


        });

        let pageNum = 1

        function getPrevCommentPage() {
            const reqUrl = "/api/review/trail/list"
        }

        function getNextCommentPage() {

        }

        function deleteComment(commentNumber) {
        }


        function modifyComment(commentNumber) {
        }
