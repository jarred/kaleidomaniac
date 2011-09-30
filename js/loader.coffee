kelido = window.Kelido ||= {}
kelido.app = {}

require.config
  # baseUrl: 'http://localhost:4104/js/'
  baseUrl: 'http://jarred.github.com/kaleidomaniac/js/'

require ['jquery.min', 'underscore-min'], () ->
  if window.location.pathname is '/'
    window.location = $('.post').data('permalink')
    return
  else
  	require ['backbone-min', 'views.cell', 'views.post', 'main'], () ->
  		kelido.app.init()
  		return
  	return