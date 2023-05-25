const errorMessage = document.querySelectorAll(".tb-loi-nhap-sua")
const closeButton = document.getElementById("dong-form-btn-sua")

closeButton.addEventListener("click", function() {
    for(var i=0; i<errorMessage.length; i++) {
        errorMessage[i].style.display="none"
    }
})


function validateFormSua() {
    let error = false;
    const diemCcInput = document.getElementById("diem-cc-sua");
    const maCcError = document.getElementById("ma-cc-error")
    const diemCcInputValue=diemCcInput.value;


    const diemBtInput = document.getElementById("diem-bt-sua");
    const maBtError = document.getElementById("ma-bt-error")
    const diemBtInputValue=diemBtInput.value;

    const diemThiInput = document.getElementById("diem-thi-sua");
    const maThiError = document.getElementById("ma-thi-error")
    const diemThiInputValue=diemThiInput.value;

    const diemKtInput = document.getElementById("diem-kt-sua");
    const maKtError = document.getElementById("ma-kt-error")
    const diemKtInputValue=diemKtInput.value;

    if (isNaN(diemCcInputValue) || parseFloat(diemCcInputValue) < 0) {
        maCcError.style.display = "block";
        error = true;
    } else {
        maCcError.style.display = "none";
    }

    if (isNaN(diemBtInputValue) || parseFloat(diemBtInputValue) < 0) {
        maBtError.style.display = "block";
        error = true;
    } else {
        maBtError.style.display = "none";
    }

    if (isNaN(diemThiInputValue) || parseFloat(diemThiInputValue) < 0) {
        maThiError.style.display = "block";
        error = true;
    } else {
        maThiError.style.display = "none";
    }

    if (isNaN(diemKtInputValue) || parseFloat(diemKtInputValue) < 0) {
        maKtError.style.display = "block";
        error = true;
    } else {
        maKtError.style.display = "none";
    }


    diemCcInput.addEventListener("input", function() {
        maCcError.style.display = "none"
    })

    diemBtInput.addEventListener("input", function() {
        maBtError.style.display = "none"
    })


    diemThiInput.addEventListener("input", function() {
        maThiError.style.display = "none"
    })

    diemKtInput.addEventListener("input", function() {
        maKtError.style.display = "none"
    })


    return !error;
}