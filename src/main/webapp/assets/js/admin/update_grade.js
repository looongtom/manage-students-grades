function showModalSua(elementId, idDiemUpdate, idSvUpdate, diemCcUpdate,diemBtUpdate,diemThiUpdate,diemKtUpdate
                      , idMhUpdate, idHkUpdate, idLopUpdate,idGvUpdate) {
    const el = document.getElementById(elementId);
    document.getElementById("id-diem-sua").value = idDiemUpdate;
    document.getElementById("id-gv-sua").value = idGvUpdate;
    document.getElementById("id-mh-sua").value = idMhUpdate;
    document.getElementById("id-sv-sua").value = idSvUpdate;
    document.getElementById("id-hk-sua").value = idHkUpdate;
    document.getElementById("id-lop-sua").value = idLopUpdate;
    document.getElementById("diem-cc-sua").value = diemCcUpdate;
    document.getElementById("diem-bt-sua").value = diemBtUpdate;
    document.getElementById("diem-thi-sua").value = diemThiUpdate;
    document.getElementById("diem-kt-sua").value = diemKtUpdate;

    el.classList.add('hien-thi-modal');
}

function hideModalSua(elementId){
    const el = document.getElementById(elementId);
    el.classList.remove('hien-thi-modal');
}
