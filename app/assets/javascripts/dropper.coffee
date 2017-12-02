document.addEventListener "turbolinks:load", ->
  # a = getElementById 'kek'
  # a.addEventListener 'click', go
  $(".language-point").on "click", ->
    switch @.text
      when "English", "Английский"
        Cookies.set "language", "en"
      when "Russian", "Русский"
        Cookies.set "language", "ru"
