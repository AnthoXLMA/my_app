// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/javascript/application.js
import React from "react";
import ReactDOM from "react-dom";
import App from "./App"; // Import the React component

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.getElementById('react-root')
  );
});
