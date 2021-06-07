const qrCode = () => {
  
  let qrcode = document.getElementById('qr-code')
  let svgcode = document.getElementById('svg-code')
  if (qrcode && svgcode){
    qrcode.addEventListener('click', (e) => {
      if (svgcode.style.height == '0px') {
        svgcode.style.height = '196px'
      } else {
        svgcode.style.height = '0px'
      }
    })
  }
}
export {qrCode}