const title = document.querySelector('.title');

function startAnimation() {
    title.classList.remove('bounce'); // 애니메이션 클래스 제거
    void title.offsetWidth; // 리플로우 트리거(애니메이션 클래스가 제거된 후 다시 추가되면 애니메이션이 재시작됨)
    title.classList.add('bounce'); // 애니메이션 클래스 추가
}

setInterval(startAnimation, 5000); // 5초마다 애니메이션 시작 함수 호출
