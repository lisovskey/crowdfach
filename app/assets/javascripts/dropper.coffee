document.addEventListener "turbolinks:load", ->
  $(".language-point").click ->
    switch @.text
      when "English", "Английский"
        Cookies.set "language", "en"
      when "Russian", "Русский"
        Cookies.set "language", "ru"
