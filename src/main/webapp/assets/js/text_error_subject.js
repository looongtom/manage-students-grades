
const errorMessage = document.querySelectorAll(".tb-loi-nhap")
const closeButton = document.getElementById("dong-form-btn")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})

function validateForm() {
    var maMhInput = document.getElementById("ma-mh")
    var maMhError = document.getElementById("ma-mh-error")
    var tenMhInput = document.getElementById("ten-mh")
    var tenMhError = document.getElementById("ten-mh-error")
    var soTinChiMhInput = document.getElementById("stc-mh")
    var soTinChiMhError = document.getElementById("stc-mh-error")
    var khoaMhInput = document.getElementById("ma-khoa-mh")
    var khoaMhError = document.getElementById("ma-khoa-mh-error")



    if (maMhInput.value == "") {
        maMhError.style.display = "block";
    } else {
        maMhError.style.display = "none";
    }

    if (tenMhInput.value == "") {
        tenMhError.style.display = "block";
    } else {
        tenMhError.style.display = "none";
    }

    if (soTinChiMhInput.value == "") {
        soTinChiMhError.style.display = "block";
    } else {
        soTinChiMhError.style.display = "none";
    }


    if (khoaMhInput.value == "") {
        khoaMhError.style.display = "block";

    } else {
        khoaMhError.style.display = "none";
    }






    maMhInput.addEventListener("input", function() {
        maMhError.style.display = "none"
    })

    tenMhInput.addEventListener("input", function() {
        tenMhError.style.display = "none"
    })

    soTinChiMhInput.addEventListener("input", function() {
        soTinChiMhError.style.display = "none"
    })


    khoaMhInput.addEventListener("input", function() {
        khoaMhError.style.display = "none"
    })

}




