import $ from 'jquery'
import { datetimepicker } from 'eonasdan-bootstrap-datetimepicker'



$('document').ready(function(){

var availableDatesRuby = JSON.parse(document.getElementById("avails").dataset.avails)
var availableDatesJS = []
availableDatesRuby.forEach((date) => {
  availableDatesJS.push(moment(new Date(date)))
})

console.log(availableDatesJS)

  $(function () {
    $('#datetimepicker1').datetimepicker({
                 format: 'DD/MM/YYYY',
                 minDate: new Date(),
                 enabledDates: availableDatesJS
           });
  });
});

