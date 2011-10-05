(function() {
  var kaleido;
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.app = {};
  require.config({
    baseUrl: 'http://localhost:4104/js/'
  });
  require(['jquery.min', 'underscore-min'], function() {
    require(['backbone-min', 'jquery.easing', 'jquery.cookie.min'], function() {
      require(['views.cell', 'views.post', 'views.app', 'views.nsfw', 'views.video', 'main'], function() {
        kaleido.app.init();
      });
    });
  });
}).call(this);
