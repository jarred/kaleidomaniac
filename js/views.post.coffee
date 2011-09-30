kelido = window.Kelido ||= {}
kelido.views ||= {}

kelido.views.PostView = Backbone.View.extend
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
        cell = new kelido.views.CellView
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
    # window.location.pathname = '/page/' + Math.ceil(Math.random()*kelido.data.totalPages)
    window.location = @$el.data('next')
    return