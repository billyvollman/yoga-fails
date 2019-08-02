var showButton = document.querySelector('.showButton')
var password = document.querySelector('.passwordInput')

console.log("testing")

var changeInput = function() {
    if (showButton.textContent === "show") {
        password.type = "text"
        showButton.textContent = "hide"
        console.log('working') }
    else {
        showButton.textContent = "show"
        password.type = "password"
        console.log('working two') 
    }
}

showButton.addEventListener('click', changeInput)
