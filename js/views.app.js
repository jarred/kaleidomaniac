(function() {
  var kaleido;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.views || (kaleido.views = {});
  kaleido.views.AppView = Backbone.View.extend({
    events: {
      'click a': 'goingSomewhere'
    },
    speed: 200,
    ease: 'easeOutExpo',
    initialize: function(options) {
      $(window).bind('load', this.removePreloader);
    },
    goingSomewhere: function(e) {
      var $el;
      console.log('goingSomewhere?');
      if (e.target.nodeName !== 'A') {
        $el = $(e.target).parents('a');
      } else {
        $el = $(e.target);
      }
      if ($el.attr('target') === '_blank') {
        return;
      }
      if ($el.attr('href') === '#') {
        return;
      }
      if (e.metaKey || e.shiftKey || e.ctrlKey) {
        return;
      }
      if ($el.attr('href').indexOf('mailto:') >= 0) {
        return;
      }
      e.preventDefault();
      $('#preloader').removeClass('hide').animate({
        opacity: 1
      }, this.speed, this.ease, __bind(function() {
        window.location = $el.attr('href');
      }, this));
    },
    removePreloader: function(e) {
      $('#preloader').animate({
        opacity: 0
      }, this.speed, this.ease, __bind(function() {
        $('#preloader').addClass('hide');
      }, this));
    }
  });
}).call(this);
