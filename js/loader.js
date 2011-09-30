(function() {
  var kelido;
  kelido = window.Kelido || (window.Kelido = {});
  kelido.app = {};
  require(['jquery.min', 'underscore-min'], function() {
    if (window.location.pathname === '/') {
      return window.location = $('.post').data('permalink');
    } else {
      require(['backbone-min', 'views.cell', 'views.post', 'main'], function() {
        kelido.app.init();
      });
    }
  });
}).call(this);
