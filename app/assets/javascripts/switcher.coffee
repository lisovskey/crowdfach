document.addEventListener "turbolinks:load", ->
  $("#theme").on "click", ->
    if $(@).prop "checked"
      Cookies.set "theme", "true"
      $(@).attr "checked", true
      $("body").addClass("dark-theme").removeClass("light-theme")
    else
      Cookies.set "theme", "false"
      $(@).attr "checked", null
      $("body").addClass("light-theme").removeClass("dark-theme")
