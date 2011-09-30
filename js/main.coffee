kaleido = window.Kaleido ||= {}
kaleido.app = {}

kaleido.app.init = () ->
  @extendViews()
  $(window).unload () =>
    $('#preloader').removeClass('hide').animate
      opacity: 1
    , 300
    return
  return
  
kaleido.app.extendViews = () ->
  _.each $('.extend'), (node) =>
    $node = $(node)
    name = $node.data('view')
    if kaleido.views[name]?
      view = new kaleido.views[name]
        el: node
      $node.removeClass('extend')
    return
  return