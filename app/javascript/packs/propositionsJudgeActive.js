$(document).on('turbolinks:load', function() {
  const normalList = $('#normal-proposition-list');
  const scoutList = $('#scout-proposition-list');
  const favoriteList = $('#favorite-proposition-list');

  const tab = $('.generalTab__item');
  const favoriteTab = $('.generalTab__item.favorite');
  const scoutTab = $('.generalTab__item.scout');

  if (location.hash.includes('favorite')) {
    favoriteTab.children('.text').addClass('active');
    favoriteTab.not('.favorite').hide();

    normalList.hide();
    scoutList.hide();
    favoriteList.show();
  } else if (location.hash.includes('scout')) {
    scoutTab.children('.text').addClass('active');
    scoutTab.not('.favorite').hide();

    normalList.hide();
    scoutList.show();
    favoriteList.hide();
  } else {
    normalList.show();
    scoutList.hide();
    favoriteList.hide();
  }

  tab.on('click', function () {
    tab.children('.text').removeClass('active');
    $(this).children('.text').addClass('active');

    if ($(this).hasClass('favorite')) {
      normalList.hide();
      scoutList.hide();
      favoriteList.show();
    } else if ($(this).hasClass('scout')) {
      normalList.hide();
      scoutList.show();
      favoriteList.hide();
    } else {
      normalList.show();
      scoutList.hide();
      favoriteList.hide();
    }
  });
});
