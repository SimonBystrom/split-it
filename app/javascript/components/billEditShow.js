
const billEditShow = () => {
  let bills = document.querySelectorAll('.bill-card')
  console.log(bills)
  bills.forEach( (bill) => {
    bill.addEventListener('click', (e) => {
      console.log(e.currentTarget.id)
      let expanded = document.querySelectorAll('.expanded')
    })
  })
}

export { billEditShow }
