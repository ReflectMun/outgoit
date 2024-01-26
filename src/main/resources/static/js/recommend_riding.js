
// 자전거 초보자 가이드 추천 코스로 이동하는 기능
const recommendedRidings = document.getElementsByClassName("recommended-cycle-for-beginner");
for (const riding of recommendedRidings){
    riding.addEventListener("click", (e) =>{
        const ridingNum = riding.getAttribute("data-value");
        console.log(ridingNum)

        const detailReqUrl = "/riding";

        const hiddenForm = document.createElement("form");

        hiddenForm.style.display = "none";
        hiddenForm.method = "get";
        hiddenForm.action = detailReqUrl;

        // Form에다 데이터를 담는 과정
        // <input name="prop" value="value"> 라는 눈에 안보이는 엘리먼트를 생성해서 form 내부에 집어넣는 과정
        let tempInput;
            tempInput = document.createElement("input");
            tempInput.name = "recommend";
            tempInput.value = ridingNum;
            console.log(tempInput.value)
            hiddenForm.appendChild(tempInput);

        // body 태그의 자식 엘리먼트에 hiddenForm을 추가해줘야 히든폼의 submit이 동작함
        document.body.appendChild(hiddenForm);
        hiddenForm.submit();
    })
}