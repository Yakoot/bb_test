// Generated by CoffeeScript 1.10.0
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

$(function() {
  var MenuView, menuView;
  MenuView = (function(superClass) {
    extend(MenuView, superClass);

    function MenuView() {
      return MenuView.__super__.constructor.apply(this, arguments);
    }

    MenuView.prototype.el = $("#menu");

    MenuView.prototype.timer = null;

    MenuView.prototype.initialize = function() {
      console.log("Menu View Initialized");
      _.bindAll(this, "render");
      return this.render();
    };

    MenuView.prototype.render = function() {
      return $.get("templates/menu.html", (function(_this) {
        return function(data) {
          var template;
          template = _.template(data);
          return $(_this.el).html(template());
        };
      })(this), "html");
    };

    MenuView.prototype.show_list = function() {
      return $(".menu-list").show();
    };

    MenuView.prototype.hide_list = function() {
      return $(".menu-list").hide();
    };

    MenuView.prototype.startTimer = function(callback) {
      clearTimeout(this.timer);
      return this.timer = setTimeout(callback, 500);
    };

    MenuView.prototype.mouseEnter = function() {
      console.log("enter");
      return this.startTimer(this.show_list);
    };

    MenuView.prototype.mouseLeave = function() {
      console.log("leave");
      return this.startTimer(this.hide_list);
    };

    MenuView.prototype.events = {
      'mouseenter .menu-item': 'mouseEnter',
      'mouseleave .menu-item': 'mouseLeave'
    };

    return MenuView;

  })(Backbone.View);
  return menuView = new MenuView;
});
