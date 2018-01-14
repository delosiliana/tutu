$(document).ready(function() {
  $('.search_form').submit(function() {
    var start_station;
    var finish_station;

    start_station = $(this).find('#start_station');
    finish_station = $(this).find('#finish_station');

    if (start_station.val() == finish_station.val()) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});
