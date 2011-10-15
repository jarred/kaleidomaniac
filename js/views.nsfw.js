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
      this.$el.html("<div class=\"message\"> 	   <h4>This post is a bit sexy (#nsfw).</h4> 	   <p><a href=\"#\" class=\"always-show\">Always show these</a> or <a href=\"#\" class=\"skip\">Skip to the next post</a>.</p> 	 </div>");
      if (kaleido.data.previousPost !== '') {
        nextUrl = kaleido.data.previousPost;
      } else {
        nextUrl = '/archive';
      }
      this.$('a.skip').attr('href', nextUrl);
    },
    setNSFWcookie: function(e) {
      var cookie;
      e.preventDefault();
      this.$el.addClass('hide');
      cookie = {
        set: new Date()
      };
      $.cookie(kaleido.data.cookieKey, JSON.stringify(cookie), {
        expires: 14,
        domain: window.location.host,
        path: '/'
      });
    }
  });
}).call(this);
