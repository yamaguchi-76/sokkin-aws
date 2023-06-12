$(document).on('turbolinks:load', function() {
  const menu = $('.basicInfoMenu__item');
  const simpleContent = $('.simpleContent');
  menu.on('click', function() {
    const index = menu.index(this);
    const position = simpleContent.eq(index).offset().top;

    $('body,html').animate({
      scrollTop: position,
    }, 400, 'swing', function() {
      menu.not(`:eq(${index})`).removeClass('active');
      menu.eq(index).addClass('active');
    });
  });
});
