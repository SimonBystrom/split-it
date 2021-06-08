
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

  if(document.querySelectorAll('.bill-form').length) {
    let billPhotoButtons = document.querySelectorAll('.split-card-button')
    billPhotoButtons.forEach((button) => {
      button.addEventListener('click', (e) => {
        let expandedFormElement = document.querySelectorAll('.expandedForm')
        let formElements = document.querySelectorAll('.bill-form')

        expandedFormElement.forEach((item) => {
          if(item.id !== e.currentTarget.id){
            item.classList.remove('expandedForm')
          }
        })

        formElements.forEach((element) => {
          if(element.id === e.currentTarget.id){
            element.classList.add('expandedForm')
          }
        })
      })
    })
  }
}


export { billEditShow }
