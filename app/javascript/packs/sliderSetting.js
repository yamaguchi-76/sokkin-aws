$(document).on('turbolinks:load', function() {
  $('.jobListCarousel').slick({
    centerMode: true,
    arrows: true,
    variableWidth: true,
    slidesToShow: 1,
    responsive:[
      {
        breakpoint: 768,
        settings: {
          variableWidth: false,
          slidesToShow: 1,
          centerPadding: '',
          slidesToScroll: 1
        }
      },
    ]
  });
});
