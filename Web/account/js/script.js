const userName = document.getElementById("name");

userName.innerHTML = localStorage.getItem("userName");

const inputName = document.querySelector(".input-name");
const inputEmail = document.querySelector(".input-email");
const inputPassword = document.querySelector(".input-password");
const inputNickname = document.querySelector(".input-nickname");
const inputDate = document.querySelector(".input-date");
const inputSex = document.querySelector(".input-sex");

document.addEventListener("DOMContentLoaded", () => {
    inputName.value = localStorage.getItem("userName");
    inputEmail.value = localStorage.getItem("userEmail");
    inputPassword.value = localStorage.getItem("userPassword");
    inputNickname.value = localStorage.getItem("userNickname");
    inputDate.value = localStorage.getItem("userDate");
    inputSex.value = localStorage.getItem("userSex");
});

document.querySelector(".btnName").addEventListener('click', event => {
    if (localStorage.userName == undefined) {
        localStorage.setItem("userName", inputName.value)
    } else {
        localStorage.userName = inputName.value;
    }
    userName.innerHTML = localStorage.getItem("userName");
});

document.querySelector(".btnEmail").addEventListener('click', event => {
    if (localStorage.userEmail == undefined) {
        localStorage.setItem("userEmail", inputEmail.value)
    } else {
        localStorage.userEmail = inputEmail.value;
    }
});

document.querySelector(".btnPassword").addEventListener('click', event => {
    if (localStorage.userPassword == undefined) {
        localStorage.setItem("userPassword", inputPassword.value)
    } else {
        localStorage.userPassword = inputPassword.value;
    }
});

document.querySelector(".btnNickname").addEventListener('click', event => {
    if (localStorage.userNickname == undefined) {
        localStorage.setItem("userNickname", inputNickname.value)
    } else {
        localStorage.userNickname = inputNickname.value;
    }
});

document.querySelector(".btnDate").addEventListener('click', event => {
    if (localStorage.userDate == undefined) {
        localStorage.setItem("userDate", inputDate.value)
    } else {
        localStorage.userDate = inputDate.value;
    }
});

document.querySelector(".btnSex").addEventListener('click', event => {
    if (localStorage.userSex == undefined) {
        localStorage.setItem("userSex", inputSex.value)
    } else {
        localStorage.userSex = inputSex.value;
    }
});