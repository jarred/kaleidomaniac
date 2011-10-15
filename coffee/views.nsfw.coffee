kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.NsfwView = Backbone.View.extend
  events:
    'click a.always-show': 'setNSFWcookie'
    
  initialize: (options) ->
    # add content after load so it isn't indexed...
    @$el = $(@el)
    @$el.html("<div class=\"message\">
 	   <h4>This post is a bit sexy (#nsfw).</h4>
 	   <p><a href=\"#\" class=\"always-show\">Always show these</a> or <a href=\"#\" class=\"skip\">Skip to the next post</a>.</p>
 	 </div>")
    if kaleido.data.previousPost != ''
      nextUrl = kaleido.data.previousPost
    else
      nextUrl = '/archive'
    @$('a.skip').attr('href', nextUrl)
    return
    
  setNSFWcookie: (e) ->
    e.preventDefault()
    @$el.addClass('hide')
    # set cookie
    cookie = 
      set: new Date()
    $.cookie kaleido.data.cookieKey, JSON.stringify(cookie), 
      expires: 14,
      domain: window.location.host,
      path: '/'
    return