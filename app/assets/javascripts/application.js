//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function(){
  $('.datepicker').datepicker({
    todayHighlight: true,
    format: "yyyy-mm-dd"
  });
});
