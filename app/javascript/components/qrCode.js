const qrCode = () => {
  
  let qrcode = document.getElementById('qr-code')
  let svgcode = document.getElementById('svg-code')
  if (qrcode && svgcode){
    qrcode.addEventListener('click', (e) => {
      svgcode.classList.toggle('hidden')
  
    })
  }
}

export {qrCode}