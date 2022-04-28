const userName = document.getElementById("name");
const inputName = document.querySelector(".input-name");
const inputEmail = document.querySelector(".input-email");
const inputPassword = document.querySelector(".input-password");
const inputNickname = document.querySelector(".input-nickname");
const inputDate = document.querySelector(".input-date");
const inputSex = document.querySelector(".input-sex");

let isAuthorized = false;

document.addEventListener("DOMContentLoaded", () => {
    if (localStorage.activeUserIndex == "unknown" || localStorage.activeUserIndex == undefined) {
        alert("Авторизуйтесь!");
    } else {
        isAuthorized = true;
        let users = JSON.parse(localStorage.users);
        userName.innerHTML = users.name[localStorage.activeUserIndex];
        inputName.value = users.name[localStorage.activeUserIndex];
        inputEmail.value = users.email[localStorage.activeUserIndex];
        inputPassword.value = users.password[localStorage.activeUserIndex];
        inputNickname.value = users.nickname[localStorage.activeUserIndex];
        inputDate.value = users.date[localStorage.activeUserIndex];
        inputSex.value = users.sex[localStorage.activeUserIndex];
    }
});

document.querySelector(".btnName").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.name[localStorage.activeUserIndex] = inputName.value;
        localStorage.users = JSON.stringify(users);
        userName.innerHTML = users.name[localStorage.activeUserIndex];
    } else {
        alert("Авторизуйтесь!");
    }
});

document.querySelector(".btnEmail").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.email[localStorage.activeUserIndex] = inputEmail.value;
        localStorage.users = JSON.stringify(users);
    } else {
        alert("Авторизуйтесь!");
    }
});

document.querySelector(".btnPassword").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.password[localStorage.activeUserIndex] = inputPassword.value;
        localStorage.users = JSON.stringify(users);
    } else {
        alert("Авторизуйтесь!");
    }
});

document.querySelector(".btnNickname").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.nickname[localStorage.activeUserIndex] = inputNickname.value;
        localStorage.users = JSON.stringify(users);
    } else {
        alert("Авторизуйтесь!");
    }
});

document.querySelector(".btnDate").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.date[localStorage.activeUserIndex] = inputDate.value;
        localStorage.users = JSON.stringify(users);
    } else {
        alert("Авторизуйтесь!");
    }
});

document.querySelector(".btnSex").addEventListener('click', event => {
    if (isAuthorized) {
        let users = JSON.parse(localStorage.users);
        users.sex[localStorage.activeUserIndex] = inputSex.value;
        localStorage.users = JSON.stringify(users);
    } else {
        alert("Авторизуйтесь!");
    }
});