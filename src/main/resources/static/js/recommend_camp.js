const recommendedCamps = document.getElementsByClassName(
    "recommended-camp-for-beginner"
);
for (const camp of recommendedCamps) {
    camp.addEventListener("click", async (e) => {
        // data-value 어트리뷰트에 설정해놓은 데이터 값을 가져오는 코드
        const campingAreaName = camp.getAttribute("data-value");
        console.log(camp)

        try {
            const campingApiUrl = "/api/camping/search/" + campingAreaName;

            // axios 요청을 하면 결과값이 객체로 반환되는데 우리가 원하는 데이터는 data라는 프로퍼티 안에 담겨있음
            // 해당 객체에서 data 라는 프로퍼티만 빼내고 싶을 때 사용하는 방법임
            const { data } = await axios.get(campingApiUrl);
            // 해당 API는 리스트 형태로 결과를 반환하기 때문에 0번째 값을 가져오도록 했음
            campingAreaData = data[0];

            const detailReqUrl = "/camping/detail/" + campingAreaName;

            // 히든폼을 생성해서 submit 하는 방식으로 가는게 난이도가 더 쉬워서 이렇게 했음
            const hiddenForm = document.createElement("form");

            hiddenForm.style.display = "none";
            hiddenForm.method = "post";
            hiddenForm.action = detailReqUrl;

            // Form에다 데이터를 담는 과정
            // <input name="prop" value="value"> 라는 눈에 안보이는 엘리먼트를 수없이 생성해서 form 내부에 집어넣는 과정
            let tempInput;
            for (const prop in campingAreaData) {
                tempInput = document.createElement("input");
                tempInput.name = prop;
                tempInput.value = campingAreaData[prop];

                hiddenForm.appendChild(tempInput);
            }
            const { data: token } = await axios.get("/csrf/token")
            const csrfToken = token['token']

            const csrfInput = document.createElement("input")
            csrfInput.type = "hidden"
            csrfInput.name = "_csrf"
            csrfInput.value = csrfToken
            hiddenForm.appendChild(csrfInput)

            // body 태그의 자식 엘리먼트에 hiddenForm을 추가해줘야 히든폼의 submit이 동작함
            document.body.appendChild(hiddenForm);
            hiddenForm.submit();
        } catch (e) {
            console.log(e);
            alert("오류가 발생했습니다");
        }
    });
}
