import slickCarousel from 'slick-carousel';

const initSlickCarousel = () => {
  $(document).ready(function(){
    $('.carousel-scroller').slick({
    //attribute: value;
    });
  });
};

export { initSlickCarousel };
