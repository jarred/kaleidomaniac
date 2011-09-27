(function() {
  var kelido;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  kelido = window.Kelido || (window.Kelido = {});
  kelido.views || (kelido.views = {});
  kelido.views.PostView = Backbone.View.extend({
    margin: 10,
    events: {
      'click img': 'randomPost'
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
      console.log('imageLoaded');
      this.width = $(this.img).width();
      this.height = $(this.img).height();
      this.$('.image-load').remove();
      console.log(this.width, this.height);
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
          cell = new kelido.views.CellView({
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
    randomPost: function(e) {
      e.preventDefault();
      window.location.pathname = '/page/' + Math.ceil(Math.random() * kelido.data.totalPages);
    }
  });
}).call(this);
