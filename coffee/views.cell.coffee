kaleido = window.Kaleido ||= {}
kaleido.views ||= {}

kaleido.views.CellView = Backbone.View.extend
  speed: 400
  
  initialize: (options) ->
    @$el = $(@el)
    @margin = options.margin
    @xIndex = options.xIndex
    @yIndex = options.yIndex
    @$el.css
      width: options.width
      height: options.height
      left: options.width * options.xIndex
      top: options.height * options.yIndex
    @image = options.image
    @render()
    if options.xIndex%2
      @$el.addClass('flip-x')
    if options.yIndex%2
      @$el.addClass('flip-y')
      @$('img').css
        top: 0-@margin
    @animate()
    return
    
  render: () ->
    @$el.html("<img src=\"#{@image}\"/>")
    return
    
  animate: () ->
    return
    if @yIndex%2
      @$('img').animate
        left: 0-@margin
        top: 0
      , @speed
    else
      @$('img').animate
        left: 0-@margin
        top: 0-@margin
      , @speed
    return    