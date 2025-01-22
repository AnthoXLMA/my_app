/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')
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

