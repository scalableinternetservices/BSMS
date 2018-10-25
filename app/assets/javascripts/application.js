// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_self
//= require_tree .
//= require bootstrap-datepicker

function populateEndDate() {
  var date2 = $('#dateStart').datepicker('getDate');
  date2.setDate(date2.getDate() + 1);
  $('#dateEnd').datepicker('setDate', date2);
  $("#dateEnd").datepicker("option", "minDate", date2);
}

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    $("#dateStart").datepicker({
      dateFormat: "mm/dd/yy",
      minDate: 0,
      onSelect: function(date) {
        populateEndDate();
      }
    });
    $('#dateEnd').datepicker({
      dateFormat: "mm/dd/yy",
      minDate: 1,
      onClose: function() {
        var dt1 = $('#dateStart').datepicker('getDate');
        var dt2 = $('#dateEnd').datepicker('getDate');
        if (dt2 <= dt1) {
          var minDate = $('#dateEnd').datepicker('option', 'minDate');
          $('#dateEnd').datepicker('setDate', minDate);
        }
      }
    });
  });
});
