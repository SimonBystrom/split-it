const fillForms = (data) => {
  let store = document.getElementById('bill_title')
  let total = document.getElementById('bill_price')
  let priceSuggestions = document.getElementById('price-suggestions')

  if(data.store) {
    store.value = data.store
  }
  if(data.total) {
    total.value = data.total
  } else if (data.prices){
    data.prices.forEach((price) => {
      priceSuggestions.insertAdjacentHTML('afterbegin', `
          <div class="price-option">
            ${price}
          </div>
        `)

    })
    priceSuggestionElements = document.getElementsByClassName('price-option')
    priceSuggestionElements.forEach((item) => {
      item.addEventListener('click', (e) => {
        total.value = parseInt(e.currentTarget.innerHtml, 10)
      })
    })
  }
}

// FINDS THE UPLOADED PHOTO
const billFormAutoFill = () => {
  if (document.getElementById('bill_photo')){
    let input = document.getElementById('bill_photo')
    input.addEventListener('change', (e) => {
      let data = new FormData()
      data.append('photo', input.files[0])
      fetch('/api/v1/scan', {method: 'POST', body: data})
      .then(res => res.json())
      .then((data) => {
        fillForms(data)
      })
    })
  }
}

export {billFormAutoFill}
