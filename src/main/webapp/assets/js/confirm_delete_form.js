function hienXacNhanXoa(elementId){
    const el = document.getElementById(elementId);
    el.classList.add('hien-thi-xac-nhan-xoa')
}

function anXacNhanXoa(elementId){
    const el = document.getElementById(elementId);
    el.classList.remove('hien-thi-xac-nhan-xoa')
}
