// app/javascript/packs/application.js
import React from 'react'
import ReactDOM from 'react-dom'
import 'stylesheets/application'

// This is for testing the React setup
import HelloReact from 'components/hello_react'
import HelloWorld from 'components/hello_world'

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <HelloWorld />,
    document.getElementById('react-root')
  )
})
