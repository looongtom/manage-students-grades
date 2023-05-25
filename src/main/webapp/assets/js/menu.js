var storeMenu=(localStorage.getItem('menu')==='true')
var manHinhChinh=document.querySelector('.manHinhChinh')
var menu=document.querySelector('.menu')
if(storeMenu) {
    manHinhChinh.classList.add('dongMenu')
    menu.classList.add('dongMenu')
} else {
    manHinhChinh.classList.remove('dongMenu')
    menu.classList.remove('dongMenu')
}

function closeMenu() {
    var isClosed = menu.classList.contains('dongMenu');
    console.log(isClosed);
    if (!isClosed) {
        menu.classList.add('dongMenu');
        setTimeout(function() {
            manHinhChinh.classList.add('dongMenu');
            localStorage.setItem('menu', !isClosed);
        }, 300); 
    } else {
        manHinhChinh.classList.remove('dongMenu');
        menu.classList.remove('dongMenu');
        localStorage.setItem('menu', !isClosed);
    }
}