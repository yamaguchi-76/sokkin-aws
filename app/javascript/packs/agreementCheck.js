$(document).on('turbolinks:load', function() {
  const element = $('#confirm');

  $('#user_agreement').on('click', function() {
    if (!$(this).prop('checked')) {
      element.attr('disabled', true);
    } else {
      element.attr('disabled', false);
    }
  });
});
