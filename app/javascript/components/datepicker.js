import $ from 'jquery'
import { datetimepicker } from 'eonasdan-bootstrap-datetimepicker'



$('document').ready(function(){

var a = $('#avails')
var a_object = a.get()[0]
console.log(a_object)
// console.log(typeof a_object)

  $(function () {
    $('#datetimepicker1').datetimepicker({
                 format: 'DD/MM/YYYY',
                 disabledDates: [
                     moment("05/24/2018"),
                     ]
           });
  });
});

