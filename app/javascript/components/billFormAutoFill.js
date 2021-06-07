const billFormAutoFill = () => {
  if (document.getElementById('bill_photo')){
    let input = document.getElementById('bill_photo')
    input.addEventListener('change', (e) => {
      let data = new FormData()
      data.append('photo', input.files[0])
      fetch('/api/v1/scan', {method: 'POST', body: data})
      .then(res => res.json())
      .then((data) => {
        console.log(data)
      })
    })
  }
}

export {billFormAutoFill}
