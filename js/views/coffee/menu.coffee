$ ->
  class MenuView extends Backbone.View
      el: $ "#menu"

      initialize: ->
        console.log "Menu View Initialized"
        _.bindAll @, "render"
        @render()

      render: ->
        $.get "templates/menu.html", (data) =>
          template = _.template(data)
          $(@el).html template()
        , "html"

      show_list: ->
        $(".menu-list").show()

      hide_list: ->
        $(".menu-list").hide()

      events:
        'mouseenter .menu-item': 'show_list'
        'mouseleave .menu-item': 'hide_list'


  menuView = new MenuView


