initialize_materialize = ->
  Waves.displayEffect()
  M.AutoInit()

document.addEventListener "turbolinks:load", initialize_materialize
