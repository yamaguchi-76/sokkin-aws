$(document).on('turbolinks:load', function() {
  $("#submit-button").prop("disabled", true);
  const checkbox = $('input[name="scout[user_id][]"]');

  checkbox.on('change', function() {
    if ($(".user-checkbox:checked").length > 0) {
      $("#submit-button").prop("disabled", false);
    } else {
      $("#submit-button").prop("disabled", true);
    };
  });
});
