var formData={
    "sortField":"",
    "sortOrder":"",
    "pageIndex":0,
    "pageSize":10
}
$(document).ready(getAllGV());

function getAllGV() {
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/api/home/teacher",
        data: JSON.stringify(formData),
        contentType: "application/json",
        success: function(res) {
            var tableBody = $("#myTable tbody");
            // clear table
            tableBody.empty();
            // add data table
            $.each(res.data, function(index, item) {
                var row = `
                            <tr>
                              <td>`+item.idGv+`</td>
                              <td>`+item.tenGv+`</td>
                              <td>`+item.sdtGv+`</td>
                              <td>`+item.emailGv+`</td>
                              <td>`+item.genderGv+`</td>
                              <td>`+item.idKhoa+`</td>
                              <td>`+item.ngayTao+`</td>
                              <td>`+item.ngaySua+`</td>
                              <td class="chucNang">
                                <div class="hop-hanh-dong">
                                  <button class="sua hop-hanh-dong-nut" type="button">
                                    <span class="sua_tieuDe">Sửa</span>
                                    <i class="fa-solid fa-pencil sua_icon"></i>
                                  </button>
                                  <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa')" class="xoa hop-hanh-dong-nut" type="button">
                                    <span class="xoa_tieuDe">Xóa</span>
                                    <i class="fa-solid fa-trash xoa_icon"></i>
                                  </button>
                                </div>
                              </td>
                            </tr>`;
                tableBody.append(row);
            });
        },
        error: function (xhr, status, error) {
            console.log("Lấy thông tin giảng viên bị lỗi");
            jsonValue = jQuery.parseJSON(error.responseText);
            alert("error: " + error.responseText);
        }
    });
}
function addGV() {
    var maGvInput = document.getElementById("ma-gv").value;
    var tenGvInput = document.getElementById("ten-gv").value;
    var emailGvInput = document.getElementById("email-gv").value;
    var gioiTinhGvInput = document.getElementById("gioi-tinh-gv").value;
    var sdtGvInput = document.getElementById("sdt-gv").value;
    var khoaGvInput = document.getElementById("ma-khoa-gv").value;
    console.log(maGvInput + ": " + tenGvInput)
    console.log(gioiTinhGvInput + " : " + khoaGvInput)
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/api/admin/home/teacher/create-or-edit",
        data: JSON.stringify({
            "idGv": maGvInput,
            "tenGv": tenGvInput,
            "sdtGv": sdtGvInput,
            "emailGv": emailGvInput,
            "genderGv": gioiTinhGvInput,
            "idKhoa": khoaGvInput,
        }),
        contentType: "application/json",
        success: function(res) {
            alert("Thêm giảng viên " + maGvInput + " : " + tenGvInput + " thành công");
            hideModal('modal_giang_vien');
            getAllGV();
        },
        error: function (xhr, status, error) {
            console.log("Lấy thông tin giảng viên bị lỗi");
            jsonValue = jQuery.parseJSON(error.responseText);
            alert("error: " + error.responseText);
        }
    });
}
function deleteGV() {
    anXacNhanXoa('modal_xac_nhan_xoa')
    $.ajax({
        type: "DELETE",
        url: "http://localhost:8080/api/home/teacher?id=" + getIdGv,
        contentType: "application/json",
        dataType: 'text',
        success: function(res) {
            alert("Xoá giảng viên " + getIdGv + " thành công");
            getAllGV();
        },
        error: function (xhr, status, error) {
            alert("Không thể xóa giảng viên");
            console.log("Không thể xóa giảng viên");
        }
    });
}