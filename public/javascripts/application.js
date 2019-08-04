var showButton = document.querySelector('.showButton')
var password = document.querySelector('.passwordInput')
var commentSection = document.querySelector('.comment')
var editButton = document.querySelector('.editButton')
var commentInput = document.querySelector('.commentInput')
var updateButton = document.querySelector('.updateButton')
var deleteButton = document.querySelector('.deleteButton')


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

var showInput = function(event) {
    console.log("test")
        deleteButton.classList.add("hide")
        commentSection.hidden = true
        commentInput.type = "text"
        updateButton.classList.remove("hide")
    
}


if (editButton) {
    editButton.addEventListener('click', showInput)
}

// editButtons.forEach(function(button) {
//     button.addEventListener('click', showInput)
// })

