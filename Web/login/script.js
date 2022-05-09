const inputEmail = document.querySelector(".footer__text-email");
const inputPassword = document.querySelector(".footer__text-password");
const button = document.querySelector(".footer__text-bottom");

button.addEventListener("click", event => {
    if (localStorage.users == undefined) {
        alert("Пройдите регистрацию!");
    } 
    else {
        let users = JSON.parse(localStorage.users);
        let length = users.name.length;
        if (length == 0) {
            alert("Пройдите регистрацию!");
        }
        else {
            for (let i = 0; i < length; i++) {
                if (users.email[i] == inputEmail.value && users.password[i] == inputPassword.value) {
                    localStorage.activeUserIndex = i;
                    window.location.replace('../main/index.html');
                    break;
                }
            }
            if (localStorage.activeUserIndex == "unknown") {
                alert("Вы ввели неверные данные или не заполнили все поля!");
            }
            else {
                if (users.email[localStorage.activeUserIndex] != inputEmail.value ||
                    users.password[localStorage.activeUserIndex] != inputPassword.value) {
                        alert("Вы ввели неверные данные или не заполнили все поля!");
                }
            }
        }
    }
});