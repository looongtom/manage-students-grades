const $=document.querySelector.bind(document)
const $$=document.querySelectorAll.bind(document)
const muc=$$('.menuMuc')
console.log(muc)
muc.forEach(tab => {
    tab.onclick=function() {
        $('.menuMuc.bamVao').classList.remove('bamVao')
        this.classList.add('bamVao')
    }
});