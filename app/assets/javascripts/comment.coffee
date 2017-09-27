$(document).on "turbolinks:load", ->
  $("#comment_body").on "keydown", (event) ->
    if event.keyCode == 13 && !event.shiftKey
      event.preventDefault()
      $(".comment-submit").click()
