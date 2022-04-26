const inputEmail = document.querySelector(".footer__text-email");
const inputPassword = document.querySelector(".footer__text-password");
const inputNickname = document.querySelector(".footer__text-nickname");
const inputName = document.querySelector(".footer__text-name");
const inputDate = document.querySelector(".footer__text-date");
const inputSex = document.querySelector(".footer__text-sex");
const button = document.querySelector(".footer__text-bottom");

button.addEventListener('click', event => {
    defineLocalField("userEmail");
    defineLocalField("userPassword");
    defineLocalField("userNickname");
    defineLocalField("userName");
    defineLocalField("userDate");
    defineLocalField("userSex");
    
    if (inputEmail.value && inputPassword.value && inputNickname.value && 
        inputName.value && inputDate.value && inputSex.value) {
            localStorage.userEmail = inputEmail.value;
            localStorage.userPassword = inputPassword.value;
            localStorage.userNickname = inputNickname.value;
            localStorage.userName = inputName.value;
            localStorage.userDate = inputDate.value;
            localStorage.userSex = inputSex.value;
            alert("Регистрация прошла успешно!");
    } else {
        alert("Ошибка! Есть пустые поля!");
    }
});

function defineLocalField(id) {
    if (localStorage.getItem(id) == null) {
        localStorage.setItem(id, "unknown");
        return 0;
    }
    return 1;
};