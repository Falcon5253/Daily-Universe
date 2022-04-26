const inputEmail = document.querySelector(".footer__text-email");
const inputPassword = document.querySelector(".footer__text-password");
const button = document.querySelector(".footer__text-bottom");

button.addEventListener('click', event => {
    if (localStorage.userName == undefined || localStorage.userPassword == undefined) {
        alert("Ошибка! Пройдите регистрацию!");
    } else {
        if (inputEmail.value == localStorage.userEmail && inputPassword.value == localStorage.userPassword) {
            alert("Вы успешно вошли!");
        } else {
            alert("Вы ввели неверные данные или не заполнили все поля!");
        }
    }
});