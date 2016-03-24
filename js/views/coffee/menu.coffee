class MenuView extends Backbone.View
    el: "#menu-panel"
    tagName: "div"

    initialize: ->
      console.log "Menu View Initialized"

    render: =>
      $.get "/bb/templates/menu.html", (data) =>
        @$el.html data
      , "html"
      @


menuView = new MenuView


