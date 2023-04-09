function closeMenu() {
    var menu=document.querySelector('.menu')
    var isClosed=menu.classList.contains('dongMenu')
    console.log(isClosed)
    var manHinhChinh=document.querySelector('.manHinhChinh')
    if(!isClosed) {
        manHinhChinh.classList.add('dongMenu')
        menu.classList.add('dongMenu')
    } else {
        manHinhChinh.classList.remove('dongMenu')
        menu.classList.remove('dongMenu')
    }
}