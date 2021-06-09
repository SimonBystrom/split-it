const splitShowTabs = () => {
  if(document.getElementById('bills-tab')){
    let buttons = document.querySelectorAll('.split-show-button')
    console.log(buttons)
    let billsTab = document.getElementById('bills-tab')
    let balanceTab = document.getElementById('balance-tab')
    buttons.forEach((button) => {
      button.addEventListener('click', (e) => {
        if(e.currentTarget.id === 'bills-button'){
          balanceTab.style.display = "none"
          billsTab.style.display = "block"
        }
        if(e.currentTarget.id === 'balance-button'){
          console.log(balanceTab)
          billsTab.style.display = "none"
          balanceTab.style.display = "block"
        }
      })
    })
  }
}

export {splitShowTabs}
