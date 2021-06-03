
const newSplitFormShow = () => {
  let expanded = document.getElementById('new-split-form')
  let button = document.getElementById('new-split-button')
  let text = document.getElementById('new-split-button-text')
    button.addEventListener('click', (e) => {
      if(expanded.style.height === '320px') {
        expanded.style.opacity = '0';
        expanded.style.height = '0px';
        e.currentTarget.style.width = '100%'
        e.currentTarget.style.height = '56px'
        text.innerHTML = ''
        setTimeout(()=> {
           text.innerHTML = 'New Split'
        }, 300)



      } else {
        setTimeout(()=>{
          expanded.style.opacity = '1';
        }, 190)

        expanded.style.height = '320px';
        e.currentTarget.style.width = '50px'
        e.currentTarget.style.height = '50px'
        text.innerHTML = ''
        setTimeout(()=> {
          text.innerHTML = 'X'
        }, 300)
      }
  })
}

export { newSplitFormShow }
