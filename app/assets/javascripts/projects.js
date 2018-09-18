//= require moment
//= require bootstrap-datetimepicker
$(window).load(function() {
  $(function () {
    $('#datetimepicker1').datetimepicker({
      format: "YYYY-MM-DD HH:mm"
    });
  });
});