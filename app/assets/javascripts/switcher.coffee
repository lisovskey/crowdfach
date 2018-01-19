document.addEventListener "turbolinks:load", ->
  element = document.getElementById "theme"
  element.addEventListener "click", ->
    if element.checked
      Cookies.set "theme", "true"
      element.checked = true
      document.body.className = "dark-theme"
    else
      Cookies.set "theme", "false"
      element.checked = false
      document.body.className = "light-theme"
