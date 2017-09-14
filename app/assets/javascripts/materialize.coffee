document.addEventListener "turbolinks:load", Waves.displayEffect
document.addEventListener "turbolinks:load", Materialize.updateTextFields
document.addEventListener "turbolinks:load", -> $(".button-collapse").sideNav()
document.addEventListener "turbolinks:load", -> $('.datepicker').pickadate()
document.addEventListener "turbolinks:load", -> $('select').material_select()
