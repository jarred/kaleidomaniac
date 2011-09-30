kelido = window.Kelido ||= {}
kelido.app = {}

# get libs...
require ['jquery.min', 'underscore-min'], () ->
	require ['backbone-min', 'views.cell', 'views.post', 'main'], () ->
		kelido.app.init()
		return
	return