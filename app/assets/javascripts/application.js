//= require jquery
//= require_tree
//= require bootstrap

import "bootstrap"

import "bootstrap/dist/css/bootstrap.min.css"
import $ from 'jquery'
import "./datepicker"  // Ensure you import the datepicker script
import "@popperjs/core"  // Ensure Popper.js is available
import * as Popper from '@popperjs/core'

document.addEventListener('DOMContentLoaded', () => {
  console.log('Bonne Nouvelle, ça fonctionne!');
});

