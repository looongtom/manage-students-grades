var formData = {
    "idSv": "",
    "tenSv": "",
    "baseRequest": {
        "sortField": "",
        "sortOrder": "",
        "pageIndex": 1,
        "pageSize": 10
    }
};

$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/api/admin/home/student",
        data: JSON.stringify(formData),
        contentType: "application/json",
        success: function(res) {
            // display data
            console.log(res.data);
            var tableBody = $("#myTable tbody");
            // clear table
            tableBody.empty();
            // add data table
            $.each(res.data, function(index, item) {
                var row = `
                            <tr>
                              <td>`+item.idSv+`</td>
                              <td>`+item.tenSv+`</td>
                              <td>`+item.emailSv+`</td>
                              <td>`+item.dobSv+`</td>
                              <td>`+item.genderSv+`</td>
                              <td>`+item.phoneSv+`</td>
                              <td>`+item.lopHanhChinhSv+`</td>
                              <td>`+item.ngayTao+`</td>
                              <td>`+item.ngaySua+`</td>
                              <td class="chucNang">
                                <div class="hop-hanh-dong">
                                  <button class="sua hop-hanh-dong-nut" type="button">
                                    <span class="sua_tieuDe">Sửa</span>
                                    <i class="fa-solid fa-pencil sua_icon"></i>
                                  </button>
                                  <button onclick="showModal('modal_xac_nhan_xoa')" class="xoa hop-hanh-dong-nut" type="button">
                                    <span class="xoa_tieuDe">Xóa</span>
                                    <i class="fa-solid fa-trash xoa_icon"></i>
                                  </button>
                                </div>
                              </td>
                            </tr>`;
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log("Lấy thông tin sinh viên bị lỗi!");
        }
    });
});