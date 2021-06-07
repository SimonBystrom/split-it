import Glide from '@glidejs/glide'

new Glide('.glide', {
  type: 'slider',
  startAt: 0,
  perView: 6,
  width: 90,
  bound: true,
}).mount();

export {Glide};
