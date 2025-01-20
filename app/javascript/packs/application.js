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

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { Turbo } from "@hotwired/turbo-rails"
import { helloController } from "controllers/hello_controller"
import signup from 'controllers/signup';

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// app/javascript/packs/application.js
// import "core-js/stable";
// import "regenerator-runtime/runtime";
// import "stylesheets/application"

// // Your custom JavaScript can go here
// console.log("Hello, Rails with Webpacker!");

// import  from 'jquery';
// global. = global.jQuery = ;

// // Any other imports or libraries
// import { form } from 'utils/form';
