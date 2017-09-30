$(document).on "turbolinks:load", ->
  $(document).on "keydown", ".materialize-textarea", (event) ->
    if event.keyCode == 13 && !event.shiftKey
      event.preventDefault()
      $(".comment-submit").click().delay(100)
