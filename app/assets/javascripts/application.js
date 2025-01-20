// app/assets/javascripts/application.js
//= require rails-ujs
document.addEventListener("DOMContentLoaded", function() {
  const checkbox = document.getElementById('newsletter-checkbox');
  const optionsDiv = document.getElementById('newsletter-options');

  // Fonction qui affiche ou masque les options en fonction de l'état de la checkbox
  checkbox.addEventListener('change', function() {
    if (checkbox.checked) {
      optionsDiv.style.display = 'block'; // Affiche le menu déroulant
    } else {
      optionsDiv.style.display = 'none'; // Masque le menu déroulant
    }
  });
});


// app/javascript/packs/application.js
import "core-js/stable";
import "regenerator-runtime/runtime";

// Your custom JavaScript can go here
console.log("Hello, Rails with Webpacker!");

import $ from 'jquery';
global.$ = global.jQuery = $;

// Any other imports or libraries
import { form } from './form';
import SomeComponent from 'components/some_component';

