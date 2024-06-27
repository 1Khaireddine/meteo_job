

// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "turbolinks"
import "./controllers"
import * as bootstrap from "bootstrap"

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

document.addEventListener("turbo:load", function () {
  setTimeout(function () {
    $("#notice-message").slideUp()
  }, 5000)
});
