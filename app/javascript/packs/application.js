// app/javascript/packs/application.js
import React from 'react'
import ReactDOM from 'react-dom'
import 'stylesheets/application'

// This is for testing the React setup
import HelloReact from './hello_react'
import HelloWorld from 'components/hello_world'

ReactDOM.render(
  <HelloReact />,
  <HelloWorld />,
  document.getElementById('react-root')
)
