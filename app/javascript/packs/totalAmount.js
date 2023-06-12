$(document).on('turbolinks:load', function() {
  const times = $('.attendanceWorkingTime');

  times.find('.attendanceWorkingTime__number').change(function() {
    const hours = Number($(this).val());
    const objectId = $(this).attr('id').split('_')[2]
    const price = objectId === undefined ? Number(times.find('.price').text().replace(',', '')) : Number(times.find(`.price-${objectId}`).text().replace(',', ''))
    const amount = price * hours;
    const amountClass = objectId === undefined ? times.find('.amount') : times.find(`.amount-${objectId}`)
    amountClass.html(amount.toLocaleString());
  });

  const yen = $('.conversionYen');

  for (let n = 0; n < yen.length; n++) {
    yen.eq(n).text((Number(yen.eq(n).text()).toLocaleString()));
  }
});
