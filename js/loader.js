(function() {
  var kelido;
  kelido = window.Kelido || (window.Kelido = {});
  kelido.app = {};
  require.config({
    baseUrl: 'http://jarred.github.com/kaleidomaniac/js/'
  });
  require(['jquery.min', 'underscore-min'], function() {
    require(['backbone-min', 'views.cell', 'views.post', 'main'], function() {
      kelido.app.init();
    });
  });
}).call(this);
