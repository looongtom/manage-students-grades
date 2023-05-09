
const errorMessage = document.querySelectorAll(".tb-loi-nhap")
const closeButton = document.getElementById("dong-form-btn")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})

function validateForm() {
    var maSvInput = document.getElementById("ma-sv")
    var maSvError = document.getElementById("ma-sv-error")
    var tenSvInput = document.getElementById("ten-sv")
    var tenSvError = document.getElementById("ten-sv-error")
    var emailSvInput = document.getElementById("email-sv")
    var emailSvError = document.getElementById("email-sv-error")
    var dobSvInput = document.getElementById("dob-sv")
    var dobSvError = document.getElementById("dob-sv-error")
    var gioiTinhSvInput = document.getElementById("gioi-tinh-sv")
    var gioiTinhSvError = document.getElementById("gioi-tinh-sv-error")
    var sdtSvInput = document.getElementById("sdt-sv")
    var sdtSvError = document.getElementById("sdt-sv-error")
    var lopSvInput = document.getElementById("ma-lop-sv")
    var lopSvError = document.getElementById("ma-lop-sv-error")

    if (maSvInput.value == "") {
        maSvError.style.display = "block";
    } else {
        maSvError.style.display = "none";
    }

    if (tenSvInput.value == "") {
        tenSvError.style.display = "block";
    } else {
        tenSvError.style.display = "none";
    }

    if (emailSvInput.value == "") {
        emailSvError.style.display = "block";
    } else {
        emailSvError.style.display = "none";
    }

    if (gioiTinhSvInput.value == "") {
        gioiTinhSvError.style.display = "block";
    } else {
        gioiTinhSvError.style.display = "none";
    }

    if (sdtSvInput.value == "") {
        sdtSvError.style.display = "block";
    } else {
        sdtSvError.style.display = "none";
    }
    if (lopSvInput.value == "") {
        lopSvError.style.display = "block";
    } else {
        lopSvError.style.display = "none";
    }


    if (dobSvInput.value == "") {
        dobSvError.style.display = "block";
    } else {
        dobSvError.style.display = "none";
    }

    maSvInput.addEventListener("input", function() {
        maSvError.style.display = "none"
    })

    tenSvInput.addEventListener("input", function() {
        tenSvError.style.display = "none"
    })


    emailSvInput.addEventListener("input", function() {
        emailSvError.style.display = "none"
    })

    dobSvInput.addEventListener("input", function() {
        dobSvError.style.display = "none"
    })

    sdtSvInput.addEventListener("input", function() {
        sdtSvError.style.display = "none"
    })

    gioiTinhSvInput.addEventListener("input", function() {
        gioiTinhSvError.style.display = "none"
    })

    lopSvInput.addEventListener("input", function() {
        lopSvError.style.display = "none"
    })
}

const errorMessageSua = document.querySelectorAll(".tb-loi-nhap-sua")
const closeButtonSua = document.getElementById("dong-form-btn-sua")

closeButtonSua.addEventListener("click", function() {
    for(var i=0; i<errorMessageSua.length; i++) {
        errorMessageSua[i].style.display="none"
    }
})

function validateFormSua() {
    var maSvInput = document.getElementById("ma-sv-sua")
    var maSvError = document.getElementById("ma-sv-error-sua")
    var tenSvInput = document.getElementById("ten-sv-sua")
    var tenSvError = document.getElementById("ten-sv-error-sua")
    var emailSvInput = document.getElementById("email-sv-sua")
    var emailSvError = document.getElementById("email-sv-error-sua")
    var dobSvInput = document.getElementById("dob-sv-sua")
    var dobSvError = document.getElementById("dob-sv-error-sua")
    var gioiTinhSvInput = document.getElementById("gioi-tinh-sv-sua")
    var gioiTinhSvError = document.getElementById("gioi-tinh-sv-error-sua")
    var sdtSvInput = document.getElementById("sdt-sv-sua")
    var sdtSvError = document.getElementById("sdt-sv-error-sua")
    var lopSvInput = document.getElementById("ma-lop-sv-sua")
    var lopSvError = document.getElementById("ma-lop-sv-error-sua")

    if (maSvInput.value == "") {
        maSvError.style.display = "block";
    } else {
        maSvError.style.display = "none";
    }

    if (tenSvInput.value == "") {
        tenSvError.style.display = "block";
    } else {
        tenSvError.style.display = "none";
    }

    if (emailSvInput.value == "") {
        emailSvError.style.display = "block";
    } else {
        emailSvError.style.display = "none";
    }

    if (gioiTinhSvInput.value == "") {
        gioiTinhSvError.style.display = "block";
    } else {
        gioiTinhSvError.style.display = "none";
    }

    if (sdtSvInput.value == "") {
        sdtSvError.style.display = "block";
    } else {
        sdtSvError.style.display = "none";
    }

    if (lopSvInput.value == "") {
        lopSvError.style.display = "block";
    } else {
        lopSvError.style.display = "none";
    }

    if (dobSvInput.value == "") {
        dobSvError.style.display = "block";
    } else {
        dobSvError.style.display = "none";
    }

    maSvInput.addEventListener("input", function() {
        maSvError.style.display = "none"
    })

    tenSvInput.addEventListener("input", function() {
        tenSvError.style.display = "none"
    })


    emailSvInput.addEventListener("input", function() {
        emailSvError.style.display = "none"
    })

    dobSvInput.addEventListener("input", function() {
        dobSvError.style.display = "none"
    })

    sdtSvInput.addEventListener("input", function() {
        sdtSvError.style.display = "none"
    })

    gioiTinhSvInput.addEventListener("input", function() {
        gioiTinhSvError.style.display = "none"
    })

    lopSvInput.addEventListener("input", function() {
        lopSvError.style.display = "none"
    })
}