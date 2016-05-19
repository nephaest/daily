$(document).ready(function() {
    var start_date = new Date ('1900-06-21');
    var end_date = new Date('2000-05-24');


  $('.birth_date').datepicker({

    startDate: start_date,
    endDate: end_date,
    format: "dd/mm/yyyy",

    });


    var start_date_2 = new Date ('1900-06-21');
    var end_date_2 = new Date('2016-12-24');
  $('.creation_date').datepicker({

    startDate: start_date_2,
    endDate: end_date_2,
    format: "dd/mm/yyyy",

    });


  $('.search_date').datepicker({
    format: "dd/mm/yyyy",
    });

})
