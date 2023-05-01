var formData={
    "tenGv":"",
    "baseRequest": {
        "sortField":"",
        "sortOrder":"",
        "pageIndex": 0,
        "pageSize": 10
    }
}
document.addEventListener("DOMContentLoaded", getAllGV());

function getAllGV() {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost:8080/api/home/teacher', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            const res = JSON.parse(xhr.responseText);
            const myTable = document.getElementById('myTable');
            const tbody = myTable.querySelector('tbody');
            while (tbody.firstChild) {
                tbody.removeChild(tbody.firstChild);
            }
            res.data.forEach(function(item) {
                var row = `
                            <tr>
                              <td>`+item.idGv+`</td>
                              <td>`+item.tenGv+`</td>
                              <td>`+item.sdtGv+`</td>
                              <td>`+item.emailGv+`</td>
                              <td>`+item.genderGv+`</td>
                              <td>`+item.tenKhoa+`</td>
                              <td>`+item.ngayTao+`</td>
                              <td>`+item.ngaySua+`</td>
                              <td class="chucNang">
                                <div class="hop-hanh-dong">
                                  <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_giang_vien_sua', '`+ item.idGv +`', '`+ item.tenGv +`', '`+ item.sdtGv +`', '`+ item.emailGv +`', '`+ item.genderGv +`', '`+ item.idKhoa +`')">
                                    <span class="sua_tieuDe">Sửa</span>
                                    <i class="fa-solid fa-pencil sua_icon"></i>
                                  </button>
                                  <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa', '`+ item.idGv +`')" class="xoa hop-hanh-dong-nut" type="button">
                                    <span class="xoa_tieuDe">Xóa</span>
                                    <i class="fa-solid fa-trash xoa_icon"></i>
                                  </button>
                                </div>
                              </td>
                            </tr>`;
                tbody.innerHTML+=row;
            });
        } else {
            console.error('Request failed. Status code: ' + xhr.status);
        }
    };
    xhr.send(JSON.stringify(formData));
}
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

function timKiemGV() {
    const name = document.querySelector('.nhapTimKiem').value;
    console.log(name);
    var pageSize=9999;
    if(name==="") {
        pageSize=10;
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
            "pageSize": 10
        }
    }
    getAllGV();
}