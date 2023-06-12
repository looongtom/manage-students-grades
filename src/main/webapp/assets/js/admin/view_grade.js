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

        if(n==2 || n==3 || n==4 || n==5 || n==6){
             x = parseFloat(a.getElementsByTagName('td')[n].innerText);
             y = parseFloat(b.getElementsByTagName('td')[n].innerText);
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