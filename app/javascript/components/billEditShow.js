
const billEditShow = () => {
  if(document.querySelectorAll('.bill-card-container').length) {
    let bills = document.querySelectorAll('.bill-card')
    bills.forEach( (bill) => {
      bill.addEventListener('click', (e) => {

        let expanded = document.querySelectorAll('.expanded')

        expanded.forEach((item) => {
          if (item.id !== e.currentTarget.nextElementSibling.id) {
            item.classList.remove('expanded')
          }
        })
        e.currentTarget.nextElementSibling.classList.toggle('expanded')

      })
    })
  }
}


export { billEditShow }
