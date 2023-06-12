$(document).on('turbolinks:load', function() {
  const location = document.location.search;
  const monthPosition = location.indexOf('month');
  const yearPosition = location.indexOf('&');
  const m = location.substring(monthPosition, yearPosition).replace('month=', '') - 1;

  const tab = $('.monthTab__item');
  tab.eq(m).not().removeClass('now').addClass('common');
  tab.eq(m).removeClass('common').addClass('now');
});
