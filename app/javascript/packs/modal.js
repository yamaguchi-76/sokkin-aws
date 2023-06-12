$(document).on('turbolinks:load', function() {
  $('.modalOpen').on('click',function(){
    $('.modalContainer').addClass('modalActive');
  });

  $('.modalClose').on('click',function(){
    $('.modalContainer').removeClass('modalActive');
  });

  $('.modalWrapper').on('click', function(e){
    if(!$(e.target).closest('.modal').length) {
      $('.modalContainer').removeClass('modalActive');
    }
  });
});
