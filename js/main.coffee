kelido = window.Kelido ||= {}
kelido.app = {}

kelido.app.init = () ->
  @extendViews()
  $(window).unload () =>
    $('#preloader').removeClass('hide').animate
      opacity: 1
    , 300
    return
  return
  
kelido.app.extendViews = () ->
  _.each $('.extend'), (node) =>
    $node = $(node)
    name = $node.data('view')
    if kelido.views[name]?
      view = new kelido.views[name]
        el: node
      $node.removeClass('extend')
    return
  return