kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.NsfwView = Backbone.View.extend
  events:
    'click a.always-show': 'setNSFWcookie'
    
  initialize: (options) ->
    @$el = $(@el)
    if kaleido.data.previousPost != ''
      nextUrl = kaleido.data.previousPost
    else
      nextUrl = '/archive'
    @$('a.skip').attr('href', nextUrl)
    return
    
  setNSFWcookie: (e) ->
    e.preventDefault()
    @$el.addClass('hide')
    return