const fillForms = (data, container) => {
  let store = container.querySelector('input.bill_title')
  let total = container.querySelector('input.bill_price')
  let priceSuggestions = container.querySelector('.price-suggestions')
  let priceSuggestionText = container.querySelector('.price-suggestions-text')
  console.log(container.querySelector('.bill_title'), data)
  if(data.store) {
    store.value = data.store
  }
  if(data.total) {
    total.value = data.total
  } else if (data.prices){
    priceSuggestionText.innerText = 'Price suggestions'
    data.prices.forEach((price) => {
      priceSuggestions.insertAdjacentHTML('afterbegin', `
          <div class="price-option">
            ${price}
          </div>
        `)

    })
    let priceSuggestionElements = container.getElementsByClassName('price-option')
    for (let suggestionElement of priceSuggestionElements) {
      suggestionElement.addEventListener('click', (e) => {
        total.value = parseFloat(e.currentTarget.innerText)
        console.log(e.currentTarget.innerText)
      })
    }
  }

}



// FINDS THE UPLOADED PHOTO
const billFormAutoFill = () => {
  let containers = document.querySelectorAll('.split-form-container')
  if (containers.length){
    containers.forEach((container) => {
      if(container.querySelector('.bill_photo')){
        let input = container.querySelector('.bill_photo')
        input.addEventListener('change', (e) => {
          let data = new FormData()
          data.append('photo', input.files[0])
          fetch('/api/v1/scan', {method: 'POST', body: data})
          .then(res => res.json())
          .then((data) => {
            fillForms(data, container)
          })
        })
      }
    })
  }
}

export {billFormAutoFill}
