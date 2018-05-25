import $ from 'jquery'
import { datetimepicker } from 'eonasdan-bootstrap-datetimepicker'



$('document').ready(function(){

  $(function () {
    $('#datetimepicker2').datetimepicker({
                 format: 'DD/MM/YYYY',
                 minDate: new Date(),
           });
  });
});

