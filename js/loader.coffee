kaleido = window.Kaleido ||= {}
kaleido.app = {}

require.config
  baseUrl: 'http://localhost:4104/js/'
  # baseUrl: 'http://jarred.github.com/kaleidomaniac/js/'
  # urlArgs: "bust=#{new Date().getTime()}"
  
# if window.location.pathname is '/'
#   window.location = "/post/#{kaleido.data.posts[0]}"
#   return
  
require ['jquery.min', 'underscore-min'], () ->
  require ['backbone-min', 'jquery.easing'], () ->
    require ['views.cell', 'views.post', 'views.app', 'main'], () ->
      kaleido.app.init()      
      return
    return
  return