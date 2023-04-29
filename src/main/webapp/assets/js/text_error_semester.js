const errorMessage = document.querySelectorAll(".tb-loi-nhap")
const closeButton = document.getElementById("dong-form-btn")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})

function validateForm() {
    var maHkInput = document.getElementById("ma-hk")
    var maHkError = document.getElementById("ma-hk-error")
    var tenHkInput = document.getElementById("ten-hk")
    var tenHkError = document.getElementById("ten-hk-error")
    if (maHkInput.value == "") {
        maHkError.style.display = "block";
    } else {
        maHkError.style.display = "none";
    }

    if (tenHkInput.value == "") {
        tenHkError.style.display = "block";
    } else {
        tenHkError.style.display = "none";
    }
    maHkInput.addEventListener("input", function() {
        maHkError.style.display = "none"
    })

    tenHkInput.addEventListener("input", function() {
        tenHkError.style.display = "none"
    })
}




