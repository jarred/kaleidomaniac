kaleido = window.Kaleido ||= {}
kaleido.app = {}

kaleido.app.init = () ->
  @appView = new kaleido.views.AppView
    el: $('body')
  @extendViews()
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