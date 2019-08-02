var showButton = document.querySelector('.showButton')
var password = document.querySelector('.passwordInput')

var changeInput = function() {
    if (showButton.textContent === "show") {
        password.type = "text"
        showButton.textContent = "hide"
        }
    else {
        showButton.textContent = "show"
        password.type = "password"
    }
}

if (showButton) {
    showButton.addEventListener('click', changeInput)
}

