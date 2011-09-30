(function() {
  var kaleido;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  kaleido = window.Kaleido || (window.Kaleido = {});
  kaleido.views || (kaleido.views = {});
  kaleido.views.PostView = Backbone.View.extend({
    margin: 10,
    events: {
      'click img': 'nextPost'
    },
    initialize: function(options) {
      _.bindAll(this, 'imageLoaded');
      this.$el = $(this.el);
      this.img = new Image();
      this.img.src = this.$el.data('image');
      this.$el.append("<div class=\"image-load\"></p>");
      $(this.img).load(this.imageLoaded);
      this.$('.image-load').append(this.img);
    },
    imageLoaded: function() {
      this.width = $(this.img).width();
      this.height = $(this.img).height();
      this.$('.image-load').remove();
      this.render();
    },
    render: function() {
      var across, cell, column, down, row;
      across = Math.ceil($(window).width() / (this.width - this.margin));
      down = Math.ceil($(window).height() / (this.height - this.margin));
      row = 0;
      while (row < down) {
        column = 0;
        while (column < across) {
          cell = new kaleido.views.CellView({
            width: this.width - this.margin,
            height: this.height - this.margin,
            margin: this.margin,
            xIndex: column,
            yIndex: row,
            className: 'cell',
            image: this.img.src
          });
          this.$el.append(cell.el);
          column++;
        }
        row++;
      }
      $('#preloader').animate({
        opacity: 0
      }, 300, __bind(function() {
        $('#preloader').addClass('hide');
      }, this));
    },
    nextPost: function(e) {
      e.preventDefault();
      if (kaleido.data.previousPost !== '') {
        window.location = kaleido.data.previousPost;
      } else {
        window.location = '/archive';
      }
    }
  });
}).call(this);
