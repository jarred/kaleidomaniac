kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.AppView = Backbone.View.extend
  events:
    'click a': 'goingSomewhere'

  speed: 200
  ease: 'easeOutExpo'

  initialize: (options) ->
    $(window).bind 'load', @removePreloader		
    return

  goingSomewhere: (e) ->
    console.log 'goingSomewhere?'
    if e.target.nodeName != 'A'
      $el = $(e.target).parents('a')
    else
      $el = $(e.target)
    return if $el.attr('target') == '_blank'
    return if $el.attr('href') == '#'
    return if e.metaKey or e.shiftKey or e.ctrlKey
    # return if $el.attr('href').indexOf('http://') >= 0
    return if $el.attr('href').indexOf('mailto:') >= 0
    e.preventDefault()
    $('#preloader').removeClass('hide').animate
      opacity: 1
    , @speed, @ease, () =>
      window.location = $el.attr('href')
      return
    return

  removePreloader: (e) ->
    $('#preloader').animate
      opacity: 0
    , @speed, @ease, () =>
      $('#preloader').addClass('hide')
      return
    return