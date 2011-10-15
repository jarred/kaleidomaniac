kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.PostView = Backbone.View.extend
  margin: 6
  
  initialize: (options) ->
    _.bindAll @, 'imageLoaded'
    @model = new Backbone.Model kaleido.data.posts[0]
    _.each @model.get('tags'), (tag) =>
      $('body').addClass(tag)
      @checkForNsfw() if tag == 'nsfw'
      return
    @$el = $(@el)
    @img = new Image()
    @img.src = @$el.data('image')
    @$el.append("<div class=\"image-load\"></div>")
    $(@img).load @imageLoaded
    @$('.image-load').append(@img)
    return
    
  imageLoaded: () ->
    @width = $(@img).width()
    @height = $(@img).height()
    @$('.image-load').remove()
    @render()
    return
    
  render: () ->
    across = Math.ceil $(window).width()/(@width-@margin)
    down = Math.ceil $(window).height()/(@height-@margin)
    row = 0

    while row < down
      column = 0
      while column < across
        cell = new kaleido.views.CellView
          width: @width-@margin
          height: @height-@margin
          margin: @margin
          xIndex: column
          yIndex: row
          className: 'cell'
          image: @img.src
        @$el.append(cell.el)
        column++
      row++
      
    $('#preloader').animate
      opacity: 0
    , 300, () =>
      $('#preloader').addClass('hide')
      return
      
    if kaleido.data.previousPost != ''
      url = kaleido.data.previousPost
    else
      url = '/archive'
    @$el.append("<a class=\"link\" href=\"#{url}\"></a>")
    return
    
  checkForNsfw: () ->
    cookie = JSON.parse $.cookie kaleido.data.cookieKey
    console.log cookie
    if cookie == null
      # show nsfw warning...
      $('#nsfw').removeClass('hide')
    return