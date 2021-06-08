const fillForms = (data) => {
  let store = document.getElementById('bill_title')
  let total = document.getElementById('bill_price')
  let priceSuggestions = document.getElementById('price-suggestions')
  let priceSuggestionText = document.getElementById('price-suggestions-text')

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
    let priceSuggestionElements = document.getElementsByClassName('price-option')
    for (let suggestionElement of priceSuggestionElements) {
      suggestionElement.addEventListener('click', (e) => {
        total.value = parseInt(e.currentTarget.innerText, 10)
        console.log(e.currentTarget.innerText)
      })
    }
    // priceSuggestionElements.forEach((item) => {

    // })
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
