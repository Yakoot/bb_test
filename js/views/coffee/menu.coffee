$ ->
  class MenuView extends Backbone.View

      showTimer: null
      hideTimer: null

      showDelay: 300
      hideDelay: 300

      currentItem: null

      initialize: ->
        @render()

      render: =>
        $.get "templates/menu.html", (data) =>
          template = _.template(data)
          $(@el).html template()
        , "html"

      show_list: (item) ->
        $(item).find(".menu-list").show()
        @hide_list @currentItem if @currentItem?
        @currentItem = item

      hide_list: (item) ->
        $(item).find(".menu-list").hide()
        @currentItem = null

      startTimer: (callback, target, delay) ->
        setTimeout ->
          callback(target)
        , delay

      mouseEnter: (e) ->
        target = e.target

        @showTimer = @startTimer @show_list, target, @showDelay
        console.log "showTimer = " + @showTimer

      mouseLeave: (e) ->
        target = e.target

        @hideTimer = @startTimer @hide_list, target, @hideDelay

        console.log "hideTimer = " + @hideTimer


      events:
        'mouseenter .menu-item': 'mouseEnter'
        'mouseleave .menu-item': 'mouseLeave'


  menuView = new MenuView({el: "#menu"})


