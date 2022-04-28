const MAX_USERS = 5;

const inputEmail = document.querySelector(".footer__text-email");
const inputPassword = document.querySelector(".footer__text-password");
const inputNickname = document.querySelector(".footer__text-nickname");
const inputName = document.querySelector(".footer__text-name");
const inputDate = document.querySelector(".footer__text-date");
const inputSex = document.querySelector(".footer__text-sex");
const button = document.querySelector(".footer__text-bottom");

// delete localStorage.users;
// delete localStorage.activeUserIndex;

function expandObject(object) {
    for (let [key, value] of Object.entries(object)) {
        value.length += 1;
    }
}

if (localStorage.users == undefined) {
    let users = {
        name: [],
        email: [],
        password: [],
        nickname: [],
        sex: [],
        date: []
    };
    localStorage.setItem("users", JSON.stringify(users));
    localStorage.setItem("activeUserIndex", "unknown");
}

button.addEventListener("click", event => {
    let users = JSON.parse(localStorage.users);
    let length = users.name.length;
    if (length == 0) {
        expandObject(users);
    }
    if (length < MAX_USERS) {
        length = users.name.length;
        if (users.name[length-1] != null) {
            expandObject(users);
        }
        if (inputName.value == "" || inputDate.value == "" || 
            inputEmail.value == "" || inputSex.value == "" || 
            inputPassword.value == "" || inputNickname.value == "") {
            alert("Empty field!");
        } else {
            length = users.name.length;
            users.name[length-1] = inputName.value;
            users.email[length-1] = inputEmail.value;
            users.password[length-1] = inputPassword.value;
            users.nickname[length-1] = inputNickname.value;
            users.sex[length-1] = inputSex.value;
            users.date[length-1] = inputDate.value;
            localStorage.users = JSON.stringify(users);
            alert("Вы успешно зарегистрировались!");
            inputName.value = "";
            inputDate.value = "";
            inputEmail.value = "";
            inputPassword.value = "";
            inputSex.value = "";
            inputNickname.value = "";
        }
    } else {
        alert("Error! Users limit = 5.");
    }
});