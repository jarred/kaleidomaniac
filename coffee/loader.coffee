kaleido = window.Kaleido ||= {}
kaleido.app = {}

require.config
  baseUrl: 'http://localhost:4104/js/'
  # baseUrl: 'http://jarred.github.com/kaleidomaniac/js/'
  # urlArgs: "bust=#{new Date().getTime()}"
  
require ['jquery.min', 'underscore-min'], () ->
  require ['backbone-min', 'jquery.easing', 'jquery.cookie.min'], () ->
    require ['views.cell', 'views.post', 'views.app', 'views.nsfw', 'views.video', 'main'], () ->
      kaleido.app.init()      
      return
    return
  return