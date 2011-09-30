kelido = window.Kelido ||= {}
kelido.app = {}

require ['jquery.min', 'underscore-min'], () ->
  if window.location.pathname is '/'
    window.location = $('.post').data('permalink')
    return
  else
  	require ['backbone-min', 'views.cell', 'views.post', 'main'], () ->
  		kelido.app.init()
  		return
  	return