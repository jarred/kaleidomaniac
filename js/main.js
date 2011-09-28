(function() {
  var kelido;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  kelido = window.Kelido || (window.Kelido = {});
  kelido.app = {};
  kelido.app.init = function() {
    if (window.location.pathname === '/') {
      window.location.pathname = '/page/' + Math.ceil(Math.random() * kelido.data.totalPages);
      return;
    }
    this.extendViews();
    $(window).unload(__bind(function() {
      $('#preloader').removeClass('hide').animate({
        opacity: 1
      }, 300);
    }, this));
  };
  kelido.app.extendViews = function() {
    _.each($('.extend'), __bind(function(node) {
      var $node, name, view;
      $node = $(node);
      name = $node.data('view');
      if (kelido.views[name] != null) {
        view = new kelido.views[name]({
          el: node
        });
        $node.removeClass('extend');
      }
    }, this));
  };
  $(document).bind('ready', __bind(function() {
    kelido.app.init();
  }, this));
}).call(this);
