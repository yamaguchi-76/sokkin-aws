$(document).on('turbolinks:load', function() {
  const sideMenu = $('.sideMenu');

  const toggleFixedClass = () => {
    if ($(window).scrollTop() > 60) {
      sideMenu.addClass('fixed');
    } else {
      sideMenu.removeClass('fixed');
    }
  }

  $(window).scroll(() => {
    toggleFixedClass();
  });

  $(window).resize(() => {
    toggleFixedClass();

    if ($(window).width() < 768) {
      sideMenu.removeClass('fixed');
    }
  });
});
