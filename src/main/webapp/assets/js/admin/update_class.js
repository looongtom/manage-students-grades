function showModalSua(elementId, idlop, tenlop, khoacm) {
    const el = document.getElementById(elementId);
    document.getElementById("ma-lop-sua").value=idlop;
    document.getElementById("ten-lop-sua").value=tenlop;
    document.getElementById("ma-khoacm-sua").value=khoacm;
    el.classList.add('hien-thi-modal')
}

function hideModalSua(elementId){
    const el = document.getElementById(elementId);
    el.classList.remove('hien-thi-modal')
}