//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function(){
  $('.datepicker').datepicker({
    todayHighlight: true,
    dateFormat: 'dd-mm-yy'
  });
});
