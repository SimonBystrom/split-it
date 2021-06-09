const splitShowTabs = () => {
  if(document.getElementById('bills-tab')){
    let buttons = document.querySelectorAll('.split-show-button')
    console.log(buttons)
    let billsTab = document.getElementById('bills-tab')
    let balanceTab = document.getElementById('balance-tab')
    buttons.forEach((button) => {
      button.addEventListener('click', (e) => {
        buttons.forEach((button) => {
          button.classList.remove('active-tab')
        })
        if(e.currentTarget.id === 'bills-button'){
          balanceTab.style.display = "none"
          billsTab.style.display = "block"
          button.classList.add('active-tab')
        }
        if(e.currentTarget.id === 'balance-button'){
          console.log(balanceTab)
          billsTab.style.display = "none"
          balanceTab.style.display = "block"
          button.classList.add('active-tab')
        }
      })
    })
  }
}

export {splitShowTabs}
