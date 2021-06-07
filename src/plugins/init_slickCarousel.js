import slickCarousel from 'slick-carousel';

const initSlickCarousel = () => {
  $(document).ready(function(){
    $('.carousel-scroller').slick({
    //attribute: value;
    // slide: document.querySelectorAll(".carousel-group");
    variableWidth: true,
    mobileFirst: true,
    slidesToShow: 8,
    });
  });
};

export { initSlickCarousel };
