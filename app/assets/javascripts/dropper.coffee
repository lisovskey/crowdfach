$(document).on "turbolinks:load", ->
  $(".language-point").on "click", ->
    switch @.text
      when "English", "Английский"
        Cookies.set "language", "en"
      when "Russian", "Русский"
        Cookies.set "language", "ru"
