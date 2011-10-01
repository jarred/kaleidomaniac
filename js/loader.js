(function() {
  var kaleido;
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.app = {};
  require.config({
    baseUrl: 'http://localhost:4104/js/'
  });
  require(['jquery.min', 'underscore-min'], function() {
    require(['backbone-min'], function() {
      require(['views.cell', 'views.post', 'main'], function() {
        kaleido.app.init();
      });
    });
  });
}).call(this);
