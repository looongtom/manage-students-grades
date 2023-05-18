
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
    var tenHkInput = document.getElementById("ten-hk")
    var tenHkError = document.getElementById("ten-hk-error");
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

    if (tenHkInput.value == "") {
        tenHkError.style.display = "block";
    } else {
        tenHkError.style.display = "none";
    }

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

    tenHkInput.addEventListener("input", function() {
        tenHkErrorError.style.display = "none"
    })

    khoaInput.addEventListener("input", function() {
        khoaError.style.display = "none"
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
    let error=false;
    const malopInput = document.getElementById("ma-lop-sua")
    const malopError = document.getElementById("ma-lop-error-sua")
    const tenlopInput = document.getElementById("ten-lop-sua")
    const tenlopError = document.getElementById("ten-lop-error-sua")
    const tenHkInput = document.getElementById("ten")
    const tenHkError = document.getElementById("ten-error-sua")
    const khoaInput = document.getElementById("ma-khoacm-sua")
    const khoaError = document.getElementById("ma-khoa-lop-error-sua")

    if (malopInput.value === "") {
        malopError.style.display = "block";
        error = true;
    } else {
        malopError.style.display = "none";
    }

    if (tenlopInput.value === "") {
        tenlopError.style.display = "block";
        error = true;
    } else {
        tenlopError.style.display = "none";
    }

    if (tenHkInput.value === "") {
        tenHkError.style.display = "block";
        error = true;
    } else {
        tenHkError.style.display = "none";
    }

    if (khoaInput.value === "") {
        khoaError.style.display = "block";
        error = true;
    } else {
        khoaError.style.display = "none";
    }
    malopInput.addEventListener("input", function() {
        malopError.style.display = "none"
    })

    tenlopInput.addEventListener("input", function() {
        tenlopError.style.display = "none"
    })


    tenHkInput.addEventListener("input", function() {
        tenHkError.style.display = "none"
    })


    khoaInput.addEventListener("input", function() {
        khoaError.style.display = "none"
    })

    return !error;
}
const errorMessageSua = document.querySelectorAll(".tb-loi-nhap-sua")
const closeButtonSua = document.getElementById("dong-form-btn-sua")

closeButtonSua.addEventListener("click", function() {
    for(var i=0; i<errorMessageSua.length; i++) {
        errorMessageSua[i].style.display="none"
    }
})

function validateFormSua() {
    var maGvInput = document.getElementById("ma-lop-sua")
    var maGvError = document.getElementById("ma-gv-error-sua")
    var tenGvInput = document.getElementById("ten-lop-sua")
    var tenGvError = document.getElementById("ten-gv-error-sua")
    var hkInput = document.getElementById("ten")
    var hkError = document.getElementById("ten-error-sua")

    var khoaGvInput = document.getElementById("ma-khoa-cm-sua")
    var khoaGvError = document.getElementById("ma-khoa-lop-error-sua")
    if (maGvInput.value === "") {
        maGvError.style.display = "block";
    } else {
        maGvError.style.display = "none";
    }

    if (tenGvInput.value === "") {
        tenGvError.style.display = "block";
    } else {
        tenGvError.style.display = "none";
    }

    if (hkInput.value === "") {
        hkError.style.display = "block";
    } else {
        hkError.style.display = "none";
    }

    if (gioiTinhGvInput.value === "") {
        gioiTinhGvError.style.display = "block";
    } else {
        gioiTinhGvError.style.display = "none";
    }

    if (sdtGvInput.value === "") {
        sdtGvError.style.display = "block";
    } else {
        sdtGvError.style.display = "none";
    }
    if (khoaGvInput.value === "") {
        khoaGvError.style.display = "block";

    } else {
        khoaGvError.style.display = "none";
    }
    maGvInput.addEventListener("input", function() {
        maGvError.style.display = "none"
    })

    tenGvInput.addEventListener("input", function() {
        tenGvError.style.display = "none"
    })


    hkInput.addEventListener("input", function() {
        hkError.style.display = "none"
    })

    sdtGvInput.addEventListener("input", function() {
        sdtGvError.style.display = "none"
    })

    gioiTinhGvInput.addEventListener("input", function() {
        gioiTinhGvError.style.display = "none"
    })

    khoaGvInput.addEventListener("input", function() {
        khoaGvError.style.display = "none"
    })
}