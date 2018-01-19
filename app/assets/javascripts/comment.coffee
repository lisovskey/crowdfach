document.addEventListener "turbolinks:load", ->
  formbody = document.querySelector "#comment-form"
  if formbody
    formbody.addEventListener "keydown", (event) ->
      if event.keyCode == 13 and !event.shiftKey
        event.preventDefault()
        form = document.getElementById "new_comment"
        if form.checkValidity()
          form.submit()
