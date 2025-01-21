(document).ready(function() {
  // Initialize datepicker for all elements with the class 'datepicker'
  ('.datepicker').datepicker({
    format: 'mm/dd/yyyy', // Set your preferred date format
    todayBtn: 'linked',  // Highlight the current date
    autoclose: true  // Close the datepicker when a date is selected
  });
});
