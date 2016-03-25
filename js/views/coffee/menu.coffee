$ ->
  class MenuView extends Backbone.View
      el: $ "#menu"
      timer: null

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

      startTimer: (callback) ->
        clearTimeout @timer
        @timer = setTimeout callback, 500

      mouseEnter: ->
        console.log "enter"

        @startTimer @show_list

      mouseLeave: ->
        console.log "leave"

        @startTimer @hide_list




      events:
        'mouseenter .menu-item': 'mouseEnter'
        'mouseleave .menu-item': 'mouseLeave'


  menuView = new MenuView


