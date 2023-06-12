$(document).on('turbolinks:load', function() {
  const list = $('.propositionsList');
  const tab = $('.generalTab__item');

  $('.propositionsDetail__title').not('.default').hide();

  tab.on('click', function () {
    tab.children('.text').removeClass('active');
    $(this).children('.text').addClass('active');

    list.show();
    $('.propositionsDetail__title').hide();
    $('.propositionsDetail__title.default').remove();

    if ($(this).hasClass('pending')) {
      $('.propositionsDetail__title.pending').show();
      list.not('.pending').hide();
    } else if ($(this).hasClass('contracting')) {
      $('.propositionsDetail__title.contracting').show();
      list.not('.contracting').hide();
    } else if ($(this).hasClass('rejected')) {
      $('.propositionsDetail__title.rejected').show();
      list.not('.rejected').hide();
    }
  });
});
