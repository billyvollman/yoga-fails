var showButton = document.querySelector('.showButton')
var password = document.querySelector('.passwordInput')
var commentSection = document.querySelector('.comment')
var editButton = document.querySelectorAll('.editButton')
var commentInput = document.querySelector('.commentInput')
var updateButton = document.querySelector('.updateButton')
var deleteButton = document.querySelector('.deleteButton')
var body = document.querySelector('body')


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

var showInput = function(evet){
    var editBtn = event.target
    var comment = editBtn.previousElementSibling
    var delete_comments = editBtn.nextElementSibling
    var update_comments = delete_comments.nextElementSibling
    var commentInput = update_comments.querySelector('.commentInput')
    var updateButton = update_comments.querySelector('.updateButton')
    editBtn.style.display = "none"
    comment.style.display = "none"
    delete_comments.style.display = "none"
    commentInput.type = "text"
    updateButton.classList.remove("hide")
}


editButton.forEach(function(button) {
    button.addEventListener('click', showInput)
})

// var updateComment = function(event) {
//     event.preventDefault()
// }

// updateButton.addEventListener('click', updateComment)