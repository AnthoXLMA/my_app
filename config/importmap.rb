# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "react", to: "react.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
# config/importmap.rb

pin "react", to: "https://cdn.jsdelivr.net/npm/react@17/umd/react.production.min.js"
pin "react-dom", to: "https://cdn.jsdelivr.net/npm/react-dom@17/umd/react-dom.production.min.js"

pin "react-dom", to: "react-dom.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
