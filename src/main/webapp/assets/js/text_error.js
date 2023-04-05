
const errorMessage = document.querySelectorAll(".error-message")
const closeButton = document.getElementById("close-btn")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})

function validateForm() {
    var maInput = document.getElementById("ma")
    var maError = document.getElementById("ma-error")
    var tenInput = document.getElementById("ten")
    var tenError = document.getElementById("ten-error")
    var emailInput = document.getElementById("email")
    var emailError = document.getElementById("email-error")
    var gioiTinhInput = document.getElementById("gioi-tinh")
    var gioiTinhError = document.getElementById("gioi-tinh-error")
    var sdtInput = document.getElementById("sdt")
    var sdtError = document.getElementById("sdt-error")
    var khoaInput = document.getElementById("ma-khoa")
    var khoaError = document.getElementById("ma-khoa-error")
// list SV co them
    var dobInput = document.getElementById("dob")
    var dobError = document.getElementById("dob-error")

    if (maInput.value == "") {
        maError.style.display = "block";
    } else {
        maError.style.display = "none";
    }

    if (tenInput.value == "") {
        tenError.style.display = "block";
    } else {
        tenError.style.display = "none";
    }

    if (emailInput.value == "") {
        emailError.style.display = "block";
    } else {
        emailError.style.display = "none";
    }

    if (gioiTinhInput.value == "") {
        gioiTinhError.style.display = "block";
    } else {
        gioiTinhError.style.display = "none";
    }

    if (sdtInput.value == "") {
        sdtError.style.display = "block";
    } else {
        sdtError.style.display = "none";
    }
    if (khoaInput.value == "") {
        khoaError.style.display = "block";

    } else {
        khoaError.style.display = "none";
    }

// listSV co them'
    if (dobInput.value == "") {
        dobError.style.display = "block";
    } else {
        dobError.style.display = "none";
    }




    maInput.addEventListener("input", function() {
        maError.style.display = "none"
    })

    tenInput.addEventListener("input", function() {
        tenError.style.display = "none"
    })


    emailInput.addEventListener("input", function() {
        emailError.style.display = "none"
    })

    sdtInput.addEventListener("input", function() {
        sdtError.style.display = "none"
    })

    gioiTinhInput.addEventListener("input", function() {
        gioiTinhError.style.display = "none"
    })

    khoaInput.addEventListener("input", function() {
        khoaError.style.display = "none"
    })


    dobInput.addEventListener("input", function() {
        dobError.style.display = "none"
    })

}




