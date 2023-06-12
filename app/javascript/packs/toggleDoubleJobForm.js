$(document).on('turbolinks:load', function() {
  const formModalGroup = $('.formModalGroup');
  const radioButton = $('input[name="user[second_job_experience]"]')
  const initialCheckedValue = $('input[name="user[second_job_experience]"]:checked').val() === "true"
  formModalGroup.toggle(initialCheckedValue);

  radioButton.change(() => {
    const changedCheckedValue = $('input[name="user[second_job_experience]"]:checked').val() === "true"
    formModalGroup.toggle(changedCheckedValue);
  });
})
