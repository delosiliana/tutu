$(document).on('turbolinks:load', function () {
  $('.new_carriage').change('turbolinks:change', function () {
    var carriage_type = $(this).find('#carriage_type').val();
    var upper_seats = $('#carriage_upper_seats').show();
    var lower_seats = $('#carriage_lower_seats').show();
    var side_upper_seats = $('#carriage_side_upper_seats').show();
    var side_lower_seats = $('#carriage_side_lower_seats').show();
    var sitting_seats = $('#carriage_sitting_seats').show();

    if (carriage_type =="CoupeCarriage") {
      console.log('выбрано купе');
      side_upper_seats.hide();
      $('label[for="carriage_side_upper_seats"]').hide();
      side_lower_seats.hide();
      $('label[for="carriage_side_lower_seats"]').hide();
      sitting_seats.hide();
      $('label[for="carriage_sitting_seats"]').hide();
    }
    if (carriage_type == 'EconomyCarriage') {
      console.log('выбран эконом');
      sitting_seats.hide();
      $('label[for="carriage_sitting_seats"]').hide();
    }
    if (carriage_type == 'LuxuryCarriage') {
      console.log('выбран люкс');
      upper_seats.hide();
      $('label[for="carriage_upper_seats"]').hide();
      side_upper_seats.hide();
      $('label[for="carriage_side_upper_seats"]').hide();
      side_lower_seats.hide();
      $('label[for="carriage_side_lower_seats"]').hide();
      sitting_seats.hide();
      $('label[for="carriage_sitting_seats"]').hide();
    }
    if (carriage_type == 'SedentaryCarriage') {
      console.log('выбрано сидячий');
      upper_seats.hide();
      $('label[for="carriage_upper_seats"]').hide();
      lower_seats.hide();
      $('label[for="carriage_lower_seats"]').hide();
      side_upper_seats.hide();
      $('label[for="carriage_side_upper_seats"]').hide();
      side_lower_seats.hide();
      $('label[for="carriage_side_lower_seats"]').hide();
    }
  });
});
