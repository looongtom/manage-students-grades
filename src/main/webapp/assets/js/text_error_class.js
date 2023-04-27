
const errorMessage = document.querySelectorAll(".tb-loi-nhap")
const closeButton = document.getElementById("dong-form-btn")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})

function validateForm() {
    var malopInput = document.getElementById("ma")
    var malopError = document.getElementById("ma-error")
    var tenlopInput = document.getElementById("ten")
    var tenlopError = document.getElementById("ten-error")
    // var emailSvInput = document.getElementById("email-sv")
    // var emailSvError = document.getElementById("email-sv-error")
    // var dobSvInput = document.getElementById("dob-sv")
    // var dobSvError = document.getElementById("dob-sv-error")
    // var gioiTinhSvInput = document.getElementById("gioi-tinh-sv")
    // var gioiTinhSvError = document.getElementById("gioi-tinh-sv-error")
    // var sdtSvInput = document.getElementById("sdt-sv")
    // var sdtSvError = document.getElementById("sdt-sv-error")
    var khoaInput = document.getElementById("ma-khoa")
    var khoaError = document.getElementById("ma-khoa-error")




    if (malopInput.value == "") {
        malopError.style.display = "block";
    } else {
        malopError.style.display = "none";
    }

    if (tenlopInput.value == "") {
        tenlopError.style.display = "block";
    } else {
        tenlopError.style.display = "none";
    }

    // if (emailSvInput.value == "") {
    //     emailSvError.style.display = "block";
    // } else {
    //     emailSvError.style.display = "none";
    // }
    //
    // if (gioiTinhSvInput.value == "") {
    //     gioiTinhSvError.style.display = "block";
    // } else {
    //     gioiTinhSvError.style.display = "none";
    // }
    //
    // if (sdtSvInput.value == "") {
    //     sdtSvError.style.display = "block";
    // } else {
    //     sdtSvError.style.display = "none";
    // }
    if (khoaInput.value == "") {
        khoaError.style.display = "block";

    } else {
        khoaError.style.display = "none";
    }





    malopInput.addEventListener("input", function() {
        malopError.style.display = "none"
    })

    tenlopInput.addEventListener("input", function() {
        tenlopError.style.display = "none"
    })




    khoaInput.addEventListener("input", function() {
        khoaError.style.display = "none"
    })




}




