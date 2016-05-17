$(document).ready(function() {

  var start_date = new Date ('1900-06-21');
  var end_date = new Date('2000-12-24');

  $('.datepicker').datepicker({

    startDate: start_date,
    endDate: end_date,
    format: "dd/mm/yyyy",

    });
})
