kelido = window.Kelido ||= {}
kelido.app = {}

kelido.app.init = () ->
  if window.location.pathname is '/'
    console.log kelido.data.totalPages
    # window.location.pathname = '/page/' + Math.ceil(Math.random()*kelido.data.totalPages)
    # return
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