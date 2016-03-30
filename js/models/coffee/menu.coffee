class Menu extends Backbone.Model

class Panel extends Backbone.Collection
  model: Menu
  url: "backend.php"