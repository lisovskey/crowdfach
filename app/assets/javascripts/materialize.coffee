initialize_materialize = ->
    # M.updateTextFields()
    Waves.displayEffect()
    for sidenav in document.querySelectorAll('.sidenav')
      new M.Sidenav(sidenav)
    for dropdown in document.querySelectorAll('.dropdown-trigger')
      new M.Dropdown(dropdown)
    for datepicker in document.querySelectorAll('.datepicker')
      new M.Datepicker(datepicker)
    for select in document.querySelectorAll('select')
      new M.Select(select)      
    for tooltip in document.querySelectorAll('.tooltipped')
      new M.Tooltip(tooltip)
    for parallax in document.querySelectorAll('.parallax')
      new M.Parallax(parallax)
    for modal in document.querySelectorAll('.modal')
      new M.Modal(modal)
    $('#comment-form').trigger('autoresize');

document.addEventListener "turbolinks:load", initialize_materialize
