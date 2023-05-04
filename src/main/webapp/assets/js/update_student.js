function showModalSua(elementId, idSv, tenSv, emailSv, dobSv, genderSv, sdtSv, lopSv) {
    const el = document.getElementById(elementId);
    document.getElementById("ma-sv-sua").value=idSv;
    document.getElementById("ten-sv-sua").value=tenSv;
    document.getElementById("email-sv-sua").value=emailSv;
    document.getElementById("dob-sv-sua").value=genderSv;
    document.getElementById("sdt-sv-sua").value=sdtSv;
    document.getElementById("ma-lop-sv-sua").value=lopSv;
    el.classList.add('hien-thi-modal');
}

function hideModalSua(elementId){
    const el = document.getElementById(elementId);
    el.classList.remove('hien-thi-modal');
}
