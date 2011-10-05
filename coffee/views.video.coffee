kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.VideoView = Backbone.View.extend
  # http://code.google.com/apis/youtube/js_api_reference.html
  initialize: (options) ->
    return