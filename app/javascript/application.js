// app/assets/javascripts/application.js

//= require jquery
//= require rails-ujs
//= require_tree .
import "core-js/stable";
import "regenerator-runtime/runtime";

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import HelloController from "./hello_controller"
import signup from './signup';

// Your custom JavaScript can go here
console.log("Hello, Rails with Webpacker!");

// https://www.linkedin.com/in/atakangk/
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function() {
  if (animating) return false;
  animating = true;

  var current_fs = $(this).parent();  // Correctly reference the clicked element using `$(this)`
  var next_fs = $(this).parent().next();  // Again, ensure you use jQuery to select the next fieldset

  // Activate next step on progress bar using the index of next_fs
  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

  // Show the next fieldset
  next_fs.show();

  // Hide the current fieldset with animation
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      // As the opacity of current_fs reduces to 0 (stored in "now")
      var scale = 1 - (1 - now) * 0.2;  // Scale down current_fs to 80%
      var left = (now * 50) + "%";  // Move next_fs from the right
      var opacity = 1 - now;  // Increase opacity of next_fs as it moves in

      current_fs.css({
        'transform': 'scale(' + scale + ')',
        'position': 'absolute'
      });
      next_fs.css({'left': left, 'opacity': opacity});
    },
    duration: 800,
    complete: function() {
      current_fs.hide();
      animating = false;
    },
    easing: 'easeInOutBack'  // Easing function for smooth animation
  });
});

(".previous").click(function(){
  if(animating) return false;
  animating = true;

  current_fs = (this).parent();
  previous_fs = (this).parent().prev();

  //de-activate current step on progressbar
  ("#progressbar li").eq(("fieldset").index(current_fs)).removeClass("active");

  //show the previous fieldset
  previous_fs.show();
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale previous_fs from 80% to 100%
      scale = 0.8 + (1 - now) * 0.2;
      //2. take current_fs to the right(50%) - from 0%
      left = ((1-now) * 50)+"%";
      //3. increase opacity of previous_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({'left': left});
      previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    },
    //this comes from the custom easing plugin
    easing: 'easeInOutBack'
  });
});
// document.addEventListener("DOMContentLoaded", function() {
//   const checkbox = document.getElementById('newsletter-checkbox');
//   const optionsDiv = document.getElementById('newsletter-options');

//   // Fonction qui affiche ou masque les options en fonction de l'état de la checkbox
//   checkbox.addEventListener('change', function() {
//     if (checkbox.checked) {
//       optionsDiv.style.display = 'block'; // Affiche le menu déroulant
//     } else {
//       optionsDiv.style.display = 'none'; // Masque le menu déroulant
//     }
//   });
// });

// (document).on('turbolinks:load', function() {
//   // Toggle dropdown when checkbox is clicked
//   ('.dance-checkbox input').change(function() {
//     var dropdown = (this).next('.dance-dropdown');
//     if (this.checked) {
//       dropdown.show();
//     } else {
//       dropdown.hide();
//     }
//   });
// });
