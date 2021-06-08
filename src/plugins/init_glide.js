import Glide from '@glidejs/glide'

const initGlide = () => {
  if(document.querySelector('.glide')){
    return new Glide('.glide', {
      type: 'slider',
      startAt: 0,
      perView: 7,
      peek: 0,
      gap: 8,
    }).mount();
  }
}


export {initGlide};
