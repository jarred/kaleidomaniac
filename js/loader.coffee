kelido = window.Kelido ||= {}
kelido.app = {}

require.config
  # baseUrl: 'http://localhost:4104/js/'
  baseUrl: 'http://jarred.github.com/kaleidomaniac/js/'
  # urlArgs: "bust=#{new Date().getTime()}"
  
# if window.location.pathname is '/'
#   window.location = "/post/#{kelido.data.posts[0]}"
#   return
  
require ['jquery.min', 'underscore-min'], () ->
  require ['backbone-min', 'views.cell', 'views.post', 'main'], () ->
    kelido.app.init()
    return
  return