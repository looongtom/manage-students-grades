function sortTable(n, event) {
    var thead=document.querySelector('thead');
    var tbody=document.querySelector('tbody');
    var bRows=[...tbody.rows]
    var hData=[...thead.querySelectorAll('th')]
    var desc=false;

    hData.map((head) => {
        if(head!=event) {
            head.classList.remove('asc', 'desc')
        }
    })

    desc=event.classList.contains('asc') ? true : false;
    event.classList[desc ? 'remove' : 'add']('asc')
    event.classList[desc ? 'add' : 'remove']('desc')

    bRows.sort((a, b) => {
        var x=a.getElementsByTagName('td')[n].innerText;
        var y=b.getElementsByTagName('td')[n].innerText;

        //Trường hợp sort ngày sinh
        if(n==3) {
            var a=x.split('/')
            var b=y.split('/')
            x=a[2]+a[1]+a[0]
            y=b[2]+b[1]+b[0]
        }

        if(desc) {
            return x<y ? -1 : 1;
        } else {
            return x>y ? -1 : 1;
        }
    });
    bRows.map((bRow) => {
        tbody.appendChild(bRow)
    })
}