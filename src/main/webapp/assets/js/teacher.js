// set mặc định các biến
var pageSize=2;
var pageIndex=0;
var totalPages;

// request body của phương thức get và find
var formData={
    "tenGv":"",
    "baseRequest": {
        "sortField":"",
        "sortOrder":"",
        "pageIndex": pageIndex,
        "pageSize": pageSize
    }
}

// cái này sẽ được thực thi ngay khi mới vào trang -> Lấy tất cả giảng viên
// document.addEventListener("DOMContentLoaded", getAllGV());

// đọc (R)
// function getAllGV() {
//     const xhr = new XMLHttpRequest();
//     xhr.open('POST', 'http://localhost:8080/api/home/teacher', true);
//     xhr.setRequestHeader('Content-Type', 'application/json');
//     xhr.onload = function() {
//         if (xhr.status === 200) {
//             const res = JSON.parse(xhr.responseText);
//             const myTable = document.getElementById('myTable');
//             const tbody = myTable.querySelector('tbody');
//             totalPages=res.totalPages;
//             while (tbody.firstChild) {
//                 tbody.removeChild(tbody.firstChild);
//             }
//             res.data.forEach(function(item) {
//                 var row = `
//                             <tr>
//                               <td>`+item.idGv+`</td>
//                               <td>`+item.tenGv+`</td>
//                               <td>`+item.sdtGv+`</td>
//                               <td>`+item.emailGv+`</td>
//                               <td>`+item.genderGv+`</td>
//                               <td>`+item.tenKhoa+`</td>
//                               <td>`+item.ngayTao+`</td>
//                               <td>`+item.ngaySua+`</td>
//                               <td class="chucNang">
//                                 <div class="hop-hanh-dong">
//                                   <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_giang_vien_sua', '`+ item.idGv +`', '`+ item.tenGv +`', '`+ item.sdtGv +`', '`+ item.emailGv +`', '`+ item.genderGv +`', '`+ item.idKhoa +`')">
//                                     <span class="sua_tieuDe">Sửa</span>
//                                     <i class="fa-solid fa-pencil sua_icon"></i>
//                                   </button>
//                                   <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa', '`+ item.idGv +`')" class="xoa hop-hanh-dong-nut" type="button">
//                                     <span class="xoa_tieuDe">Xóa</span>
//                                     <i class="fa-solid fa-trash xoa_icon"></i>
//                                   </button>
//                                 </div>
//                               </td>
//                             </tr>`;
//                 tbody.innerHTML+=row;
//             });
//         } else {
//             console.error('Request failed. Status code: ' + xhr.status);
//         }
//     };
//     xhr.send(JSON.stringify(formData));
// }

// thêm (C)
function addGV() {
    const maGvInput = document.getElementById("ma-gv").value;
    const tenGvInput = document.getElementById("ten-gv").value;
    const emailGvInput = document.getElementById("email-gv").value;
    const gioiTinhGvInput = document.getElementById("gioi-tinh-gv").value;
    const sdtGvInput = document.getElementById("sdt-gv").value;
    const khoaGvInput = document.getElementById("ma-khoa-gv").value;
    console.log(maGvInput + ": " + tenGvInput);
    console.log(gioiTinhGvInput + " : " + khoaGvInput);
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost:8080/api/admin/home/teacher/create-or-edit', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("Thêm giảng viên " + maGvInput + " : " + tenGvInput + " thành công");
            hideModal('modal_giang_vien');
            getAllGV();
        } else {
            console.log("Lấy thông tin giảng viên bị lỗi");
            jsonValue = jQuery.parseJSON(error.responseText);
            console.error('Request failed. Status code: ' + xhr.status);
        }
    };
    xhr.send(JSON.stringify({
        "idGv": maGvInput,
        "tenGv": tenGvInput,
        "sdtGv": sdtGvInput,
        "emailGv": emailGvInput,
        "genderGv": gioiTinhGvInput,
        "idKhoa": khoaGvInput,
    }));
}

// sửa (U)
function updateGV() {
    const maGvInput = document.getElementById("ma-gv-sua").value;
    const tenGvInput = document.getElementById("ten-gv-sua").value;
    const emailGvInput = document.getElementById("email-gv-sua").value;
    const gioiTinhGvInput = document.getElementById("gioi-tinh-gv-sua").value;
    const sdtGvInput = document.getElementById("sdt-gv-sua").value;
    const khoaGvInput = document.getElementById("ma-khoa-gv-sua").value;
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost:8080/api/admin/home/teacher/create-or-edit', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("Sửa giảng viên " + maGvInput + " : " + tenGvInput + " thành công");
            hideModal('modal_giang_vien');
            getAllGV();
        } else {
            console.log("Lấy thông tin giảng viên bị lỗi");
            jsonValue = jQuery.parseJSON(error.responseText);
            console.error('Request failed. Status code: ' + xhr.status);
        }
    };
    xhr.send(JSON.stringify({
        "idGv": maGvInput,
        "tenGv": tenGvInput,
        "sdtGv": sdtGvInput,
        "emailGv": emailGvInput,
        "genderGv": gioiTinhGvInput,
        "idKhoa": khoaGvInput,
    }));
}

