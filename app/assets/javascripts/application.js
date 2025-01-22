//= require jquery
//= require_tree
//= require bootstrap
//= require jquery-3.6.0.min
//= require jquery_ujs
//= require_tree .


// import { createPopper } from '@popperjs/core';
import 'bootstrap/dist/js/bootstrap.bundle';
global.$ = global.jQuery = $; // Ensure it's available globally
import $ from 'jquery'
import "./datepicker"  // Ensure you import the datepicker script

$(document).addEventListener('DOMContentLoaded', () => {
  console.log('Javascript est bien connecté');
});

