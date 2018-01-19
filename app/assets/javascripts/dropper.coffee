document.addEventListener "turbolinks:load", ->
  point = document.querySelector ".language-point"
  point.addEventListener "click", ->
    switch point.text
      when "English", "Английский"
        Cookies.set "language", "en"
      when "Russian", "Русский"
        Cookies.set "language", "ru"
