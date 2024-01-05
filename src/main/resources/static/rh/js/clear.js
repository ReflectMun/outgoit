const nicknameInput = document.getElementById('hj-id-input');
const starsValue = document.getElementsByClassName("hj-star");
commentSubmitButton.addEventListener('click', (e) =>{
    for (const star of starsValue){
        star.innerHTML = "☆";
    }
    const reqUrl ="/nickname/show"
    const {data: resData} = axios.get(reqUrl)
    console.log(resData)
})
