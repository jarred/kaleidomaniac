kaleido = window.kaleido ||= {}
kaleido.views ||= {}

kaleido.views.PostView = Backbone.View.extend
  margin: 10
  
  events:
    'click img': 'nextPost'

  initialize: (options) ->
    _.bindAll @, 'imageLoaded'
    @$el = $(@el)
    @img = new Image()
    @img.src = @$el.data('image')
    @$el.append("<div class=\"image-load\"></p>")
    $(@img).load @imageLoaded
    @$('.image-load').append(@img)
    # @$('.image-load').fadeTo(0, 0)
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
    return    
    
  nextPost: (e) ->
    e.preventDefault()
    if kaleido.data.nextPost?
      window.location = kaleido.data.nextPost
    else
      window.location = '/archive'
    return