// xóa (D)
function deleteGV(el) {
    anXacNhanXoa('modal_xac_nhan_xoa');
    const id = el.getAttribute('data-id');
    const xhr = new XMLHttpRequest();
    xhr.open('DELETE', 'http://localhost:8080/api/home/teacher?id=' + id, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("Xoá giảng viên " + id + " thành công");
            getAllGV();
        } else {
            alert("Không thể xóa giảng viên");
            console.log("Không thể xóa giảng viên");
        }
    };
    xhr.send();
}

// tìm kiếm
function timKiemGV() {
    const name = document.querySelector('.nhapTimKiem').value;
    console.log(name);
    if(name!=="") {
        pageSize=9999;
    }
    formData={
        "tenGv": name,
        "baseRequest": {
            "sortField":"",
            "sortOrder":"",
            "pageIndex": 0,
            "pageSize": pageSize
        }
    }
    getAllGV();
}

// sort
function sortTable(field, event) {
    var thead=document.querySelector('thead');
    var hData=[...thead.querySelectorAll('th')]

    hData.map((head) => {
        if(head!==event) {
            head.classList.remove('asc', 'desc')
        }
    })

    var desc=event.classList.contains('asc');
    event.classList[desc ? 'remove' : 'add']('asc')
    event.classList[desc ? 'add' : 'remove']('desc')
    formData={
        "tenGv": "",
        "baseRequest": {
            "sortField": field,
            "sortOrder": desc ? 'desc' : 'asc',
            "pageIndex": 0,
            "pageSize": pageSize
        }
    }
    getAllGV();
}

// lấy element để phân trang
// const paginationElement = document.querySelector(".phanTrang ul");
// paginationElement.innerHTML = createPaginationUI(totalPages, pageIndex+1);

// phân trang
// function createPaginationUI(totalPages, currentPage){
//     let liTag = '';
//     let active;
//     let beforePage = currentPage - 1;
//     let afterPage = currentPage + 1;
//     if(currentPage > 1){
//         liTag += `<li class="nutPaginate prev" style="color: white" onclick="createPagination(totalPages, ${currentPage - 1})"><span><i class="fas fa-angle-left"></i></span></li>`;
//     }
//     if(currentPage > 2 && totalPages>4){
//         liTag += `<li class="first numb" onclick="createPagination(totalPages, 1)"><span>1</span></li>`;
//         if(currentPage > 3){
//             liTag += `<li class="dots"><span>...</span></li>`;
//         }
//     }
//     if (currentPage === totalPages) {
//         beforePage = beforePage - 2;
//     } else if (currentPage === totalPages - 1) {
//         beforePage = beforePage - 1;
//     }
//     if (currentPage === 1) {
//         beforePage=1;
//         afterPage = afterPage + 2;
//     } else if (currentPage === 2) {
//         beforePage=1;
//         afterPage  = afterPage + 1;
//     }
//     for (var plength = beforePage; plength <= afterPage; plength++) {
//         if (plength > totalPages) {
//             continue;
//         }
//         if (plength === 0) {
//             plength = plength + 1;
//         }
//         if(currentPage === plength){
//             active = "active";
//         }else{
//             active = "";
//         }
//         liTag += `<li class="numb ${active}" onclick="createPagination(totalPages, ${plength})"><span>${plength}</span></li>`;
//     }
//     if(currentPage < totalPages - 1 && totalPages>4){
//         if(currentPage < totalPages - 2){
//             liTag += `<li class="dots"><span>...</span></li>`;
//         }
//         liTag += `<li class="last numb" onclick="createPagination(totalPages, ${totalPages})"><span>${totalPages}</span></li>`;
//     }
//     if (currentPage < totalPages) {
//         liTag += `<li class="nutPaginate next" style="color: white" onclick="createPagination(totalPages, ${currentPage + 1})"><span><i class="fas fa-angle-right"></i></span></li>`;
//     }
//     paginationElement.innerHTML = liTag;
//     return liTag;
// }

const prevBtn=document.querySelector(".nutPaginate.prev");
const nextBtn=document.querySelector(".nutPaginate.next");
const pageNumbers = document.querySelectorAll(".numb");
prevBtn.addEventListener("click", () => {
    if (pageIndex > 0) {
        pageIndex--;
        formData={
            "tenGv":"",
            "baseRequest": {
                "sortField":"",
                "sortOrder":"",
                "pageIndex": pageIndex,
                "pageSize": pageSize
            }
        }
        getAllGV();
    }
});

nextBtn.addEventListener("click", () => {
    if(pageIndex<totalPages-1) {
        pageIndex++;
        formData={
            "tenGv":"",
            "baseRequest": {
                "sortField":"",
                "sortOrder":"",
                "pageIndex": pageIndex,
                "pageSize": pageSize
            }
        }
        getAllGV();
    }
});

pageNumbers.forEach((pageNumber, index) => {
    pageNumber.addEventListener("click", () => {
        pageIndex = index;
        formData={
            "tenGv":"",
            "baseRequest": {
                "sortField":"",
                "sortOrder":"",
                "pageIndex": pageIndex,
                "pageSize": pageSize
            }
        }
        getAllGV();
    });
});
