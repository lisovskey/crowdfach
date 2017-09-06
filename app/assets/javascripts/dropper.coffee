document.addEventListener "turbolinks:load", ->
  $(".language-point").click ->
    switch @.text
      when "English"
        Cookies.set "language", "en"
        $("#language").text "English"
      when "Russian"
        Cookies.set "language", "ru"
        $("#language").text "Russian"
