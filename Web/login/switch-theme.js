document.addEventListener("DOMContentLoaded", () => {
    const savedTheme = localStorage.getItem("theme");

    document.body.setAttribute("data-theme", savedTheme);

    for (const radioButton of document.querySelectorAll("input[name='change-theme-button']")) {
        radioButton.checked = savedTheme === radioButton.value;
        radioButton.addEventListener("change", switchTheme);
    }
});

function switchTheme() {
    if (this.checked) {
        localStorage.setItem("theme", this.value);
        document.body.setAttribute("data-theme", this.value);
    }
}