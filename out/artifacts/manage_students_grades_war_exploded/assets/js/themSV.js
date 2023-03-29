
const buyBtns = document.getElementById('nut_them_SV')
const modal = document.querySelector('.js-modal')
const modalClose = document.querySelector('.js-modal-close')
const modalContainer = document.querySelector('.js-modal-container')

const buyBtns1 = document.getElementById('add-student-1')
const modal1 = document.querySelector('.js-modal1')
const modalClose1 = document.querySelector('.js-modal-close1')
const modalContainer1 = document.querySelector('.js-modal-container1')


function show(){
    modal.classList.add('open')
}
function hide(){
    modal.classList.remove('open')
}


function hide1(){
    modal1.classList.remove('open')
}

function show1(){
    modal1.classList.add('open')
}



buyBtns.addEventListener('click', show)
modal.addEventListener('click', hide)
modalClose.addEventListener('click', hide)
modalContainer.addEventListener('click', function(event){
    event.stopPropagation()
})


buyBtns1.addEventListener('click',show1)
modal1.addEventListener('click', hide1)
modalClose1.addEventListener('click', hide1)
modalContainer1.addEventListener('click', function(event){
    event.stopPropagation()
})
