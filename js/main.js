(function() {
  var kaleido;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.app = {};
  kaleido.app.init = function() {
    this.appView = new kaleido.views.AppView({
      el: $('body')
    });
    this.extendViews();
  };
  kaleido.app.extendViews = function() {
    _.each($('.extend'), __bind(function(node) {
      var $node, name, view;
      $node = $(node);
      name = $node.data('view');
      if (kaleido.views[name] != null) {
        view = new kaleido.views[name]({
          el: node
        });
        $node.removeClass('extend');
      }
    }, this));
  };
}).call(this);
