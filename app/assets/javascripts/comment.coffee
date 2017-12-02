document.addEventListener "turbolinks:load", ->
  $(document).on "keydown", "#comment-form", (event) ->
    if event.keyCode == 13 && !event.shiftKey
      event.preventDefault()
      $(".comment-submit").click().delay(100)
