// app/assets/javascripts/application.js

//= require jquery
//= require rails-ujs
//= require_tree .

// app/javascript/packs/application.js
import "core-js/stable";
import "regenerator-runtime/runtime";

// Your custom JavaScript can go here
console.log("Hello, Rails with Webpacker!");

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


(document).on('turbolinks:load', function() {
  // Toggle dropdown when checkbox is clicked
  ('.dance-checkbox input').change(function() {
    var dropdown = $(this).next('.dance-dropdown');
    if (this.checked) {
      dropdown.show();
    } else {
      dropdown.hide();
    }
  });
});
