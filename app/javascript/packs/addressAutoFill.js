$(document).on('turbolinks:load', function() {
  $("#user_address_auto_fill").click(function() {
    AjaxZip3.zip2addr('user[postal_code]', '', 'user[address]', 'user[address]');
  });
});

$(document).on('turbolinks:load', function() {
  $("#company_address_auto_fill").click(function() {
    AjaxZip3.zip2addr('company[postal_code]', '', 'company[address]', 'company[address]');
  });
});