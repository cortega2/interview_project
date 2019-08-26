// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.onload = function () {
  input = document.getElementById('year-form')
  input.addEventListener("input", function(event) {
    value = event.target.value
    radios = document.getElementById('radios')

    if (value > 1990) {
      radios.style.display = 'block'
    }
    else{
      radios.style.display = 'none'
    }
  })
}

