(function() {
  var kaleido;
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.app = {};
  require.config({
    baseUrl: 'http://localhost:4104/js/'
  });
  require(['jquery.min', 'underscore-min'], function() {
    require(['backbone-min', 'jquery.easing'], function() {
      require(['views.cell', 'views.post', 'views.app', 'main'], function() {
        kaleido.app.init();
      });
    });
  });
}).call(this);
