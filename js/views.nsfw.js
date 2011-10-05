(function() {
  var kaleido;
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.views || (kaleido.views = {});
  kaleido.views.NsfwView = Backbone.View.extend({
    events: {
      'click a.always-show': 'setNSFWcookie'
    },
    initialize: function(options) {
      var nextUrl;
      this.$el = $(this.el);
      if (kaleido.data.previousPost !== '') {
        nextUrl = kaleido.data.previousPost;
      } else {
        nextUrl = '/archive';
      }
      this.$('a.skip').attr('href', nextUrl);
    },
    setNSFWcookie: function(e) {
      e.preventDefault();
      this.$el.addClass('hide');
    }
  });
}).call(this);
