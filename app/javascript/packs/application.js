// app/javascript/packs/application.js
// import React from 'react'
// import ReactDOM from 'react-dom'
// import 'stylesheets/application'

// // This is for testing the React setup
// import HelloReact from 'components/hello_react'
// import HelloWorld from 'components/hello_world'

// document.addEventListener('turbolinks:load', () => {
//   ReactDOM.render(
//     <HelloWorld />,
//     document.getElementById('react-root')
//   )
// })


// app/javascript/packs/application.js
import "core-js/stable";
import "regenerator-runtime/runtime";
import "stylesheets/application"

// Your custom JavaScript can go here
console.log("Hello, Rails with Webpacker!");

import $ from 'jquery';
global.$ = global.jQuery = $;

// Any other imports or libraries
import { form } from 'utils/form';
import SomeComponent from 'components/some_component';
