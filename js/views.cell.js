(function() {
  var kelido;
  kelido = window.Kelido || (window.Kelido = {});
  kelido.views || (kelido.views = {});
  kelido.views.CellView = Backbone.View.extend({
    speed: 400,
    initialize: function(options) {
      this.$el = $(this.el);
      this.margin = options.margin;
      this.xIndex = options.xIndex;
      this.yIndex = options.yIndex;
      this.$el.css({
        width: options.width,
        height: options.height,
        left: options.width * options.xIndex,
        top: options.height * options.yIndex
      });
      this.image = options.image;
      this.render();
      if (options.xIndex % 2) {
        this.$el.addClass('flip-x');
      }
      if (options.yIndex % 2) {
        this.$el.addClass('flip-y');
        this.$('img').css({
          top: 0 - this.margin
        });
      }
      this.animate();
    },
    render: function() {
      this.$el.html("<img src=\"" + this.image + "\"/>");
    },
    animate: function() {
      if (this.yIndex % 2) {
        this.$('img').animate({
          left: 0 - this.margin,
          top: 0
        }, this.speed);
      } else {
        this.$('img').animate({
          left: 0 - this.margin,
          top: 0 - this.margin
        }, this.speed);
      }
    }
  });
}).call(this);
