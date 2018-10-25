$ ->
  $('#startDate').datepicker
    dateFormat: 'dd/mm/yy'
    minDate: 'dateToday'
  $('#endDate').datepicker
    dateFormat: 'dd/mm/yy'
    minDate: $('#startDate').datepicker('getDate')
  return
