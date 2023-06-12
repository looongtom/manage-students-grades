var searchInputHk = document.getElementById("searchInputHk");
var selectOptionsHk = document.getElementById("hkSelect").options;

searchInputHk.addEventListener("input", function() {
    var searchText = this.value.toLowerCase();

    for (var i = 0; i < selectOptionsHk.length; i++) {
        var optionText = selectOptionsHk[i].text.toLowerCase();
        var option = selectOptionsHk[i];

        if (optionText.indexOf(searchText) !== -1) {
            option.style.display = "";
        } else {
            option.style.display = "none";
        }
    }
});

var searchInputGv = document.getElementById("searchInputGv");
var selectOptionsGv = document.getElementById("gvSelect").options;

searchInputGv.addEventListener("input", function() {
    var searchText = this.value.toLowerCase();

    for (var i = 0; i < selectOptionsGv.length; i++) {
        var optionText = selectOptionsGv[i].text.toLowerCase();
        var option = selectOptionsGv[i];

        if (optionText.indexOf(searchText) !== -1) {
            option.style.display = "";
        } else {
            option.style.display = "none";
        }
    }
});

var searchInputMh = document.getElementById("searchInputMh");
var selectOptionsMh = document.getElementById("mhSelect").options;

searchInputMh.addEventListener("input", function() {
    var searchText = this.value.toLowerCase();

    for (var i = 0; i < selectOptionsMh.length; i++) {
        var optionText = selectOptionsMh[i].text.toLowerCase();
        var option = selectOptionsMh[i];

        if (optionText.indexOf(searchText) !== -1) {
            option.style.display = "";
        } else {
            option.style.display = "none";
        }
    }
});

var searchInputLh = document.getElementById("searchInputLh");
var selectOptionsLh = document.getElementById("lhSelect").options;

searchInputLh.addEventListener("input", function() {
    var searchText = this.value.toLowerCase();

    for (var i = 0; i < selectOptionsLh.length; i++) {
        var optionText = selectOptionsLh[i].text.toLowerCase();
        var option = selectOptionsLh[i];

        if (optionText.indexOf(searchText) !== -1) {
            option.style.display = "";
        } else {
            option.style.display = "none";
        }
    }
});


function validateForm() {
    // Retrieve form fields and perform validation
    // Example validation logic
    var selectElementChuyenCan = document.getElementById("chuyenCan");
    var selectedValueChuyenCan = parseInt(selectElementChuyenCan.value);

    var selectElementBaiTap = document.getElementById("baiTap");
    var selectedValueBaiTap = parseInt(selectElementBaiTap.value);

    var selectElementThi = document.getElementById("thi");
    var selectedValueThi = parseInt(selectElementThi.value);

    var selectElementKiemTra = document.getElementById("kiemTra");
    var selectedValueKiemTra = parseInt(selectElementKiemTra.value);

    var sum = selectedValueChuyenCan + selectedValueBaiTap + selectedValueThi + selectedValueKiemTra;

    if (sum !== 100) {
        alert("Tổng các hệ số thành phần phải bằng 100%");
        return false; // Prevent form submission
    }

    // Additional validation logic goes here

    // If all validations pass, allow form submission
    return true;
}