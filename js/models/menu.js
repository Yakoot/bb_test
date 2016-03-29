// Generated by CoffeeScript 1.10.0
var Menu, Panel,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Menu = (function(superClass) {
  extend(Menu, superClass);

  function Menu() {
    return Menu.__super__.constructor.apply(this, arguments);
  }

  Menu.prototype.url = "backend.php";

  return Menu;

})(Backbone.Model);

Panel = (function(superClass) {
  extend(Panel, superClass);

  function Panel() {
    return Panel.__super__.constructor.apply(this, arguments);
  }

  Panel.prototype.model = Menu;

  return Panel;

})(Backbone.Collection);