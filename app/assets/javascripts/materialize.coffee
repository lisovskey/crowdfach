initialize_materialize = ->
  M.updateTextFields()
  Waves.displayEffect()
  M.Sidenav.init document.querySelector ".sidenav"
  for dropdown in document.querySelectorAll ".dropdown-trigger"
    M.Dropdown.init dropdown
  for datepicker in document.querySelectorAll ".datepicker"
    M.Datepicker.init datepicker
  for select in document.querySelectorAll "select"
    M.FormSelect.init select      
  for tooltip in document.querySelectorAll ".tooltipped"
    M.Tooltip.init tooltip
  for parallax in document.querySelectorAll ".parallax"
    M.Parallax.init parallax
  for modal in document.querySelectorAll ".modal"
    M.Modal.init modal
  for textarea in document.querySelectorAll ".materialize-textarea"
    M.textareaAutoResize textarea

document.addEventListener "turbolinks:load", initialize_materialize
