document.addEventListener "turbolinks:load", ->
  $("#theme").click ->
    if $(@).prop "checked"
      Cookies.set "theme", "true"
      $(@).attr "checked", true
      $("body").attr "class", "dark-theme"
    else
      Cookies.set "theme", "false"
      $(@).attr "checked", null
      $("body").attr "class", "light-theme"
